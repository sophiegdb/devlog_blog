<?php

echo 'Bienvenue sur le blog';

# == Frontcontroller == #
$action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_URL);
## Ici je stock toutes la/les requettes GET['action'] dans la variable $action
$routes = [
    # Crée un tableau un tableau associatif dans lequel je stock toutes les root possible avec une clé définit
    'home' => 'home.php',
    'contact' => 'contact.php',
    'about' => 'about.php'
    // ajouter des 'clés' => 'routes' routes ici
];
 if(!array_key_exists($action,$routes)){
     #Si la valeur $action ne correspond a aucunes des clés dans $route ALORS
     #l'action n'existe pas
     #affichage page 404
 }else{
     # SINON SI LA VALEUR $action = est égale a des clés de route[]
     # la variable page prendra la valeur de la clés qui correspond a la variable $action dans le tableau $routes
     $page = $routes[$action];
     include $page;
 }
