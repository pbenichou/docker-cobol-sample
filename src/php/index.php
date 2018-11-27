<!DOCTYPE HTML>
<html>
 <head>
  <meta charset="utf-8">
  <title>COBOL dans un conteneur !</title>
 </head>
 <body>
 <h1>HTTPD PHP COBOL</h1>
 <h2>Ceci est un exemple simple qui utilise PHP s'exécutant dans HTTPD pour appeler une application COBOL et imprimer la sortie standard COBOL ci-dessous :</h2>

<?php
    echo shell_exec("/sample");
?>

 </body>
</html>
