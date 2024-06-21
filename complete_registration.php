<?php
header('Content-Type: application/json');

$host = 'localhost';
$db = 'bcca';
$user = 'root';
$pass = '';

$response = ['success' => false];

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Menyiapkan pernyataan SQL untuk memperbarui data pengguna dengan nomor kartu dan rekening
    $stmt = $pdo->prepare("UPDATE users SET nomor_kartu = :nomor_kartu, nomor_rekening = :nomor_rekening WHERE nama_lengkap = :nama_lengkap");

    // Mengikat parameter
    $stmt->bindParam(':nomor_kartu', $_POST['nomor_kartu']);
    $stmt->bindParam(':nomor_rekening', $_POST['nomor_rekening']);
    $stmt->bindParam(':nama_lengkap', $_POST['nama_lengkap']); 

    // Menjalankan pernyataan SQL
    if ($stmt->execute()) {
        $response['success'] = true;
    } else {
        $response['error'] = 'Gagal menyimpan nomor kartu dan rekening ke database';
    }
} catch (PDOException $e) {
    $response['error'] = 'Kesalahan PDO: ' . $e->getMessage();
}

echo json_encode($response);
?>
