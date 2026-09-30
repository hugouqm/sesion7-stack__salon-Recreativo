FROM php:8.3-apache

RUN docker-php-ext-install mysqli

RUN printf "ServerTokens Prod\nServerSignature Off\n" > /etc/apache2/conf-available/zz-security.conf \
    && a2enconf zz-security

RUN printf "expose_php=Off\n" > /usr/local/etc/php/conf.d/security.ini

COPY src/ /var/www/html/