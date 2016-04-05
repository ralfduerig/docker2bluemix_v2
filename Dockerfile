#  Copyright 2014 IBM
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

# pull the latest IBM liberty image from registry
FROM registry.ng.bluemix.net/ibmliberty:latest

# copy webapplication to /root/ directory
ADD rd1.war /root/
ADD id_rsa.pub /root/

# install it to liberty 
RUN cp /root/rd1.war /opt/ibm/wlp/usr/servers/defaultServer/dropins/

# copy ssh keys for login 
# COPY id_rsa.pub /root/.ssh/
RUN mkdir /root/.ssh
RUN cp /root/id_rsa.pub /root/.ssh/id_rsa.pub
RUN chmod 700 /root/.ssh/id_rsa.pub
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
RUN cat /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/id_rsa.pub
RUN ls -la /root/.ssh/

# expose 9080 liberty and ssh port
EXPOSE 9080 22 

# end of dockerfile



