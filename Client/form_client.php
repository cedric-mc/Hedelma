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
        <h2>Connexion au compte Client</h2>
        <form action="auth_client.php" method="post">
            <label for="codeCli">Code client :</label>
            <input type="text" id="codeCli" name="codeCli" required><br>

            <label for="mot_de_passe">Mot de passe :</label>
            <input type="password" id="mot_de_passe" name="mot_de_passe" required><br>

            </br></br>
            <input type="submit" id="submit" value="Envoyer">
        </form>
        <a href="creation_client.php">Créer un compte ?</a>
    </div>

</body>

</html>