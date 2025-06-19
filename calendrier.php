<?php
session_start();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Calendrier des Matchs</title>
  <link rel="stylesheet" href="css/style1.css" />
  <link rel="stylesheet" href="css/calendrier.css">
  <link rel="stylesheet" href="css/header1.css">
</head>
<body>

<?php include 'header1.php'; ?>
  <main>
    <h1>Calendrier des Matchs</h1>
    <div id="calendrier-matchs">
      <!-- Matchs chargés dynamiquement -->
    </div>
  </main>

  <?php include 'includes/footer.php'; ?>
  <script src="js/script.js"></script>
</body>
</html>
