FROM debian:jessie

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y apache2
COPY resources/httpd.conf /etc/httpd/conf/httpd.conf

RUN apt-get install -y php5
COPY src/php/index.php /var/www/html/

RUN apt-get install -y open-cobol
RUN mkdir /cobol/
COPY src/cobol/sample.cbl /cobol/
RUN cobc -free -x -o sample /cobol/sample.cbl -L/usr/lib64/ -ldb

RUN apt-get clean

EXPOSE 8080

CMD apachectl -D FOREGROUND
