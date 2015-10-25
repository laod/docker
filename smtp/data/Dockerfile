FROM ubuntu

RUN apt-get update && \
    apt-get upgrade -y && \

    echo "postfix postfix/mailname string your.hostname.com" | debconf-set-selections && \
    echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections && \
    apt-get install -y postfix && \
    apt-get clean && \

    ln -s /etc/aliases /etc/postfix/aliases && \
    newaliases && \

    cp -a /etc/hosts /etc/localtime /etc/nsswitch.conf /etc/resolv.conf /etc/services /etc/ssl /var/spool/postfix/etc/

VOLUME ["/etc/postfix","/var/spool","/var/log","/home"]

CMD echo starting postfix data container
