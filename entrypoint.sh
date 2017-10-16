#!/bin/bash

function remove_link {
if [[ -L "$1" && -d "$1" ]]
then
ulink $1
fi
}

ln -fs /var/lib/dokuwiki/conf/users.auth.php /etc/dokuwiki/users.auth.php
ln -fs /var/lib/dokuwiki/conf/acl.auth.php /etc/dokuwiki/acl.auth.php
ln -fs /var/lib/dokuwiki/conf/local.php /etc/dokuwiki/local.php

ln -s /var/lib/dokuwiki/lib/plugins /usr/share/dokuwiki/lib/plugins
ln -s /var/lib/dokuwiki/lib/tpl /usr/share/dokuwiki/lib/tpl

remove_link /var/lib/dokuwiki/lib/tpl/tpl
remove_link /var/lib/dokuwiki/lib/tpl/plugins

apachectl -DFOREGROUND
