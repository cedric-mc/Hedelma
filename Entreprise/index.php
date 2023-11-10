<?php
session_start();
if (!isset($_SESSION['id_Emp']) || empty($_SESSION['id_Emp'])) {
    header('location:form_entreprise.php');
    exit();
}
if (!isset($_SESSION['panier'])) {
    $_SESSION['panier'] = array();
}

include("../hidden/connexion.inc.php");
$cnx->query("SET search_path TO projet;");
?>
<html>

<head>
    <title>Hedelma</title>
    <link rel="stylesheet" href="../style/style.css">
    <link rel="stylesheet" href="../style/shop.css">
    <link rel="stylesheet" href="../style/filtre.css">
    <style>
        main {
            margin-top: 50px;
        }

        #btn-retour-haut {
            display: none;
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 99;
            font-size: 18px;
            border: none;
            outline: none;
            background-color: #333;
            color: white;
            cursor: pointer;
            padding: 15px;
            border-radius: 4px;
        }

        a {
            text-decoration: none;
            color: black;
        }
    </style>
    <meta charset="UTF-8">
</head>

<body>
    <nav>
        <div class="logo">
            <img src="../img/logo.png" alt="Logo">
        </div>
        <div class="menu">
            <ul>
                <li><a href="liste_commandes.php">Les Commandes</li>
                <li><a href="commande.php">La commande</a></li>
                <li><a href="index.php">Les Produits</a></li>
                <li><a href="profile_employe.php">Mon Profil</a></li>
            </ul>
        </div>
    </nav>
    <main>
        <section id="left-side">
            <h1>FILTRES</h1>
            <form method="post" action="">
                <div id="type">
                    <h2>Type</h2>
                    <input type="radio" name="type" value="fruit">Fruits<br>
                    <input type="radio" name="type" value="vegetable">Légumes<br>
                </div>
                <div id="prix">
                    <h2>Prix</h2>
                    <input type="number" id="prixMin" name="prixMin" placeholder="min"> € -
                    <input type="number" id="prixMax" name="prixMax" placeholder="max"> €
                </div>
                <div id="boutons">
                    <input type="submit" name="submit" value="Filtrer">
                    <input type="reset" value="Reset">
                </div>
            </form>
            <?php
            if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['type']) && isset($_POST['prixMin']) && isset($_POST['prixMax']) && isset($_POST['submit'])) {
                $type = $_POST['type'];
                $prixMin = $_POST['prixMin'];
                $prixMax = $_POST['prixMax'];
            } else {
                $type = "";
                $prixMin = "";
                $prixMax = "";
            }
            ?>
        </section>
        <div id="produits">
            <form method="post" id="recherche">
                <input type="text" name="recherche" placeholder="Rechercher...">
                <button type="submit">Rechercher</button>
            </form>
            <?php
            if (isset($_POST['recherche'])) {
                $recherche = $_POST['recherche'];
                // Effectuer la recherche et afficher les résultats ici
                echo "Vous avez cherché : " . $recherche . "<br><br>";
                $requete = "SELECT v.codeVar, v.nomVar, v.nomArt, image_path, a.nom_Cat, prix
                FROM variete v, article a, images i, couter c, saison s, tarif t, client cl
                WHERE v.nomArt = a.nomArt 
                    AND v.codeVar = i.codeVar 
                    AND v.codeVar = c.codeVar 
                    AND s.nom = c.nom
                    AND CURRENT_DATE >= date_debut
                    AND CURRENT_DATE <= date_fin
                    AND c.nomTarif = t.nomTarif
                    AND cl.nomTarif = t.nomTarif
                    AND (v.nomVar ILIKE '%$recherche%' OR v.nomArt ILIKE '%$recherche%' OR a.nom_Cat ILIKE '%$recherche%')
                ORDER BY nomart, nomvar, nom_cat;";
                $resultat = $cnx->query($requete);
                while ($ligne = $resultat->fetch(PDO::FETCH_OBJ)) {
                    echo "<a class='produit' href='product.php?codevar=" . $ligne->codevar . "'>";
                    echo "<img src='" . $ligne->image_path . "' class='produit-image'>";
                    echo "<div class='produit-details'>";
                    echo "<h2>" . $ligne->nomart . " - " . $ligne->nomvar . "</h2>";
                    echo "<p class='produit-cat'>" . $ligne->nom_cat . "</p>";
                    echo "<p>" . $ligne->prix . " €</p>";
                    echo "</div>";
                    echo "</a>";
                }
            } else {
                // Afficher tous les produits ici
                $requete = "SELECT v.codeVar, v.nomVar, v.nomArt, image_path, a.nom_Cat, prix
                FROM variete v, article a, images i, couter c, saison s, tarif t, client cl
                WHERE v.nomArt = a.nomArt 
                    AND v.codeVar = i.codeVar 
                    AND v.codeVar = c.codeVar 
                    AND s.nom = c.nom
                    AND CURRENT_DATE >= date_debut
                    AND CURRENT_DATE <= date_fin
                    AND c.nomTarif = t.nomTarif
                    AND cl.nomTarif = t.nomTarif
                ORDER BY nomart, nomvar;";
                $resultat = $cnx->query($requete);
                while ($ligne = $resultat->fetch(PDO::FETCH_OBJ)) {
                    echo "<a class='produit' href='product.php?codevar=" . $ligne->codevar . "'>";
                    echo "<img src='" . $ligne->image_path . "' class='produit-image'>";
                    echo "<div class='produit-details'>";
                    echo "<h2>" . $ligne->nomart . " - " . $ligne->nomvar . "</h2>";
                    echo "<p class='produit-cat'>" . $ligne->nom_cat . "</p>";
                    echo "<p>" . $ligne->prix . " €</p>";
                    echo "</div>";
                    echo "</a>";
                }
            }
            $resultat->closeCursor();
            ?>
        </div>
    </main>
    <button id="btn-retour-haut" onclick="retourHaut()">Retour en haut</button>

    <script>
        // Fonction pour afficher ou masquer le bouton en fonction de la position de défilement
        window.onscroll = function () {
            afficherMasquerBouton();
        };

        function afficherMasquerBouton() {
            var bouton = document.getElementById("btn-retour-haut");
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                bouton.style.display = "block";
            } else {
                bouton.style.display = "none";
            }
        }

        // Fonction pour remonter en haut de la page
        function retourHaut() {
            document.body.scrollTop = 0; // Pour les anciens navigateurs
            document.documentElement.scrollTop = 0; // Pour les navigateurs modernes
        }
    </script>
</body>

</html>