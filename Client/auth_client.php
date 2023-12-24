<?php
// Afficher les erreurs à l'écran
ini_set('display_errors', 1);
$login = $_POST['codeCli'];
$mdp = $_POST['mot_de_passe'];

include('../hidden/connexion.inc.php');
$cnx->query("SET search_path TO projet;");

$requete = "SELECT * FROM CLIENT WHERE codecli = '" . $login . "' and mot_de_passe = md5('$mdp');";
$resultat = $cnx->query($requete);
$yoo = $resultat->fetchColumn();

if ($yoo == $login) {
    session_start();
    $_SESSION['codeCli'] = $login;
    $_SESSION['mdp'] = $mdp;
    header('location:index.php');
} else {
    header('location:form_client.php');
}
?>