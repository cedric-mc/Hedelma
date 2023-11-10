<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $productId = $_POST['productId'];
    unset($_SESSION['panier'][$productId]);
}

header('Location: caddie.php');
exit();
?>