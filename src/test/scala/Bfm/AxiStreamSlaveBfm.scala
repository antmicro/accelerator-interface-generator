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
import chisel3.Bits
import chisel3._
import chiseltest._
import scala.collection.mutable.ListBuffer

class AxiStreamSlaveBfm(val axi: AXIStream,
                        val println: String => Unit)
extends AxiStreamBfm {

  private var rxList: ListBuffer[BigInt] = new ListBuffer()

  private object State extends Enumeration {
    type State = Value
    val Idle, ReadData = Value
  }

  private var state = State.Idle

  private var tvalid: BigInt = 0
  private var tdata: BigInt = 0
  private var tuser: BigInt = 0
  private var tlast: BigInt = 0

  private def peekInputs(): Unit = {
    tvalid = axi.tvalid.peek().litValue
    tdata = axi.tdata.peek().litValue
    tuser = axi.tuser.peek().litValue
    tlast = axi.tlast.peek().litValue
  }

  def update(t: Long): Unit = {
    state match {
      case State.Idle => {
        axi.tready.poke(1.B)
        state = State.ReadData
      }
      case State.ReadData => {
        if(tvalid != 0) {
          rxList += tdata
        }
      }
    }
    peekInputs
  }

  def loadFromFile(filename: String): Unit = {
  }

  def saveToFile(filename: String): Unit = {
  }
}
