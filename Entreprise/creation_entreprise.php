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
        <h2>Création du compte de l'Employé</h2>
        <form action="insertion_entreprise.php" method="post">
            <label for="nom">Nom :</label>
            <input type="text" id="nom" name="nom" required><br>

            <label for="prenom">Prénom :</label>
            <input type="text" id="prenom" name="prenom" required><br>

            <label for="type_contrat">Type de contrat :</label>
            <select name="type_contrat">
                <option value="" selected="selected">-- type de contrat --</option>
                /*j'utilise pas de php ici car je ne sais pas si tout les type de contrat sont utilisé dans la table
                employé*/
                <option value="CDI">CDI</option>
                <option value="CDD">CDD</option>
                <option value="stage">Stage</option>
                <option value="apprentissage">Apprentissage</option>
            </select><br>

            <label for="date_naissance">Date de naissance :</label>
            <input type="date" id="date_naisssance" name="date_naissance" required><br>

            <label for="date_embauche">Date d'embauche :</label>
            <input type="date" id="date_embauche" name="date_embauche" required><br>

            <label for="date_fin_contrat">Date de fin de contrat (optionnel) :</label>
            <input type="date" id="date_fin_contrat" name="date_fin_contrat"><br>

            <label for="secteur_travail">Secteur de travail :</label>
            <select name="secteur_travail">
                <option value="" selected="selected">-- Secteur de travail --</option>
                <?php
                include("../hidden/connexion.inc.php");
                $requete = $cnx->exec("SET search_path TO projet;");

                $requete = $cnx->query('SELECT * from service;');
                while ($donnees = $requete->fetch()) {
                    echo '<option value="' . $donnees['num_service'] . '">' . $donnees['libelle'] . '</option>';
                }

                // Fermeture de la requête et de la connexion à la base de données
                $requete->closeCursor();
                ?>
            </select><br>
            <label for="mot_de_passe">Mot de passe :</label>
            <input type="password" id="mot_de_passe" name="mot_de_passe" required><br>

            <input type="submit" id="submit" value="Créer" name="submit">
        </form>
        <a href="form_entreprise.php">Déjà un compte ?</a>
    </div>

</body>

</html>