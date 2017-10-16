#!/bin/bash

ln -fs /var/lib/dokuwiki/conf/users.auth.php /etc/dokuwiki/users.auth.php
ln -fs /var/lib/dokuwiki/conf/acl.auth.php /etc/dokuwiki/acl.auth.php
ln -fs /var/lib/dokuwiki/conf/local.php /etc/dokuwiki/local.php

ln -fs /var/lib/dokuwiki/lib/plugins /usr/share/dokuwiki/lib/plugins
ln -fs /var/lib/dokuwiki/lib/tpl /usr/share/dokuwiki/lib/tpl

apachectl -DFOREGROUND