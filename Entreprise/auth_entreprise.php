<?php
$login = $_POST['id_Emp'];
$mdp = $_POST['mot_de_passe'];

include('../hidden/connexion.inc.php');
$cnx->query("SET search_path TO projet;");

$requete = "SELECT * FROM employe WHERE id_emp = '" . $login . "' and mot_de_passe = md5('$mdp');";
$resultat = $cnx->query($requete);
$yoo = $resultat->fetchColumn();

if ($yoo == $login) {
    session_start();
    $_SESSION['id_Emp'] = $login;
    $_SESSION['mdp'] = $mdp;
    header('location:index.php');
} else {
    header('location:form_entreprise.php');
}
?>