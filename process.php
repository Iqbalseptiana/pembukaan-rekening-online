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

    // Menyiapkan pernyataan SQL untuk menyimpan data ke database
    $stmt = $pdo->prepare("INSERT INTO users (nama_lengkap, kode_akses, tujuan, nama_ibu_kandung, status_perkawinan, agama, status_tempat_tinggal, nama_perusahaan, jabatan, bidang_usaha, alamat_kantor, kota, kode_pos, telepon_kantor, jenis_paspor, kantor_cabang, pin) VALUES (:nama_lengkap, :kode_akses, :tujuan, :nama_ibu_kandung, :status_perkawinan, :agama, :status_tempat_tinggal, :nama_perusahaan, :jabatan, :bidang_usaha, :alamat_kantor, :kota, :kode_pos, :telepon_kantor, :jenis_paspor, :kantor_cabang, :pin)");

    // Mengikat parameter
    $stmt->bindParam(':nama_lengkap', $_POST['nama_lengkap']);
    $stmt->bindParam(':kode_akses', $_POST['kode_akses']);
    $stmt->bindParam(':tujuan', $_POST['tujuan']);
    $stmt->bindParam(':nama_ibu_kandung', $_POST['nama_ibu_kandung']);
    $stmt->bindParam(':status_perkawinan', $_POST['status_perkawinan']);
    $stmt->bindParam(':agama', $_POST['agama']);
    $stmt->bindParam(':status_tempat_tinggal', $_POST['status_tempat_tinggal']);
    $stmt->bindParam(':nama_perusahaan', $_POST['nama_perusahaan']);
    $stmt->bindParam(':jabatan', $_POST['jabatan']);
    $stmt->bindParam(':bidang_usaha', $_POST['bidang_usaha']);
    $stmt->bindParam(':alamat_kantor', $_POST['alamat_kantor']);
    $stmt->bindParam(':kota', $_POST['kota']);
    $stmt->bindParam(':kode_pos', $_POST['kode_pos']);
    $stmt->bindParam(':telepon_kantor', $_POST['telepon_kantor']);
    $stmt->bindParam(':jenis_paspor', $_POST['jenis_paspor']);
    $stmt->bindParam(':kantor_cabang', $_POST['kantor_cabang']);
    $stmt->bindParam(':pin', $_POST['pin']);

    // Menjalankan pernyataan SQL
    if ($stmt->execute()) {
        $response['success'] = true;
    } else {
        $response['error'] = 'Gagal menyimpan data ke database';
    }

    // Mengunggah file
    $uploadDir = 'uploads/';
    foreach (['foto_ktp', 'foto_diri', 'tanda_tangan', 'npwp'] as $fileKey) {
        if (isset($_FILES[$fileKey]) && $_FILES[$fileKey]['error'] == UPLOAD_ERR_OK) {
            $uploadFile = $uploadDir . basename($_FILES[$fileKey]['name']);
            if (!move_uploaded_file($_FILES[$fileKey]['tmp_name'], $uploadFile)) {
                $response['error'] = 'Gagal mengunggah file ' . $fileKey;
                $response['success'] = false;
                break;
            }
        } elseif (isset($_FILES[$fileKey]) && $_FILES[$fileKey]['error'] != UPLOAD_ERR_NO_FILE) {
            $response['error'] = 'Kesalahan mengunggah file ' . $fileKey;
            $response['success'] = false;
            break;
        }
    }
} catch (PDOException $e) {
    $response['error'] = 'Kesalahan PDO: ' . $e->getMessage();
}

echo json_encode($response);
?>
