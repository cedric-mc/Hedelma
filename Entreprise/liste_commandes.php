<?php
// Vérifier si l'utilisateur est connecté
session_start();
if (!isset($_SESSION['id_Emp']) || empty($_SESSION['id_Emp'])) {
    header('Location: form_entreprise.php');
    exit();
}
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>HEDELMA</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <nav class="navbar">
        <a href="#" class="logo">HEDELMA</a>
        <div class="nav-links">
            <ul>
                <li><a href="liste_commandes.php">Les Commandes</li>
                <li><a href="index.php">Les produits</a></li>
                <li><a href="commande.php">La Commande</a></li>
                <li><a href="profile_employe.php">Mon profil</a></li>
            </ul>
        </div>
    </nav>
    <header>
        <h1>Les commandes</h1>
    </header>

    <div class="liste-commande">
        <h2>Liste des commandes</h2>
        <?php
        include("../hidden/connexion.inc.php");
        $cnx->query("SET search_path TO projet;");
        $results = $cnx->query('SELECT num_com FROM commande;');
        while ($ligne = $results->fetch(PDO::FETCH_OBJ)) {
            echo "<a class='num-commande' href='la_commande.php?num_com=" . $ligne->num_com . "'>";
            echo "<p>Commande n° : " . $ligne->num_com . "</p>";
            echo "</a>";
        }
        $results->closeCursor();
        ?>
    </div>
</body>

</html>