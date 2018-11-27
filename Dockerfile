FROM debian:jessie

RUN apt-get update && apt-get upgrade

RUN apt-get install -y apache2
COPY resources/httpd.conf /etc/httpd/conf/httpd.conf

RUN apt-get install -y php
COPY src/php/index.php /var/www/html/

RUN apt-get install -y open-cobol
RUN mkdir /cobol/
COPY src/cobol/sample.cbl /cobol/
RUN cobc -free -x -o sample /cobol/sample.cbl -L/usr/lib64/ -ldb

RUN apt-get clean

CMD apachectl -D FOREGROUND

EXPOSE 8080
