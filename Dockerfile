FROM debian:stretch

ENV DOKUWIKI_VERSION=2017-02-19e

ADD dokuwiki.conf /etc/apache2/sites-available/dokuwiki.conf
ADD /etc/dokuwiki.php /etc/dokuwiki/dokuwiki.php

RUN apt-get update && \
    apt-get install -y apache2 curl php7.0 libapache2-mod-php7.0 php7.0-mcrypt php7.0-cli

RUN curl -s -o dokuwiki.tgz https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz \
    && tar -xvzf ./dokuwiki.tgz \
    && rm -f ./dokuwiki.tgz

RUN cp -r ./dokuwiki-${DOKUWIKI_VERSION} /usr/share/dokuwiki \
    && chown :www-data -R /usr/share/dokuwiki \
    && rm -rf ./dokuwiki-${DOKUWIKI_VERSION}

RUN a2dissite 000-default \
    && a2ensite dokuwiki

EXPOSE 80

CMD ["apachectl -DFOREGROUND"]