FROM centos:latest
MAINTAINER Simplepush <contact@simplepush.io>

ENV KEY ""
ENV CPU ""
ENV MEM ""
ENV DISK ""
ENV IDENTIFIER ""
ENV EVENT ""
ENV REPEAT "10m"

RUN yum -y install git; yum clean all
RUN git clone https://github.com/simplepush/alerta.git

CMD cd /alerta; while true; do sh alert.sh `if [ -n "$KEY" ]; then echo "-k ${KEY}"; fi` `if [ -n "$CPU" ]; then echo "-c ${CPU}"; fi` `if [ -n "$MEM" ]; then echo "-m ${MEM}"; fi` `if [ -n "$DISK" ]; then echo "-d ${DISK}"; fi` -f /mnt `if [ -n "$IDENTIFIER" ]; then echo "-i ${IDENTIFIER}"; fi` `if [ -n "$EVENT" ]; then echo "-e ${EVENT}"; fi`; sleep ${REPEAT}; done
