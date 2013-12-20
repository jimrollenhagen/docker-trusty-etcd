# Copyright 2013 Rackspace, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM jayofdoom/docker-ubuntu-14.04
MAINTAINER jim.rollenhagen@rackspace.com

RUN apt-get update
RUN apt-get install -y curl

# grab etcd
ENV ETCD_VERSION v0.2.0-rc3
ENV ETCD_FILE etcd-$ETCD_VERSION-Linux-x86_64
RUN curl --silent -L -o $ETCD_FILE.tar.gz https://github.com/coreos/etcd/releases/download/$ETCD_VERSION/$ETCD_FILE.tar.gz

# install and clean up
RUN tar -zxf $ETCD_FILE.tar.gz
RUN rm $ETCD_FILE.tar.gz
RUN mv $ETCD_FILE/etcd /usr/local/bin
RUN rm -rf $ETCD_FILE

# run it
EXPOSE 4001 7001
ENTRYPOINT ["/usr/local/bin/etcd"]
