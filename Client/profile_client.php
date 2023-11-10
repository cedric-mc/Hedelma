<?php
// Vérifier si l'utilisateur est connecté
session_start();
if (!isset($_SESSION['codeCli']) || empty($_SESSION['codeCli'])) {
    header('Location: form_client.php');
    exit();
}
$codeCli = $_SESSION['codeCli'];
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>HEDELMA</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="../style/style.css">
</head>

<body>
    <nav>
        <div class="logo">
            <img src="../img/logo.png" alt="Logo">
        </div>
        <div class="menu">
            <ul>
                <li><a href="index.php">Les Produits</a></li>
                <li><a href="caddie.php">Le Panier</a></li>
                <li><a href="profile_client.php">Mon Profil</a></li>
            </ul>
        </div>
    </nav>
    <header>
        <div class="header">
            <h1>HEDELMA</h1>
        </div>
    </header>

    <main>
        <div class="profil">
            <?php
            include('../hidden/connexion.inc.php');
            $cnx->query("SET search_path TO projet;");
            $req = "SELECT * FROM CLIENT WHERE codeCli = '$codeCli';";
            $resultat = $cnx->query($req);
            $ligne = $resultat->fetch(PDO::FETCH_OBJ);
            echo "<h2>Mes informations</h2>";
            echo "<p>Nom : " . $ligne->nomcli . "</p>";
            echo "<p>Prénom : " . $ligne->prenomcli . "</p>";
            echo "<p>Code Client : " . $ligne->codecli . "</p>";
            echo "<p>Adresse : " . $ligne->adresse . "</p>";
            $num_tel = $ligne->telephone;
            $formatted_num_tel = preg_replace('/(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/', '$1 $2 $3 $4 $5', $num_tel);
            echo "<p>Numéro de téléphone : " . $formatted_num_tel . "</p>";
            echo "<p>Statut : " . $ligne->nomtarif . "</p>";
            ?>
        </div>
    </main>
</body>

</html>