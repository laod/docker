#!/bin/bash
/usr/sbin/postconf -e "mydomain = ${mydestination}"
/usr/sbin/postconf -e 'myorigion = $mydomain'
/usr/sbin/postconf -e "mydestination = ${mydestination},localhost"
/usr/sbin/postconf -e "home_mailbox = mail/"
/usr/lib/postfix/master -d
