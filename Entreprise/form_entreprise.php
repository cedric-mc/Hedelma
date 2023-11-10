<?php
session_start();
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hedelma - Connexion</title>
    <link rel="stylesheet" href="../style/main.css">

</head>

<body>
    <header>
        <h1>HEDELMA</h1>
    </header>
    <div class="container">
        <h2>Connexion au compte Employé</h2>
        <form action="auth_entreprise.php" method="post">
            <label for="id_Emp">Identifiant de l'employé :</label>
            <input type="text" id="id_Emp" name="id_Emp" required><br>

            <label for="mot_de_passe">Mot de passe :</label>
            <input type="password" id="mot_de_passe" name="mot_de_passe" required><br>
            </br></br>
            <input type="submit" value="Envoyer">
        </form>
        <a href="creation_entreprise.php">Créer un compte ?</a>
    </div>

</body>

</html>