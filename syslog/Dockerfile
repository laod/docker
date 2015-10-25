FROM ubuntu
RUN apt-get update -q && \
    apt-get install rsyslog
CMD rsyslogd -n
VOLUME /dev
VOLUME /var/log
