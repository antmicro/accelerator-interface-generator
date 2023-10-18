# SBT parameters ##############################################################

SBT?=sbt
MAIN?=AIG.AcceleratorDriver
TB=ControllerSpec

###############################################################################

# Env var for FastVDMA ########################################################

TAG := $(shell cd src/fastvdma-chisel && git describe --tags --abbrev=0)
export TAG

###############################################################################

# Integration generation parameters ###########################################

CONFIG_FILE ?= "config.json"
CONFIG_ARG = $(if $(CONFIG_FILE),--config-path $(CONFIG_FILE),)

###############################################################################

# File paths ##################################################################

SCALA_SRC_DIR = $(PWD)/src/main/scala
INTEGRATION_DIR = $(SCALA_SRC_DIR)/AcceleratorIntegration
CSR_DIR = $(SCALA_SRC_DIR)/CSR/CustomCSRDefinition
INTEGRATION_FILES = $(INTEGRATION_DIR)/Accelerator.scala \
					$(INTEGRATION_DIR)/AcceleratorIntegration.scala \
					$(CSR_DIR)/CSRMap.scala \
					$(CSR_DIR)/RegistersDefinition.scala

###############################################################################

# Test image vars #############################################################

WIDTH=600
HEIGHT=398
IMG=test-img.gray

###############################################################################

verilog: setup
	$(SBT) "runMain $(MAIN)"

setup:
	python3 tools/gen/accelerator_integration/aig_gen.py $(CONFIG_ARG)

test: setup
	$(SBT) test
	convert -size $(WIDTH)x$(HEIGHT) -depth 8 out.rgba -alpha off out.png

cocotb_test: verilog
	pytest cocotb-tests

clean:
	$(SBT) clean
	rm -f *.v *.fir *.f *anno.json *.rgba *.png
	rm -frd test_run_dir/
	rm -f $(INTEGRATION_FILES)
	rm -df $(INTEGRATION_DIR)

%:
	sphinx-build -M $@ docs build $(SPHINXOPTS) $(0)

.PHONY: setup verilog cocotb_test