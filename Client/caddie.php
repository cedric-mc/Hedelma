<?php
session_start();
if (!isset($_SESSION['codeCli']) || empty($_SESSION['codeCli'])) {
    header('location:form_client.php');
    exit();
}
if (!isset($_SESSION['panier'])) {
    $_SESSION['panier'] = array();
}
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $productId = $_POST['productId'];
    $quantity = $_POST['quantity'];
    if ($quantity > 0) {
        $_SESSION['panier'][$productId] = $quantity;
    }
}
?>
<!DOCTYPE html>
<html>

<head>
    <title>Hedelma - Panier</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale = 1.0">
    <link rel="stylesheet" href="../style/style.css">
    <link rel="stylesheet" href="../style/shop.css">
    <style>
        #titre {
            text-align: center;
            padding: 50px;
            margin: 20px;
        }

        .phone-to-btn {
            width: 80%;
            display: block;
            margin: 20px;
            background-color: #42FF00;
            color: black;
            border-radius: 50px;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            align-self: flex-end;
        }

        .panier-titre {
            text-align: center;
            padding: 10px;
            margin: 0;
            margin-top: 20px;
        }
    </style>
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
    <h2 id="titre">Mon Panier</h2><br>
    <main>
        <div id="produits">
            <?php
            include("../hidden/connexion.inc.php");
            $cnx->query("SET search_path TO projet;");
            $prixTotal = 0;
            if (empty($_SESSION['panier'])) {
                echo "<br><h2 id='titre'>Le panier est vide</h2><br>";
            } else {
                foreach ($_SESSION['panier'] as $productId => $quantity) {
                    $requete = "SELECT v.codeVar, v.nomVar, v.nomArt, image_path, a.nom_Cat, prix, calibre
                    FROM variete v, article a, images i, couter c, saison s, tarif t, client cl
                    WHERE v.nomArt = a.nomArt 
                        AND v.codeVar = i.codeVar 
                        AND v.codeVar = c.codeVar 
                        AND s.nom = c.nom
                        AND CURRENT_DATE >= date_debut
                        AND CURRENT_DATE <= date_fin
                        AND c.nomTarif = t.nomTarif
                        AND cl.nomTarif = t.nomTarif
                        AND v.codeVar = '$productId';";
                    $resultat = $cnx->query($requete);
                    $ligne = $resultat->fetch(PDO::FETCH_OBJ);
                    $codevar = $ligne->codevar;
                    $nomvar = $ligne->nomvar;
                    $nomart = $ligne->nomart;
                    $image_path = $ligne->image_path;
                    $nom_cat = $ligne->nom_cat;
                    $prix = $ligne->prix;
                    $calibre = $ligne->calibre;
                    echo "<div class='produit-details'>";
                    echo "<div class='produit'>";
                    echo "<img src='$image_path' class='produit-image'>";
                    echo "<div class='produit-nom'>";
                    echo "<h2 class='panier-titre'>$nomart - $nomvar</h2>";
                    echo "</div>";
                    echo "<div class='produit-cat'>";
                    echo "<p>$nom_cat</p>";
                    echo "</div>";
                    echo "<div class='produit-quantite'>";
                    echo "<p>Quantité commandée : $quantity</p>";
                    echo "</div>";
                    echo "<div class='produit-prix-total'>";
                    echo "<p>Prix total : " . $prix * $quantity . " €</p>";
                    echo "</div>";
                    echo "</div>";
                    echo "</div>";
                    echo "<br>";
                    echo "<form action='suppr_product.php' method='POST'>";
                    echo "<input type='hidden' name='productId' value='$productId'>";
                    echo "<input type='submit' value='Supprimer' class='supprimer-btn'>";
                    echo "</form>";
                    echo "<br>";
                    echo "<hr>";
                    $prixTotal += $prix * $quantity;
                    $resultat->closeCursor();
                }
                echo "<br><br>";
                echo "<h2>Prix Total : $prixTotal €</h2><br>";
            }
            ?>
        </div>
        <br><br><br>
    </main>
    <button class="phone-to-btn">Appelez le 01 02 03 04 05 pour commander</button>
</body>

</html>