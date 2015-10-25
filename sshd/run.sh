#!/bin/bash

mkdir -p /var/run/sshd
echo -e 'y\n' |ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
exec /usr/sbin/sshd -D
