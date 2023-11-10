<?php
session_start();
// Vérifier si un numéro de commande est enregistré en session
if (isset($_SESSION['num_com']) && !empty($_SESSION['num_com'])) {
    // Rediriger vers la page panier.php
    header('Location: caddie.php');
    exit();
} else {
    // Rediriger vers la page creation_commande.php
    header('Location: creation_commande.php');
    exit();
}
?>