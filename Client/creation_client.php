<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hedelma - Création de compte</title>
    <link rel="stylesheet" href="../style/main.css">

</head>

<body>
    <header>
        <h1>HEDELMA</h1>
    </header>
    <div class="container">
        <h2>Création du compte Client</h2>
        <form action="insertion_client.php" method="post">
            <label for="nom">Nom :</label>
            <input type="text" id="nom" name="nom" required><br>

            <label for="prenom">Prénom :</label>
            <input type="text" id="prenom" name="prenom" required><br>

            <label for="adresse">Adresse :</label>
            <input type="text" id="adresse" name="adresse" required><br>

            <label for="telephone">Numéro de téléphone :</label>
            <input type="tel" id="telephone" name="telephone" required><br>

            <label for="mot_de_passe">Mot de passe :</label>
            <input type="password" id="mdp" name="mdp" required><br>

            <label for="metier">Métier particulier :</label>
            <select name="metier" required>
                <option value="" selected="selected">-- metier --</option>
                <?php
                include("../hidden/connexion.inc.php");
                $requete = $cnx->exec("SET search_path TO projet;");

                $requete = $cnx->query('SELECT * from TARIF;');
                while ($ligne = $requete->fetch()) {
                    echo '<option value="' . $ligne['nomtarif'] . '">' . $ligne['nomtarif'] . '</option>';
                }
                // Fermeture de la requête et de la connexion à la base de données
                $requete->closeCursor();
                ?>

            </select>
            </br></br>
            <input type="submit" id="submit" value="Créer" name="submit">
        </form>
        <a href="form_client.php">Déjà un compte ?</a>
    </div>

</body>

</html>