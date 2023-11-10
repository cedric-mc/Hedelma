<?php
session_start();
if (!isset($_SESSION['id_Emp']) || empty($_SESSION['id_Emp'])) {
    header('Location: form_employe.php');
    exit();
}
$id_Emp = $_SESSION['id_Emp'];
?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Hedelma - Mon profil</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <header>
        <nav class="navbar">
            <a href="#" class="logo">HEDELMA</a>
            <div class="nav-links ">
                <ul>
                    <li><a href="liste_commandes.php">Les Commandes</li>
                    <li><a href="index.php">Les produits</a></li>
                    <li><a href="commande.php">La commande</a></li>
                    <li><a href="profile_employe.php">Mon profil</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="profil">
        <h2>Mes informations</h2>
        <?php
        include('../hidden/connexion.inc.php');
        $cnx->query("SET search_path TO projet;");
        $req = "SELECT * FROM EMPLOYE WHERE id_Emp= '$id_Emp';";
        $resultat = $cnx->query($req);
        $ligne = $resultat->fetch(PDO::FETCH_OBJ);
        echo "<p>Prénom : " . $ligne->prenom_emp . "</p>";
        echo "<p>Nom : " . $ligne->nom_emp . "</p>";
        echo "<p>Date de naissance : " . date("d/m/Y", strtotime($ligne->datenaissance)) . "</p>";
        echo "<p>Date d'embauche : " . date("d/m/Y", strtotime($ligne->date_embauche)) . "</p>";
        if ($ligne->date_fin_embauche != NULL) {
            echo "<p>Date de fin d'embauche : " . date("d/m/Y", strtotime($ligne->date_fin_embauche)) . "</p>";
        }
        echo "<p>Type de contrat : " . $ligne->type_contrat . "</p>";
        ?>
    </div>

</body>

</html>