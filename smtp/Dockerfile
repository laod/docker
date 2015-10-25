FROM ubuntu

RUN apt-get update && \
    apt-get upgrade -y && \

    echo "postfix postfix/mailname string your.hostname.com" | debconf-set-selections && \
    echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections && \
    apt-get install -y postfix && \
    apt-get clean

COPY run.sh /run.sh

CMD /run.sh
