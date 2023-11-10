<?php
session_start();
if (!isset($_SESSION['id_Emp']) || empty($_SESSION['id_Emp'])) {
    header('Location: form_entreprise.php');
    exit();
}
$num_com = $_GET['num_com'];
$id_Emp = $_SESSION['id_Emp'];
include("../hidden/connexion.inc.php");
$cnx->query("SET search_path TO projet;");
$req = "SELECT * FROM commande WHERE num_com = '$num_com';";
$resultat = $cnx->query($req);
$ligne = $resultat->fetch(PDO::FETCH_OBJ);
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
                <li><a href="commande.php">La commande</a></li>
                <li><a href="profile_employe.php">Mon profil</a></li>
            </ul>
        </div>
    </nav>
    <header>
        <div class="header">
            <h1>HEDELMA</h1>
            <h2>Le meilleur de la nature</h2>
        </div>
    </header>

    <div class="profil">
        <h2>La commande</h2>
        <?php
        echo "<p>Numéro de commande: " . $ligne->num_com . "</p>";
        echo "<p>Date de commande : " . $ligne->date_saisie . "</p>";
        echo "<p>Code client: " . $ligne->codecli . "</p>";
        echo "<p>Code employé: " . $ligne->id_emp . "</p>";
        echo "<p>Date de livraison prévue : " . $ligne->date_prevue . "</p>";

        $req = "SELECT V.codeVar, V.nomVar, C.prix, P.quantite, C.prix * P.quantite AS prix_total
        FROM COMMANDE CM
        JOIN posseder P ON CM.num_Com = P.num_Com
        JOIN VARIETE V ON P.codeVar = V.codeVar
        JOIN couter C ON V.codeVar = C.codeVar
        JOIN SAISON S ON C.nom = S.nom
        JOIN CLIENT CL ON CM.codeCli = CL.codeCli
        WHERE CL.nomTarif = C.nomTarif
            AND CURRENT_DATE BETWEEN S.date_debut AND S.date_fin
            AND CM.num_Com = $num_com;";
        $resultat = $cnx->query($req);
        $total_price = 0;

        echo "<h3>Produits dans la commande:</h3>";
        echo "<table>";
        echo "<tr><th>Nom du produit</th><th>Quantité</th><th>Prix unitaire</th></tr>";
        while ($ligne = $resultat->fetch(PDO::FETCH_OBJ)) {
            echo "<tr>";
            echo "<td>" . $ligne->nomvar . "</td>";
            echo "<td>" . $ligne->quantite . "</td>";
            echo "<td>" . $ligne->prix . "</td>";
            echo "</tr>";
            $total_price += $ligne->prix_total;
        }
        echo "</table>";

        echo "<p>Prix total: " . $total_price . " €</p>";
        ?>
    </div>

</body>

</html>