<?php

//variabili e connessione a database

$dbhost = 'localhost'; //oppure 127.0.0.1
$dbuser = 'root'; //l'user è stabilito in automatico da XAMPP
$dbpass = '';
$db     = 'vendite';

$conn = new mysqli($dbhost, $dbuser, $dbpass, $db) or die("Non riesco a connettermi");


 //recupero elenco clienti dal database
 $sql = 'SELECT * FROM clienti ORDER BY cognome, nome';
 $clienti = $conn->query($sql); //ossia: vai sul database ed eseguimi il comando sql

?>
    
<html>
    <body>

      <h1>Elenco Clienti</h1>

      <table border=1> 
      <tr>
          <th>Nome</th> 
          <th>Cognome</th> 
          <th>Anno di nascita</th>
      </tr>


      <!-- Ciclo e stamp per ogni cliente --> 

      <?php
        while ($cl = $clienti->fetch_assoc()) { ?>

      <tr>
          <th><?php echo $cl['nome']; ?></th> 
          <th><?php echo $cl['cognome']; ?></th> 
          <th><?php echo $cl['anno_nascita']; ?></th>
      </tr>

        <?php } ?>

      </table>

     </body>  

</html>