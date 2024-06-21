-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Jun 2024 pada 01.55
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bcca`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(225) NOT NULL,
  `nomor_kartu` varchar(30) NOT NULL,
  `nomor_rekening` int(10) NOT NULL,
  `pin` int(6) NOT NULL,
  `kode_akses` varchar(6) NOT NULL,
  `nama_ibu_kandung` varchar(255) NOT NULL,
  `tujuan` enum('TRANSAKSI','MENABUNG','KEPERLUAN PRIBADI') NOT NULL,
  `status_perkawinan` enum('Belum Menikah','Menikah','Cerai') NOT NULL,
  `agama` enum('Islam','Kristen','Hindu','Budha','Lainnya') NOT NULL,
  `status_tempat_tinggal` enum('Milik Sendiri','Sewa','Kost') NOT NULL,
  `nama_perusahaan` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `bidang_usaha` varchar(255) NOT NULL,
  `alamat_kantor` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `kode_pos` varchar(10) NOT NULL,
  `telepon_kantor` varchar(20) NOT NULL,
  `jenis_paspor` enum('PASPOR PLATINUM','PASPOR GOLD','PASPOR BLUE','PASPOR XPRESI') NOT NULL,
  `kantor_cabang` enum('BCA KCP JEMBATAN DUA','BCA KCU PLUIT') NOT NULL,
  `foto_ktp` varchar(255) NOT NULL,
  `foto_diri` varchar(255) NOT NULL,
  `tanda_tangan` varchar(255) NOT NULL,
  `npwp` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama_lengkap`, `nomor_kartu`, `nomor_rekening`, `pin`, `kode_akses`, `nama_ibu_kandung`, `tujuan`, `status_perkawinan`, `agama`, `status_tempat_tinggal`, `nama_perusahaan`, `jabatan`, `bidang_usaha`, `alamat_kantor`, `kota`, `kode_pos`, `telepon_kantor`, `jenis_paspor`, `kantor_cabang`, `foto_ktp`, `foto_diri`, `tanda_tangan`, `npwp`, `created_at`) VALUES
(1, '', '4000', 1920887103, 0, 'uio789', 'bbbb', 'MENABUNG', 'Menikah', 'Kristen', 'Sewa', 'eurhtiuerh', 'iuhuihi', 'uihiuh', 'iuh', 'iuh', '778', '0988', 'PASPOR GOLD', 'BCA KCU PLUIT', '', '', '', NULL, '2024-06-18 03:50:36'),
(2, '', '4000', 1920887103, 0, 'yuu678', 'uietiauert', 'MENABUNG', 'Cerai', 'Kristen', 'Sewa', 'iseurhtiert', 'uh', 'iuh', 'iu', 'hiu', '09890', '987908', 'PASPOR PLATINUM', 'BCA KCU PLUIT', '', '', '', NULL, '2024-06-18 04:12:55'),
(3, '', '4000', 1920887103, 0, 'eiu878', 'yut', 'KEPERLUAN PRIBADI', 'Belum Menikah', 'Islam', 'Milik Sendiri', 'uIUHiu', 'u', 'iu', 'iuh', 'iu', '88888', '080808', 'PASPOR BLUE', 'BCA KCP JEMBATAN DUA', '', '', '', NULL, '2024-06-18 04:16:11'),
(4, '', '4000', 1920887103, 0, '123qwe', 'endang', 'TRANSAKSI', 'Belum Menikah', 'Islam', 'Kost', 'bca jembatan dua', 'cso', 'perbankan', 'jl jembatan dua raya', 'jakarta utara', '14450', '0216601718', 'PASPOR PLATINUM', 'BCA KCP JEMBATAN DUA', '', '', '', NULL, '2024-06-18 04:19:13'),
(5, 'IQBAL', '0', 0, 123456, '123QWE', 'ENDANG', 'TRANSAKSI', 'Belum Menikah', 'Islam', 'Sewa', 'BBC', 'BBB', 'BBB', 'BBB', 'BBB', '88888', '778888', 'PASPOR GOLD', 'BCA KCP JEMBATAN DUA', '', '', '', NULL, '2024-06-18 05:04:22'),
(6, 'IUYTHA', '4000 9006 6756 1116', 2147483647, 123543, '723UIU', 'UYIUYIY', 'TRANSAKSI', 'Belum Menikah', 'Islam', 'Milik Sendiri', 'KH', 'U', 'UH', 'OU', 'HO', '980', '0909', 'PASPOR PLATINUM', 'BCA KCP JEMBATAN DUA', '', '', '', NULL, '2024-06-18 05:07:13'),
(7, 'IQBAL SEPTIANA', '4000 4423 2654 4471', 1164469925, 123123, '123QWE', 'ENDANG SAINAH', 'TRANSAKSI', 'Belum Menikah', 'Islam', 'Kost', 'BCA JEMBATA DUA', 'CSO', 'PERBANKAN', 'JL JEMBATAN DUA RAYA', 'JAKARTA UTARA', '14450', '0216601718', 'PASPOR GOLD', 'BCA KCP JEMBATAN DUA', '', '', '', NULL, '2024-06-18 05:12:18'),
(8, 'OSDFSD', '4000 3576 3783 3306', 2147483647, 535533, 'SDF234', 'ENENE', 'MENABUNG', 'Belum Menikah', 'Islam', 'Milik Sendiri', 'IJ', 'IJ', 'OIJ', 'OI', 'JOIJ', '988', '989', 'PASPOR XPRESI', 'BCA KCP JEMBATAN DUA', '', '', '', NULL, '2024-06-18 05:56:03'),
(9, 'yutuyt', '4000 7578 7737 8627', 2147483647, 767867, '677tyt', 'yiuyi', 'TRANSAKSI', 'Belum Menikah', 'Islam', 'Milik Sendiri', 'uiyuiy', 'iuy', 'iu', 'yiu', 'yi', '98789', '987987', 'PASPOR PLATINUM', 'BCA KCP JEMBATAN DUA', '', '', '', NULL, '2024-06-21 10:50:14'),
(10, 'yuyuyuyuy', '4000 0430 4504 2287', 2147483647, 987987, 'tyty67', 'uyiuyiuyiu', 'TRANSAKSI', 'Belum Menikah', 'Islam', 'Milik Sendiri', 'uyiuy', 'iu', 'yiu', 'y', 'iuy', 'iuy987987', '897987', 'PASPOR BLUE', 'BCA KCP JEMBATAN DUA', '', '', '', NULL, '2024-06-21 10:51:54'),
(11, 'yuy', '', 0, 666666, 'uhuy76', 'jhj', 'TRANSAKSI', 'Belum Menikah', 'Islam', 'Milik Sendiri', 'iu', 'iu', 'i', 'ui', 'u', 'iu', 'iu', 'PASPOR PLATINUM', 'BCA KCP JEMBATAN DUA', '', '', '', NULL, '2024-06-21 11:17:39'),
(12, 'Iqbal Septiana', '4000 4423 2654 4471', 1164469925, 123123, '123qwe', 'Endang', 'TRANSAKSI', 'Belum Menikah', 'Islam', 'Milik Sendiri', 'BCA KCP Jembatan Dua', 'CSO', 'Perbankan', 'JL Jembatan Dua blok B BC no 82', 'Jakarta Utara', '14450', '0216601718', 'PASPOR BLUE', 'BCA KCP JEMBATAN DUA', '', '', '', NULL, '2024-06-21 23:44:48');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
