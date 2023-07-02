<?php
global $pdo;
/*echo 'hello world' ;*/

include "app/persistences/blogPostData.php" ;

var_dump(lastBlogPosts($pdo));
