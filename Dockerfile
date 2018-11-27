# Image de base
FROM debian:jessie

# Actualisation et mise à jour des paquets
RUN apt-get update && apt-get upgrade

# Serveur HTTP Apache
RUN apt-get install -y apache2
COPY resources/httpd.conf /etc/httpd/conf/httpd.conf

# Page HTML utilisant l'applicatif COBOL
RUN apt-get install -y php
COPY src/php/index.php /var/www/html/

# Installation de l'applicatif COBOL (copie, compilation)
RUN apt-get install -y open-cobol
RUN mkdir /cobol/
COPY src/COBOL/myCOBOLapp.cbl /cobol/
RUN cobc -free -x -o myCOBOLapp /cobol/myCOBOLapp.cbl -L/usr/lib64/ -ldb

# Supprimer les paquets installés comme dépendances inutiles
RUN apt-get clean

# Démarrage d'Apache en foreground
CMD apachectl -D FOREGROUND

# Définition du port d'écoute
EXPOSE 8080
