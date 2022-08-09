import scala.collection.mutable.ListBuffer

object renodeSimGen{
    // These are going to be predefined either as env variables 
    // or by build.sbt file (they're defined locally to allow
    // easier development of this single component)
    val inConf = "AXI_AXIL_AXIS"
    val outConf = "AXIS_AXIL_AXI"
    val in = inConf.split("_")
    val out = outConf.split("_")
    val controlDataWidth = 32
    
    val reader = in(0)
    val csr = in(1)
    val writer = out(2)


// Map FastVDMA/Accelerator buses to Renode equivalents
    var renodeBuses = Map(
        ("AXI", "AXIL", "AXI") -> ("AxiSlave", "AxiLite", "AxiSlave")
    )
    
    def getRenodeBuses() : ((String, String, String)) = {
        try {
          renodeBuses.apply((reader, csr, writer))
        }
        catch {
          case ex :Exception => throw new Exception("Requested unsupported bus: " + (reader, csr, writer));
        }
    }

    var renodeIncludes = Map(
        "Axi" -> "axi.h",
        "AxiSlave" -> "axi-slave.h",
        "AxiLite" -> "axilite.h",
        "AxiLiteInitiator" -> "axilite-initiator.h",
        "Wishbone" -> "wishbone.h",
        "WishboneInitiator" -> "wishbone-initiator"
    )

    def getRenodeIncludes(renodeConf: (String, String, String)) : ListBuffer[String] = {
        try {
          val renodePluginRoot = "\"src/buses/"
          val (r, c, w) = renodeConf
          val includes = new ListBuffer[String]()
          for (bus <- Seq(r, c, w))
            includes += "#include " + renodePluginRoot + renodeIncludes.apply(bus) + "\""
          includes.distinct
        }
        catch {
          case ex :Exception => throw new Exception("Requested unsupported Renode buses: " + renodeConf);
        }
    }

    val busIncludes = getRenodeIncludes(getRenodeBuses()).mkString("\n")

    val simMainHeaders = s"""
//
// Copyright (c) 2010-2022 Antmicro
//
//  This file is licensed under the MIT License.
//  Full license text is available in 'LICENSE' file.
//
#include <verilated.h>
#include <bitset>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "VAIGTop.h"
#include "src/renode_bus.h"
$busIncludes
#if VM_TRACE_VCD
# include <verilated_vcd_c.h>
# define VERILATED_DUMP VerilatedVcdC
# define DEF_TRACE_FILEPATH "simx.vcd"
#elif VM_TRACE_FST
# include <verilated_fst_c.h>
# define VERILATED_DUMP VerilatedFstC
# define DEF_TRACE_FILEPATH "simx.fst"
#endif

RenodeAgent *acc;
VAIGTop *top = new VAIGTop;
vluint64_t main_time = 0;

#if VM_TRACE
VERILATED_DUMP *tfp;
#endif

void eval() {
#if VM_TRACE
        main_time++;
        tfp->dump(main_time);
        tfp->flush();
#endif
    top->eval();
    acc->handleInterrupts();
}
    """

    def main(args: Array[String]) = {
        // val fileWriter = new FileWriter(new File("sim_main.cpp"))
        // fileWriter.write()
        println(simMainHeaders)
    }
}