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
# use this for region UK
# FROM registry.eu-gb.bluemix.net/ibmliberty:latest
# use this for region US
FROM registry.ng.bluemix.net/ibmliberty:latest

# copy webapplication to /root/ directory
ADD rd1.war /root/
# install it to liberty 
RUN cp /root/rd1.war /opt/ibm/wlp/usr/servers/defaultServer/dropins/
# ENV LICENSE accept


# copy ssh keys for login 
COPY cloud.key.pub /root/.ssh/
RUN cat /root/.ssh/cloud.key.pub >> /root/.ssh/authorized_keys
## just check content of files
# RUN ls -la /root/.ssh/
# RUN cat /root/.ssh/authorized_keys

# expose 9080 liberty and ssh port
EXPOSE 9080 22 

## get and install openssh 
#RUN apt-get update
#RUN apt-get install -y openssh-server
#RUN mkdir /var/run/sshd
## start ssh deamon
#CMD ["/usr/sbin/sshd", "-D"]

# end of dockerfile



