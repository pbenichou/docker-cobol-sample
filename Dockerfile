FROM debian:jessie

RUN apt-get update && apt-get upgrade
RUN apt-get install open-cobol
RUN apt-get install db4 db4-devel
RUN apt-get install httpd
RUN apt-get install php

ADD resources/httpd.conf /etc/httpd/conf/httpd.conf 
ADD src/php/index.php /var/www/html/

RUN mkdir /cobol/
ADD src/COBOL/myCOBOLapp.cbl /cobol/

RUN cobc -free -x -o myCOBOLapp /cobol/myCOBOLapp.cbl -L/usr/lib64/ -ldb

RUN chmod -R 755 /etc/httpd/
RUN chmod -R 755 /var/www/

ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 8080
