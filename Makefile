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

all:check_all
	cp template/GolgiWebRTC-EP.js.template /tmp
	sed -i.bak s/DEV_KEY/$(shell (cat Golgi.DevKey | tr -d ' \r\n'))/g /tmp/GolgiWebRTC-EP.js.template
	sed -i.bak s/APP_KEY/$(shell (cat Golgi.AppKey | tr -d ' \r\n'))/g /tmp/GolgiWebRTC-EP.js.template
	mv /tmp/GolgiWebRTC-EP.js.template GolgiWebRTC-EP.js
	java -classpath ~/Golgi-Pkg/LATEST/common/garrick_combined.jar com.openmindnetworks.golgi.garrick.Garrick -i GolgiWebRTC.thrift -jsf ./GolgiWebRTC.js

check_all:
	@if [ ! -d ~/Golgi-Pkg ]; then \
		echo "Makefile expects Golgi SDK to be installed at ~/Golgi-Pkg"; \
		echo "Login at https://devs.golgi.io and download the SDK"; \
                exit 2; \
	fi
	@if [ ! -f Golgi.DevKey ]; then \
		echo Create Golgi.DevKey file and add your Golgi Developer key to it; \
		exit 2; \
	fi
	@if [ ! -f Golgi.AppKey ]; then \
		echo Create Golgi.AppKey file and add your Golgi Application key to it; \
		exit 2; \
	fi


clean:
	rm -f GolgiWebRTC.js
	rm -f GolgiWebRTC-EP.js
