<?php
session_start();
if (!isset($_SESSION['codeCli']) || empty($_SESSION['codeCli']) || !isset($_GET['codevar']) || empty($_GET['codevar'])) {
    header('location:form_client.php');
    exit();
}
if (!isset($_SESSION['panier'])) {
    $_SESSION['panier'] = array();
}
$productId = $_GET['codevar'];
?>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="../style/style.css">
    <link rel="stylesheet" href="../style/product.css">
    <meta charset="UTF-8">
    <title>Produit</title>
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
    <main><br><br>
        <a class="btn-return" href="index.php">
            <button>Retour</button>
        </a>
        <div id="produit">
            <?php
            include("../hidden/connexion.inc.php");
            $cnx->query("SET search_path TO projet;");
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
            echo "<img class='image-produit' src='../img/$image_path' alt='Image du produit'>";
            echo "<div class='details-produit'>";
            echo "<div id='cat-calibre'>";
            echo "<p id='cat-produit'>$nom_cat</p>";
            echo "<p id='calibre'>Calibre $calibre</p>";
            echo "</div>";
            echo "<h2 class='product-name'>$nomart - $nomvar</h2>";
            echo "<p class='product-price'>$prix € / kg</p>";
            echo "</div>";
            $resultat->closeCursor();
            ?>
            <form method="POST" action="caddie.php">
                <input type="hidden" name="productId" value="<?php echo $productId; ?>">
                <div class="quantity-container">
                    <input class="quantity-input" type="number" name="quantity" min="0" value="1"> kg
                </div><br><br>
                <button type="submit" class="add-to-cart-btn">Ajouter au panier</button>
            </form>
        </div>
    </main>
</body>

</html>