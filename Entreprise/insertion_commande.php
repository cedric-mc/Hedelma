<?php
session_start();
if (!isset($_SESSION['id_Emp']) || empty($_SESSION['id_Emp'])) {
    header('location:form_entreprise.php');
    exit();
}
if (!isset($_SESSION['num_com']) || empty($_SESSION['num_com'])) {
    header('location:creation_commande.php');
    exit();
}
if (!isset($_SESSION['panier'])) {
    header('location:index.php');
    exit();
}
$num_com = $_SESSION['num_com'];
$panier = $_SESSION['panier'];
include("../hidden/connexion.inc.php");
$cnx->query("SET search_path TO projet;");

$requete = "SELECT num_Com FROM commande WHERE num_Com = '$num_com';";
$resultat = $cnx->query($requete);
$ligne = $resultat->fetch(PDO::FETCH_OBJ);
if ($ligne == false) {
    header('location:num_commande.php');
    exit();
}
$resultat->closeCursor();
foreach ($panier as $productId => $quantity) {
    $requete = "SELECT codevar FROM variete WHERE codeVar = '$productId';";
    $resultat = $cnx->query($requete);
    $ligne = $resultat->fetch(PDO::FETCH_OBJ);
    $codevar = $ligne->codevar;
    $resultat->closeCursor();
    $requete = "INSERT INTO posseder (num_com, codevar, quantite) VALUES ('$num_com', '$codevar', '$quantity');";
    $cnx->exec($requete);
    $requete = "UPDATE stock SET quantite = quantite - $quantity WHERE codeVar = '$codevar';";
    $cnx->exec($requete);
}
unset($_SESSION['panier']); // on supprime le panier de la session
unset($_SESSION['num_com']); // on supprime le numéro de commande de la session
header('location:index.php');
?>