<?php

try { //pour se connecter à la BDD
    $pdo = new PDO('mysql:host=localhost;dbname=blog', 'sophiedebreuvand', 'Pidoudu69');
   //var_dump('connect bdd'); //affichage

   //attrape l'erreur et l'affiche
} catch (PDOException $e) {
    print "Erreur !: " . $e->getMessage() . "<br/>";
    die();
}
