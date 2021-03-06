
Manually:

```
  docker run -d --name syslog -v /tmp/syslogdev:/dev loophole/syslog
  docker run -d --name mx-data loophole/smtp-data
  docker run -d --name mx --volumes-from mx-data -v /tmp/syslogdev/log:/var/spool/postfix/dev/log -p 25:25 -e "mydestination=mydomain.tld" loophole/smtp-private
  docker run -d --name sshd --volumes-from mx-data -p 2697:22 loophole/sshd-private`
```

Automagically: `docker-compose up -d`

The idea is to set up users, passwords, secrets in private images. The private images are made by running the base image and making and committing chnages.

Example:

```
  docker run -d --name mx --volumes-from mx-data -v /tmp/syslogdev/log:/var/spool/postfix/dev/log -p 25:25 -e "mydestination=mydomain.tld" loophole/smtp
  exec in and create users, edit aliases, etc
  docker commit mx
  docker tag <image hash from commit> loophole/smtp-private
  docker stop mx && docker rm mx
```

Intention is to mount maildir remotely via sshfs

Can check mail by execing in to mx, installing mutt, configuring ~/.muttrc for your user as:

```
set mbox_type=Maildir
set folder="~/mail"
set mask="!^\\.[^.]"
set mbox="~/mail"
set record="+.Sent"
set postponed="+.Drafts"
set spoolfile="~/mail"

mailboxes `echo -n "+ "; find ~/mail -maxdepth 1 -type d -name ".*" -printf "+'%f' "`

macro index c "<change-folder>?<toggle-mailboxes>" "open a different folder"
macro pager c "<change-folder>?<toggle-mailboxes>" "open a different folder"

macro index C "<copy-message>?<toggle-mailboxes>" "copy a message to a mailbox"
macro index M "<save-message>?<toggle-mailboxes>" "move a message to a mailbox"

macro compose A "<attach-message>?<toggle-mailboxes>" "attach message(s) to this message"
```

and running mutt
