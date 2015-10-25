FROM ubuntu

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -qy openssh-server && \
    apt-get clean

COPY run.sh /run.sh

CMD /run.sh
