<?php
if (!isset($_POST['submit']) || !isset($_POST['nom']) || !isset($_POST['prenom']) || !isset($_POST['type_contrat']) || !isset($_POST['date_embauche']) || !isset($_POST['date_naissance']) || !isset($_POST['secteur_travail']) || !isset($_POST['mot_de_passe'])) {
    header("Location: creation_entreprise.php");
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
    <div>
        <h1>HEDELMA</h1>
    </div>
    <div class="container">
        <h2>Création d'un compte Employé</h2>
        <?php
        include('../hidden/connexion.inc.php');
        $cnx->query("SET search_path TO projet;");

        $nomEmp = $_POST['nom'];
        $prenomEmp = $_POST['prenom'];
        $typeContrat = $_POST['type_contrat'];
        $dateEmbauche = $_POST['date_embauche'];
        $datenaissance = $_POST['date_naissance'];
        $dateFinEmbauche = $_POST['date_fin_contrat'];
        $secteurTravail = $_POST['secteur_travail'];
        $motDePasse = $_POST['mot_de_passe'];
        $cryptMdp = md5($motDePasse);

        // Générer l'id_Emp
        $idEmp = strtoupper($prenomEmp);
        $req = "SELECT COUNT(*) FROM EMPLOYE WHERE id_emp = '$idEmp';";
        $resultat = $cnx->query($req);
        $nbLignes = $resultat->fetchColumn();
        if ($nbLignes > 0) {
            $idEmp .= strtoupper(substr($nomEmp, 0, 1));
        }

        // Vérifier si l'employé existe déjà
        $req = "SELECT COUNT(*) FROM EMPLOYE WHERE id_emp = '$idEmp';";
        $resultat = $cnx->query($req);
        $nbLignes = $resultat->fetchColumn();
        if ($nbLignes > 0) {
            echo "L'employé d'identifiant $idEmp existe déjà.<br>";
        } else {
            // Insertion
            $req = "INSERT INTO EMPLOYE VALUES ('$idEmp', '$prenomEmp', '$nomEmp','$datenaissance', " . ($dateFinEmbauche ? "'$dateFinEmbauche'" : "NULL") . ", '$dateEmbauche', '$typeContrat', '$cryptMdp');";
            // echo "Requête SQL : $req";
            try {
                $requete = $cnx->exec($req);
                echo "L'employé d'identifiant $idEmp a bien été ajouté.<br>";
                // Ajouter l'appartenance du secteur de travail de l'employé
                $req = "INSERT INTO appartenir VALUES ('$idEmp', '$secteurTravail');";
                try {
                    $requete = $cnx->exec($req);
                    echo "L'appartenance de l'employé d'identifiant $idEmp au secteur $secteurTravail a bien été ajoutée.<br>";
                    echo "<a href='form_entreprise.php'>Retour à la page d'authentification</a>";
                } catch (PDOException $e) {
                    echo "Erreur lors de l’ajout de l'appartenance de l'employé d'identifiant $idEmp au secteur $secteurTravail.<br />";
                }
            } catch (PDOException $e) {
                echo "Erreur lors de l’ajout de l'employé d'identifiant $idEmp.<br />";
            }
        }
        ?>
    </div>
</body>

</html>