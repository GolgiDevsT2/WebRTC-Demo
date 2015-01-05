#
# This Software (the "Software") is supplied to you by Openmind Networks
# Limited ("Openmind") your use, installation, modification or
# redistribution of this Software constitutes acceptance of this disclaimer.
# If you do not agree with the terms of this disclaimer, please do not use,
# install, modify or redistribute this Software.
#
# TO THE MAXIMUM EXTENT PERMITTED BY LAW, THE SOFTWARE IS PROVIDED ON AN
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, EITHER
# EXPRESS OR IMPLIED INCLUDING, WITHOUT LIMITATION, ANY WARRANTIES OR
# CONDITIONS OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS FOR A
# PARTICULAR PURPOSE.
#
# Each user of the Software is solely responsible for determining the
# appropriateness of using and distributing the Software and assumes all
# risks associated with use of the Software, including but not limited to
# the risks and costs of Software errors, compliance with applicable laws,
# damage to or loss of data, programs or equipment, and unavailability or
# interruption of operations.
#
# TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW OPENMIND SHALL NOT
# HAVE ANY LIABILITY FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, WITHOUT LIMITATION,
# LOST PROFITS, LOSS OF BUSINESS, LOSS OF USE, OR LOSS OF DATA), HOWSOEVER 
# CAUSED UNDER ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
# WAY OUT OF THE USE OR DISTRIBUTION OF THE SOFTWARE, EVEN IF ADVISED OF
# THE POSSIBILITY OF SUCH DAMAGES.
#

namespace javascript GolgiWebRTC
namespace java GolgiWebRTC

struct offer {
    1:required string sdp,
    2:required string senderId
}

struct answer {
    1:required string sdp
}

struct iceCandidate {
    1:required string label,
    2:required string id,
    3:required string candidate
}

service GolgiWebRTC {
    void sendOffer(1:offer offerReq),
    void sendAnswer(1:answer answerReq),
    void sendIceCandidate(1:iceCandidate iceCandidateReq),
    void endCall(1:string roomId)
}

