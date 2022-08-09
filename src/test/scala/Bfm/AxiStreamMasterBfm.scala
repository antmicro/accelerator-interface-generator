/*
Copyright (C) 2019-2022 Antmicro

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

SPDX-License-Identifier: Apache-2.0
*/

package AIG.Bfm

import DMAController.Bus._
import chisel3._
import chiseltest._
import java.nio._

import scala.collection.mutable.ListBuffer

class AxiStreamMasterBfm(val axi: AXIStream,
                        val packetLen: Int,
                        val println: String => Unit) 
extends AxiStreamBfm {

  private var txList: ListBuffer[Int] = new ListBuffer()

  private object State extends Enumeration {
    type State = Value
    val Idle, WriteData= Value
  }

  private var state = State.Idle

  private var wordCnt: Int = 0

  private var tready: BigInt = 0

  def loadFromFile(filename: String): Unit = {
    val path = file.Paths.get(filename)
    val buffer = file.Files.readAllBytes(path)
    val bb = ByteBuffer.wrap(buffer)
    //bb.order(ByteOrder.nativeOrder)
    var buf = new Array[Int](buffer.length/4)
    bb.asIntBuffer.get(buf)
    for(i <- 0 until buf.length) {
      txList += buf(i)
    }
    println("AXI Stream BFM, file %s, %d words".format(filename, buf.length))
  }

  def saveToFile(filename: String): Unit = {
  }

  private def peekInputs(): Unit = {
    tready = axi.tready.peek().litValue
  }

  private def putData(): Unit = {
    axi.tdata.poke(txList.remove(0).U)
  }

  private def updateTlast(): Unit = {
    if(wordCnt == packetLen - 1) {
      axi.tlast.poke(1.B)
    } else {
      axi.tlast.poke(0.B)
    }
  }

  def update(t: Long): Unit = {
    state match {
      case State.Idle => {
        if(txList.nonEmpty) {
          axi.tvalid.poke(1.B)
          state = State.WriteData
          putData
          updateTlast
        }
      }
      case State.WriteData => {
        if(tready != 0) {
          if(txList.nonEmpty) {
            putData
            updateTlast
            if(wordCnt == packetLen) {
              wordCnt = 0
            } else {
              wordCnt += 1
            }
          } else {
            axi.tvalid.poke(0.B)
            state = State.Idle
          }
        }
      }
    }
    peekInputs
  }
}
