<?php
session_start();
if (!isset($_SESSION['id_Emp']) || empty($_SESSION['id_Emp'])) {
    header('Location: form_entreprise.php');
    exit();
}
$id_Emp = $_SESSION['id_Emp'];
?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Commande</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <header>
        <nav class="navbar">
            <a href="#" class="logo">HEDELMA</a>
            <div class="nav-links ">
                <ul>
                    <li><a href="liste_commandes.php">Les Commandes</li>
                    <li><a href="commande.php">La commande</a></li>
                    <li><a href="index.php">Les produits</a></li>
                    <li><a href="profile_employe.php">Mon profil</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="creation">
        <h2>Créer la commande</h2>
        <form action="traitement_commande.php" method="POST">
            <label for="code_client">Code client :</label>
            <input type="text" id="code_client" name="code_client">
            <input type="submit" value="Créer commande">
        </form>
    </div>

</body>

</html>