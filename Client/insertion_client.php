<!-- Page d'insertion d'un client dans la base de données -->
<?php
if (!isset($_POST['submit']) || !isset($_POST['nom']) || !isset($_POST['prenom']) || !isset($_POST['adresse']) || !isset($_POST['telephone']) || !isset($_POST['metier']) || !isset($_POST['mdp'])) {
    echo "Merci de passer par le formulaire de création de compte.";
    header("Location: creation_client.php");
    exit();
}
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../style/main.css">
    <title>Hedelma - Création de compte</title>
    <style>
        h1 {
            text-align: center;
            color: black;
        }
    </style>
</head>

<body>
    <header>
        <h1>HEDELMA</h1>
    </header>
    <div class="container">
        <h2>Création du compte Client</h2>
        <?php
        include('../hidden/connexion.inc.php');
        $cnx->query("SET search_path TO projet;");

        $nomCli = $_POST['nom'];
        $prenomCli = $_POST['prenom'];
        $adresse = $_POST['adresse'];
        $telephone = $_POST['telephone'];
        $nomTarif = $_POST['metier'];
        $mdp = md5($_POST['mdp']);
        // Générer le code client
        $codeCli = "C" . strtoupper(substr($nomCli, 0, 6));

        // Vérifier si le client existe déjà
        $req = "SELECT COUNT(*) FROM CLIENT WHERE codeCli = '$codeCli';";
        $resultat = $cnx->query($req);
        $nb_lignes = $resultat->fetchColumn();
        if ($nb_lignes > 0) {
            echo "Le client de code $codeCli existe déjà.<br>";
        } else {
            // Insertion
            $req = "INSERT INTO CLIENT VALUES ('$codeCli', '$nomCli', '$prenomCli', '$adresse', '$telephone','$mdp', '$nomTarif');";
            try {
                $requete = $cnx->exec($req);
                echo "Le client de code $codeCli a bien été ajouté.<br>";
                echo "<a href='form_client.php'>Retour à la page d'authentification</a>";
            } catch (PDOException $e) {
                echo "Erreur lors de l’ajout du client de code $codeCli.<br />";
                echo "Erreur : " . $e->getMessage() . "<br />";
            }
        }
        ?>
    </div>
</body>

</html>