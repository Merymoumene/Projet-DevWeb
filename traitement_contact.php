
<?php
session_start();
header('Content-Type: application/json');

if (!isset($_SESSION['user_id'])) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Vous devez être connecté pour envoyer un message.'
    ]);
    exit;
}

try {
    $pdo = new PDO('mysql:host=localhost;dbname=match_reservation', 'root', '', [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);

    $utilisateur_id = $_SESSION['user_id'];
    $nom = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $telephone = $_POST['phone'] ?? '';
    $message = $_POST['message'] ?? '';

    if ($nom && $email && $message) {
        $stmt = $pdo->prepare("INSERT INTO messages (utilisateur_id, nom, email, telephone, message, date_envoi) VALUES (?, ?, ?, ?, ?, NOW())");
        $stmt->execute([$utilisateur_id, $nom, $email, $telephone, $message]);

        echo json_encode([
            'status' => 'success',
            'message' => '🎉 Message envoyé avec succès.'
        ]);
    } else {
        echo json_encode([
            'status' => 'error',
            'message' => '❗ Veuillez remplir les champs requis.'
        ]);
    }
} catch (PDOException $e) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Erreur : ' . $e->getMessage()
    ]);
}

    ?>

