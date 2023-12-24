<?php
$user = "";
$password = "";
$server = "";
$bdd = "";
$system = "";
try {
    $cnx = new PDO("$system:host=$server;dbname=$bdd", $user, $password);
} catch (PDOException $e) {
    echo "ERREUR : La connexion a échouée<br>";
    echo "Error: $e<br>";
}
?>