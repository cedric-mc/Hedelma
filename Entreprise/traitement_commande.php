<?php
session_start();
if (!isset($_SESSION['id_Emp']) || empty($_SESSION['id_Emp'])) {
    header('Location: form_entreprise.php');
    exit();
}

// inclure la connexion à la base de données
include("../hidden/connexion.inc.php");
$cnx->query("SET search_path TO projet;");

// récupérer les données de la commande
if (isset($_POST['code_client']) && !empty($_POST['code_client'])) {
    $codeCli = $_POST['code_client'];
    $requete = "SELECT * FROM client WHERE codecli = '$codeCli';";
    $resultat = $cnx->query($requete);
    $yoo = $resultat->fetchColumn();
    if ($yoo != $codeCli) {
        header('Location: creation_commande.php');
        exit();
    }
} else {
    header('Location: creation_commande.php');
    exit();
}

$id_Emp = $_SESSION['id_Emp'];

// obtenir le numéro de commande
$query = "SELECT COUNT(*) AS num FROM commande";
$result = $cnx->query($query);
$row = $result->fetch(PDO::FETCH_ASSOC);
$num_com = $row['num'];

// insérer la nouvelle commande dans la base de données
$num_com++;
$date_saisie = date('Y-m-d H:i:s');
$date_prevue = date('Y-m-d', strtotime($date_saisie . '+3 days'));

$query = "INSERT INTO commande (num_com, date_prevue, date_saisie, codeCli, id_emp) VALUES ($num_com, '$date_prevue', NOW(), '$codeCli', '$id_Emp')";
$stmt = $cnx->query($query);

// rediriger vers la page de confirmation
$_SESSION['num_com'] = $num_com;
header('Location: caddie.php');
exit();
?>