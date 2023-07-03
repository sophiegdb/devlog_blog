<?php

function lastBlogPosts(){
    include 'config/database.php';
    //on peut juste faire return [];
    $array = [];


   //requête sql / metod, prépare pour faire requete bdd
    $stmt = $pdo->prepare('SELECT * FROM ARTICLES INNER JOIN AUTHOR ON ARTICLES.AUTHOR_id=AUTHOR.id ORDER BY ARTICLES.id DESC LIMIT 10');
    // <-- Automatically sanitized for SQL by PDO
    //$stmt->bindParam(':id', $id, PDO::PARAM_INT);
    //executer la requête
    $stmt->execute();
    $result = $stmt->fetchAll();


    return $result ;
}
