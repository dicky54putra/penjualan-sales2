-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Apr 2020 pada 09.33
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `id_satuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `kode_barang`, `nama_barang`, `id_satuan`) VALUES
(1, 'KB-001', 'White based 1', 8),
(2, 'KB-002', 'White based 1 NAT', 8),
(3, 'KB-003', 'White based 2', 8),
(4, 'KB-004', 'White based 2 NAT', 8),
(5, 'KB-005', 'White based 3', 8),
(6, 'KB-006', 'White based 3 NAT', 8),
(7, 'KB-007', 'White based 6', 8),
(8, 'KB-008', 'White based 12 ', 8),
(9, 'KB-009', 'White based 12 NAT', 8),
(10, 'KB-010', 'White based 15', 8),
(11, 'KB-011', 'White based 18', 8),
(12, 'KB-012', 'White based 19', 8),
(13, 'KB-013', 'Wood 1', 8),
(14, 'KB-014', 'Wood 2', 8),
(15, 'KB-015', 'Wood 3', 8),
(16, 'KB-016', 'Wood 5', 8),
(17, 'KB-017', 'Wood 6', 8),
(18, 'KB-018', 'Wood 7', 8),
(19, 'KB-019', 'Wood 8', 8),
(20, 'KB-020', 'Wood 9', 8),
(21, 'KB-021', 'Wood 10', 8),
(22, 'KB-022', 'Wood 12', 8),
(23, 'KB-023', 'Wood 13', 8),
(24, 'KB-024', 'Wood 14', 8),
(25, 'KB-025', 'Wood 14 NAT', 8),
(26, 'KB-026', 'Wood 15', 8),
(27, 'KB-027', 'Wood 15 NAT', 8),
(28, 'KB-028', 'Marble 1', 8),
(29, 'KB-029', 'Marble 3', 8),
(30, 'KB-030', 'Lime Green', 8),
(31, 'KB-031', 'Royal Blue', 8),
(32, 'KB-032', 'China Red', 8),
(33, 'KB-033', 'Profil Lis A putih', 8),
(34, 'KB-034', 'Profil Lis A coklat', 8),
(35, 'KB-035', 'Profil Lis B putih', 8),
(36, 'KB-036', 'Profil Lis B coklat', 8),
(37, 'KB-037', 'Profil Lis C putih', 8),
(38, 'KB-038', 'Profil Lis C coklat', 8),
(39, 'KB-039', 'Profil Lis D putih', 8),
(40, 'KB-040', 'Profil Lis D coklat', 8),
(41, 'KB-041', 'Profil Lis E putih', 8),
(42, 'KB-042', 'Profil Lis E coklat', 8),
(43, 'KB-043', 'Profil Lis L putih', 8),
(44, 'KB-044', 'Profil Lis L coklat', 8),
(45, 'KB-045', 'Profil Lis T putih', 8),
(46, 'KB-046', 'Profil Lis T coklat', 8),
(47, 'KB-047', 'aqua', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `kode_customer` varchar(100) NOT NULL,
  `up` varchar(100) NOT NULL,
  `nama_customer` varchar(100) NOT NULL,
  `npwp` int(11) DEFAULT NULL,
  `alamat` text NOT NULL,
  `telepon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id_customer`, `kode_customer`, `up`, `nama_customer`, `npwp`, `alamat`, `telepon`) VALUES
(1, 'CS-001', 'Bp Achsan', 'TB KURNIA MAKMUR', NULL, 'Jl. Plumbon RT.001/RW.003, Wonosari, Ngaliyan, Semarang', NULL),
(2, 'CS-002', 'Bp Anthony', 'PT PANTES PUTRA JAYA', NULL, 'Pekojan komplek ruko THD Blok A-7, Purwodinatan, Semarang', NULL),
(3, 'CS-003', 'Bu Rini', 'TB BANGKIT ASRI TRUSS', NULL, 'Jl. Semarang Bawen KM 24, Lemah Abang, Ungaran\r\n', NULL),
(4, 'CS-004', 'Bp Darmadi', 'CV CIPTA ADIKARYA NUSANTARA DIPTA', NULL, 'IR Juanda Blok-No.150 RT.001 RW.009, Kampung Sewu, Jebres, Surakarta\r\n', NULL),
(5, 'CS-005', 'Bp Farid', 'PT TIGA CAHAYA KITA', NULL, 'Yos Sudarso No.377 RT.004 RW.015, Danukusuman,Serengan, Kota surakarta\r\n', NULL),
(6, 'CS-006', 'Bu Dessy', 'BJ HOME JOGJA', NULL, 'Jl. Raya Janti Ringroad Timur No 96, Jaranan, Banguntapan, Bantul, Jogjakarta\r\n', NULL),
(7, 'CS-007', 'Bu Sari', 'TB TRISANATA KUDUS', NULL, '', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `foto`
--

CREATE TABLE `foto` (
  `id_foto` int(11) NOT NULL,
  `nama_tabel` varchar(50) NOT NULL,
  `id_tabel` int(11) NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `harga_barang`
--

CREATE TABLE `harga_barang` (
  `id_harga_barang` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `distributor` int(11) NOT NULL,
  `konsumen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `harga_barang`
--

INSERT INTO `harga_barang` (`id_harga_barang`, `id_barang`, `distributor`, `konsumen`) VALUES
(1, 1, 8500, 10000),
(2, 2, 8400, 15300),
(3, 3, 0, 0),
(4, 4, 0, 0),
(5, 5, 0, 0),
(6, 6, 0, 0),
(7, 7, 0, 0),
(8, 8, 0, 0),
(9, 9, 0, 0),
(10, 10, 0, 0),
(11, 11, 0, 0),
(12, 12, 0, 0),
(13, 13, 0, 0),
(14, 14, 0, 0),
(15, 15, 0, 0),
(16, 16, 0, 0),
(17, 17, 0, 0),
(18, 18, 0, 0),
(19, 19, 0, 0),
(20, 20, 0, 0),
(21, 21, 0, 0),
(22, 22, 0, 0),
(23, 23, 0, 0),
(24, 24, 0, 0),
(25, 25, 0, 0),
(26, 26, 0, 0),
(27, 27, 0, 0),
(28, 28, 0, 0),
(29, 29, 0, 0),
(30, 30, 0, 0),
(31, 31, 0, 0),
(32, 32, 0, 0),
(33, 33, 0, 0),
(34, 34, 0, 0),
(35, 35, 0, 0),
(36, 36, 0, 0),
(37, 37, 0, 0),
(38, 38, 0, 0),
(39, 39, 0, 0),
(40, 40, 0, 0),
(41, 41, 0, 0),
(42, 42, 0, 0),
(43, 43, 0, 0),
(44, 44, 0, 0),
(45, 45, 0, 0),
(46, 46, 0, 0),
(47, 47, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log`
--

CREATE TABLE `log` (
  `id` bigint(20) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `log`
--

INSERT INTO `log` (`id`, `level`, `category`, `log_time`, `prefix`, `message`) VALUES
(1, 0, 'Login', 1583556732.8384, 'Administrator', 'Login'),
(2, 4, 'yii\\db\\Command::execute', 1583556732.8387, 'Administrator', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1583556732.8384, \'Administrator\', \'Login\')'),
(3, 0, 'Login', 1583579021.4681, 'Administrator', 'Login'),
(4, 4, 'yii\\db\\Command::execute', 1583579021.4684, 'Administrator', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1583579021.4681, \'Administrator\', \'Login\')'),
(5, 4, 'yii\\db\\Command::execute', 1583579416.5852, 'Administrator', 'UPDATE `menu_navigasi` SET `nama_menu`=\'User Account\', `id_parent`=1, `no_urut`=2, `status`=0 WHERE `id_menu`=2'),
(6, 4, 'yii\\db\\Command::execute', 1583579451.3413, 'Administrator', 'UPDATE `menu_navigasi` SET `nama_menu`=\'Setting Company\', `id_parent`=1, `no_urut`=4, `status`=0 WHERE `id_menu`=5'),
(7, 0, 'Login', 1583589785.5682, 'Administrator', 'Login'),
(8, 4, 'yii\\db\\Command::execute', 1583589785.5685, 'Administrator', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1583589785.5682, \'Administrator\', \'Login\')'),
(9, 4, 'yii\\db\\Command::execute', 1583590507.8374, 'Administrator', 'INSERT INTO `setting` (`nama`, `email`, `alamat`, `telepon`, `nomor_rekening`, `foto`) VALUES (\'PT. MITRA DWIARTHA KOMPAKINDO\', \'-\', \'-\', \'085692228990\', 123456789, \'-\')'),
(10, 4, 'yii\\db\\Command::execute', 1583591879.3375, 'Administrator', 'UPDATE `setting` SET `nomor_rekening`=123456789, `foto`=\'1583591879_logo.jpg\' WHERE `id_setting`=1'),
(11, 4, 'yii\\db\\Command::execute', 1583591899.6248, 'Administrator', 'UPDATE `setting` SET `nomor_rekening`=123456789, `foto`=\'1583591899_logo.png\' WHERE `id_setting`=1'),
(12, 4, 'yii\\db\\Command::execute', 1583591910.3703, 'Administrator', 'UPDATE `setting` SET `nomor_rekening`=123456789, `foto`=\'1583591910_logo.jpg\' WHERE `id_setting`=1'),
(13, 4, 'yii\\db\\Command::execute', 1583674820.8626, 'Administrator', 'INSERT INTO `menu_navigasi` (`nama_menu`, `url`, `id_parent`, `icon`, `status`, `no_urut`) VALUES (\'Satuan\', \'satuan\', 1, \'list\', 0, 5)'),
(14, 4, 'yii\\db\\Command::execute', 1583674823.9423, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'152\''),
(15, 4, 'yii\\db\\Command::execute', 1583674823.9565, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 152)'),
(16, 4, 'yii\\db\\Command::execute', 1583675215.9447, 'Administrator', 'INSERT INTO `menu_navigasi` (`nama_menu`, `url`, `id_parent`, `icon`, `status`, `no_urut`) VALUES (\'Barang\', \'barang\', 1, \'list\', 0, 6)'),
(17, 4, 'yii\\db\\Command::execute', 1583675218.8257, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'153\''),
(18, 4, 'yii\\db\\Command::execute', 1583675218.8451, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 153)'),
(19, 4, 'yii\\db\\Command::execute', 1583675608.9305, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`, `harga`) VALUES (\'B0001\', \'Indomie\', 5, 25000)'),
(20, 4, 'yii\\db\\Command::execute', 1583677080.6996, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`, `harga`) VALUES (\'B0002\', \'Supermie\', 5, 35000)'),
(21, 4, 'yii\\db\\Command::execute', 1583677143.8305, 'Administrator', 'UPDATE `barang` SET `id_satuan`=5, `harga`=40000 WHERE `id_barang`=2'),
(22, 4, 'yii\\db\\Command::execute', 1583677516.2516, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`, `harga`) VALUES (\'KB-001\', \'Indomie\', 5, 25000)'),
(23, 4, 'yii\\db\\Command::execute', 1583677544.6389, 'Administrator', 'UPDATE `barang` SET `id_satuan`=5, `harga`=35000 WHERE `id_barang`=1'),
(24, 4, 'yii\\db\\Command::execute', 1583678434.7138, 'Administrator', 'INSERT INTO `menu_navigasi` (`nama_menu`, `url`, `id_parent`, `icon`, `status`, `no_urut`) VALUES (\'Customer\', \'customer\', 1, \'list\', 0, 7)'),
(25, 4, 'yii\\db\\Command::execute', 1583678437.0835, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'154\''),
(26, 4, 'yii\\db\\Command::execute', 1583678437.1026, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 154)'),
(27, 4, 'yii\\db\\Command::execute', 1583678769.9009, 'Administrator', 'INSERT INTO `customer` (`kode_customer`, `up`, `nama_customer`, `alamat`) VALUES (\'CS-001\', \'Bp Achsan\', \'TB KURNIA MAKMUR\', \'Jl. Plumbon RT.001/RW.003, Wonosari, Ngaliyan, Semarang\')'),
(28, 4, 'yii\\db\\Command::execute', 1583678864.2655, 'Administrator', 'INSERT INTO `customer` (`kode_customer`, `up`, `nama_customer`, `alamat`) VALUES (\'CS-001\', \'Bp Achsan\', \'TB KURNIA MAKMUR\', \'Jl. Plumbon RT.001/RW.003, Wonosari, Ngaliyan, Semarang\')'),
(29, 4, 'yii\\db\\Command::execute', 1583678952.8248, 'Administrator', 'INSERT INTO `customer` (`kode_customer`, `up`, `nama_customer`, `alamat`) VALUES (\'CS-002\', \'Bp Anthony\', \'PT PANTES PUTRA JAYA\', \'Pekojan komplek ruko THD Blok A-7, Purwodinatan, Semarang\')'),
(30, 4, 'yii\\db\\Command::execute', 1583678976.5553, 'Administrator', 'INSERT INTO `customer` (`kode_customer`, `up`, `nama_customer`, `alamat`) VALUES (\'CS-003\', \'Bu Rini\', \'TB BANGKIT ASRI TRUSS\', \'Jl. Semarang Bawen KM 24, Lemah Abang, Ungaran\\r\\n\')'),
(31, 4, 'yii\\db\\Command::execute', 1583678998.8867, 'Administrator', 'INSERT INTO `customer` (`kode_customer`, `up`, `nama_customer`, `alamat`) VALUES (\'CS-004\', \'Bp Darmadi\', \'CV CIPTA ADIKARYA NUSANTARA DIPTA\', \'IR Juanda Blok-No.150 RT.001 RW.009, Kampung Sewu, Jebres, Surakarta\\r\\n\')'),
(32, 4, 'yii\\db\\Command::execute', 1583679019.6624, 'Administrator', 'INSERT INTO `customer` (`kode_customer`, `up`, `nama_customer`, `alamat`) VALUES (\'CS-005\', \'Bp Farid\', \'PT TIGA CAHAYA KITA\', \'Yos Sudarso No.377 RT.004 RW.015, Danukusuman,Serengan, Kota surakarta\\r\\n\')'),
(33, 4, 'yii\\db\\Command::execute', 1583679047.6395, 'Administrator', 'INSERT INTO `customer` (`kode_customer`, `up`, `nama_customer`, `alamat`) VALUES (\'CS-006\', \'Bu Dessy\', \'BJ HOME JOGJA\', \'Jl. Raya Janti Ringroad Timur No 96, Jaranan, Banguntapan, Bantul, Jogjakarta\\r\\n\')'),
(34, 4, 'yii\\db\\Command::execute', 1583679092.5146, 'Administrator', 'INSERT INTO `customer` (`kode_customer`, `up`, `nama_customer`) VALUES (\'CS-007\', \'Bu Sari\', \'TB TRISANATA KUDUS\')'),
(35, 4, 'yii\\db\\Command::execute', 1583683076.6549, 'Administrator', 'UPDATE `setting` SET `nama_bank`=\'-\', `nomor_rekening`=0, `foto`=\'1583683076_1583591910_logo.jpg\' WHERE `id_setting`=1'),
(36, 4, 'yii\\db\\Command::execute', 1583684245.439, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`, `harga`) VALUES (\'KB-002\', \'Supermie\', 1, 10000)'),
(37, 4, 'yii\\db\\Command::execute', 1583684313.1509, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`, `harga`) VALUES (\'KB-001\', \'Indomie\', 5, 35000)'),
(38, 4, 'yii\\db\\Command::execute', 1583684351.8537, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`, `harga`) VALUES (\'KB-001\', \'Indomie\', 5, 35000)'),
(39, 4, 'yii\\db\\Command::execute', 1583684454.3269, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`, `harga`) VALUES (\'KB-001\', \'Indomie\', 1, 35000)'),
(40, 4, 'yii\\db\\Command::execute', 1583684454.3516, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (1)'),
(41, 4, 'yii\\db\\Command::execute', 1583685164.6524, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-001\', \'Boxer\', 12)'),
(42, 4, 'yii\\db\\Command::execute', 1583685164.6705, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (1)'),
(43, 4, 'yii\\db\\Command::execute', 1583685181.8477, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-002\', \'Supermie\', 5)'),
(44, 4, 'yii\\db\\Command::execute', 1583685181.8674, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (2)'),
(45, 4, 'yii\\db\\Command::execute', 1583687102.4396, 'Administrator', 'UPDATE `harga_barang` SET `id_barang`=2, `distributor`=10000, `toko1`=11000, `toko2`=12000, `toko3`=13000, `toko4`=14000, `toko5`=15000, `konsumen`=9000 WHERE `id_harga_barang`=2'),
(46, 4, 'yii\\db\\Command::execute', 1583689873.5412, 'Administrator', 'INSERT INTO `menu_navigasi` (`nama_menu`, `url`, `id_parent`, `icon`, `status`, `no_urut`) VALUES (\'Transaksi\', \'#\', 0, \'list\', 0, 4)'),
(47, 4, 'yii\\db\\Command::execute', 1583689878.4841, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'155\''),
(48, 4, 'yii\\db\\Command::execute', 1583689878.4989, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 155)'),
(49, 4, 'yii\\db\\Command::execute', 1583689900.1968, 'Administrator', 'UPDATE `menu_navigasi` SET `id_parent`=0, `no_urut`=2, `status`=0 WHERE `id_menu`=155'),
(50, 4, 'yii\\db\\Command::execute', 1583689951.3055, 'Administrator', 'UPDATE `menu_navigasi` SET `id_parent`=1, `no_urut`=4, `icon`=\'cogs\', `status`=0 WHERE `id_menu`=5'),
(51, 4, 'yii\\db\\Command::execute', 1583690073.0612, 'Administrator', 'UPDATE `menu_navigasi` SET `id_parent`=1, `no_urut`=6, `icon`=\'box\', `status`=0 WHERE `id_menu`=153'),
(52, 4, 'yii\\db\\Command::execute', 1583690085.3287, 'Administrator', 'UPDATE `menu_navigasi` SET `id_parent`=1, `no_urut`=6, `icon`=\'boxes\', `status`=0 WHERE `id_menu`=153'),
(53, 4, 'yii\\db\\Command::execute', 1583690106.2856, 'Administrator', 'UPDATE `menu_navigasi` SET `id_parent`=1, `no_urut`=7, `icon`=\'user\', `status`=0 WHERE `id_menu`=154'),
(54, 4, 'yii\\db\\Command::execute', 1583690122.8134, 'Administrator', 'UPDATE `menu_navigasi` SET `id_parent`=1, `no_urut`=7, `icon`=\'users\', `status`=0 WHERE `id_menu`=154'),
(55, 4, 'yii\\db\\Command::execute', 1583690143.9155, 'Administrator', 'UPDATE `menu_navigasi` SET `id_parent`=0, `no_urut`=3, `icon`=\'hand-holding-usd\', `status`=0 WHERE `id_menu`=115'),
(56, 4, 'yii\\db\\Command::execute', 1583690194.0772, 'Administrator', 'UPDATE `menu_navigasi` SET `id_parent`=0, `no_urut`=3, `icon`=\'check\', `status`=0 WHERE `id_menu`=115'),
(57, 4, 'yii\\db\\Command::execute', 1583690220.6506, 'Administrator', 'UPDATE `menu_navigasi` SET `id_parent`=0, `no_urut`=3, `icon`=\'check-circle\', `status`=0 WHERE `id_menu`=115'),
(58, 4, 'yii\\db\\Command::execute', 1583690239.2835, 'Administrator', 'UPDATE `menu_navigasi` SET `id_parent`=0, `no_urut`=2, `icon`=\'hand-holding-usd\', `status`=0 WHERE `id_menu`=155'),
(59, 4, 'yii\\db\\Command::execute', 1583690347.1513, 'Administrator', 'INSERT INTO `menu_navigasi` (`nama_menu`, `url`, `id_parent`, `icon`, `status`, `no_urut`) VALUES (\'Tambah Transaksi\', \'transaksi/create\', 155, \'dollar-sign\', 0, 1)'),
(60, 4, 'yii\\db\\Command::execute', 1583690349.4285, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'156\''),
(61, 4, 'yii\\db\\Command::execute', 1583690349.4471, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 156)'),
(62, 4, 'yii\\db\\Command::execute', 1583690383.4976, 'Administrator', 'INSERT INTO `menu_navigasi` (`nama_menu`, `url`, `id_parent`, `icon`, `status`, `no_urut`) VALUES (\'Daftar Transaksi\', \'transaksi\', 155, \'file-invoice-dollar\', 0, 2)'),
(63, 4, 'yii\\db\\Command::execute', 1583690385.8192, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'157\''),
(64, 4, 'yii\\db\\Command::execute', 1583690385.8371, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 157)'),
(65, 4, 'yii\\db\\Command::execute', 1583696477.6266, 'Administrator', 'INSERT INTO `transaksi` (`nomor_transaksi`, `nomor_sj`, `tanggal`, `id_customer`) VALUES (\'001/INV/MDK/III/2020\', \'001/SJ/MDK/III/2020\', \'2020-03-09\', 2)'),
(66, 4, 'yii\\db\\Command::execute', 1583697530.4154, 'Administrator', 'INSERT INTO `transaksi` (`nomor_transaksi`, `nomor_sj`, `tanggal`, `id_customer`) VALUES (\'002/INV/MDK/III/2020\', \'002/SJ/MDK/III/2020\', \'2020-03-09\', 4)'),
(67, 4, 'yii\\db\\Command::execute', 1583734942.7547, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-003\', \'Blezer Hitam\', 12)'),
(68, 4, 'yii\\db\\Command::execute', 1583734942.8006, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (3)'),
(69, 4, 'yii\\db\\Command::execute', 1583734958.2487, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-004\', \'Gamis\', 12)'),
(70, 4, 'yii\\db\\Command::execute', 1583734958.2737, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (4)'),
(71, 4, 'yii\\db\\Command::execute', 1583735068.2885, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-001\', \'White based 1\', 8)'),
(72, 4, 'yii\\db\\Command::execute', 1583735068.311, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (1)'),
(73, 4, 'yii\\db\\Command::execute', 1583735088.5324, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-002\', \'White based 1 NAT\', 8)'),
(74, 4, 'yii\\db\\Command::execute', 1583735088.5556, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (2)'),
(75, 4, 'yii\\db\\Command::execute', 1583735102.2624, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-003\', \'White based 2\', 8)'),
(76, 4, 'yii\\db\\Command::execute', 1583735102.2873, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (3)'),
(77, 4, 'yii\\db\\Command::execute', 1583735115.9383, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-004\', \'White based 2 NAT\', 8)'),
(78, 4, 'yii\\db\\Command::execute', 1583735115.9575, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (4)'),
(79, 4, 'yii\\db\\Command::execute', 1583735127.5001, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-005\', \'White based 3\', 8)'),
(80, 4, 'yii\\db\\Command::execute', 1583735127.5188, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (5)'),
(81, 4, 'yii\\db\\Command::execute', 1583735139.329, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-006\', \'White based 3 NAT\', 8)'),
(82, 4, 'yii\\db\\Command::execute', 1583735139.3493, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (6)'),
(83, 4, 'yii\\db\\Command::execute', 1583735151.14, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-007\', \'White based 6\', 8)'),
(84, 4, 'yii\\db\\Command::execute', 1583735151.1617, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (7)'),
(85, 4, 'yii\\db\\Command::execute', 1583735164.105, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-008\', \'White based 12 \', 8)'),
(86, 4, 'yii\\db\\Command::execute', 1583735164.1272, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (8)'),
(87, 4, 'yii\\db\\Command::execute', 1583735177.505, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-009\', \'White based 12 NAT\', 8)'),
(88, 4, 'yii\\db\\Command::execute', 1583735177.5273, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (9)'),
(89, 4, 'yii\\db\\Command::execute', 1583735195.6117, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-010\', \'White based 15\', 8)'),
(90, 4, 'yii\\db\\Command::execute', 1583735195.6335, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (10)'),
(91, 4, 'yii\\db\\Command::execute', 1583735208.8554, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-011\', \'White based 18\', 8)'),
(92, 4, 'yii\\db\\Command::execute', 1583735208.8794, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (11)'),
(93, 4, 'yii\\db\\Command::execute', 1583735219.7623, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-012\', \'White based 19\', 8)'),
(94, 4, 'yii\\db\\Command::execute', 1583735219.7878, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (12)'),
(95, 4, 'yii\\db\\Command::execute', 1583735229.8607, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-013\', \'Wood 1\', 8)'),
(96, 4, 'yii\\db\\Command::execute', 1583735229.8839, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (13)'),
(97, 4, 'yii\\db\\Command::execute', 1583735239.4441, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-014\', \'Wood 2\', 8)'),
(98, 4, 'yii\\db\\Command::execute', 1583735239.4618, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (14)'),
(99, 4, 'yii\\db\\Command::execute', 1583735253.7679, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-015\', \'Wood 3\', 8)'),
(100, 4, 'yii\\db\\Command::execute', 1583735253.7899, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (15)'),
(101, 4, 'yii\\db\\Command::execute', 1583735264.5636, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-016\', \'Wood 5\', 8)'),
(102, 4, 'yii\\db\\Command::execute', 1583735264.6176, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (16)'),
(103, 4, 'yii\\db\\Command::execute', 1583735281.5611, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-017\', \'Wood 6\', 8)'),
(104, 4, 'yii\\db\\Command::execute', 1583735281.5931, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (17)'),
(105, 4, 'yii\\db\\Command::execute', 1583735294.6327, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-018\', \'Wood 7\', 8)'),
(106, 4, 'yii\\db\\Command::execute', 1583735294.6551, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (18)'),
(107, 4, 'yii\\db\\Command::execute', 1583735305.0875, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-019\', \'Wood 8\', 8)'),
(108, 4, 'yii\\db\\Command::execute', 1583735305.1081, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (19)'),
(109, 4, 'yii\\db\\Command::execute', 1583735315.8149, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-020\', \'Wood 9\', 8)'),
(110, 4, 'yii\\db\\Command::execute', 1583735315.8405, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (20)'),
(111, 4, 'yii\\db\\Command::execute', 1583735326.1831, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-021\', \'Wood 10\', 8)'),
(112, 4, 'yii\\db\\Command::execute', 1583735326.2145, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (21)'),
(113, 4, 'yii\\db\\Command::execute', 1583735336.8253, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-022\', \'Wood 12\', 8)'),
(114, 4, 'yii\\db\\Command::execute', 1583735336.8519, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (22)'),
(115, 4, 'yii\\db\\Command::execute', 1583735347.0925, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-023\', \'Wood 13\', 8)'),
(116, 4, 'yii\\db\\Command::execute', 1583735347.1141, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (23)'),
(117, 4, 'yii\\db\\Command::execute', 1583735358.0854, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-024\', \'Wood 14\', 8)'),
(118, 4, 'yii\\db\\Command::execute', 1583735358.1051, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (24)'),
(119, 4, 'yii\\db\\Command::execute', 1583735369.4412, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-025\', \'Wood 14 NAT\', 8)'),
(120, 4, 'yii\\db\\Command::execute', 1583735369.4639, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (25)'),
(121, 4, 'yii\\db\\Command::execute', 1583735381.2827, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-026\', \'Wood 15\', 8)'),
(122, 4, 'yii\\db\\Command::execute', 1583735381.3008, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (26)'),
(123, 4, 'yii\\db\\Command::execute', 1583735392.1908, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-027\', \'Wood 15 NAT\', 8)'),
(124, 4, 'yii\\db\\Command::execute', 1583735392.2091, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (27)'),
(125, 4, 'yii\\db\\Command::execute', 1583735402.967, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-028\', \'Marble 1\', 8)'),
(126, 4, 'yii\\db\\Command::execute', 1583735402.993, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (28)'),
(127, 4, 'yii\\db\\Command::execute', 1583735414.0295, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-029\', \'Marble 3\', 8)'),
(128, 4, 'yii\\db\\Command::execute', 1583735414.0541, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (29)'),
(129, 4, 'yii\\db\\Command::execute', 1583735425.9198, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-030\', \'Lime Green\', 8)'),
(130, 4, 'yii\\db\\Command::execute', 1583735425.943, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (30)'),
(131, 4, 'yii\\db\\Command::execute', 1583735436.518, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-031\', \'Royal Blue\', 8)'),
(132, 4, 'yii\\db\\Command::execute', 1583735436.5406, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (31)'),
(133, 4, 'yii\\db\\Command::execute', 1583735447.5078, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-032\', \'China Red\', 8)'),
(134, 4, 'yii\\db\\Command::execute', 1583735447.5329, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (32)'),
(135, 4, 'yii\\db\\Command::execute', 1583735510.9233, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-033\', \'Profil Lis A putih\', 8)'),
(136, 4, 'yii\\db\\Command::execute', 1583735510.9474, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (33)'),
(137, 4, 'yii\\db\\Command::execute', 1583735522.3176, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-034\', \'Profil Lis A coklat\', 8)'),
(138, 4, 'yii\\db\\Command::execute', 1583735522.3441, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (34)'),
(139, 4, 'yii\\db\\Command::execute', 1583735532.4741, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-035\', \'Profil Lis B putih\', 8)'),
(140, 4, 'yii\\db\\Command::execute', 1583735532.4969, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (35)'),
(141, 4, 'yii\\db\\Command::execute', 1583735541.9963, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-036\', \'Profil Lis B coklat\', 8)'),
(142, 4, 'yii\\db\\Command::execute', 1583735542.0438, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (36)'),
(143, 4, 'yii\\db\\Command::execute', 1583735554.8294, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-037\', \'Profil Lis C putih\', 8)'),
(144, 4, 'yii\\db\\Command::execute', 1583735554.8519, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (37)'),
(145, 4, 'yii\\db\\Command::execute', 1583735585.277, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-038\', \'Profil Lis C coklat\', 8)'),
(146, 4, 'yii\\db\\Command::execute', 1583735585.2999, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (38)'),
(147, 4, 'yii\\db\\Command::execute', 1583735596.177, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-039\', \'Profil Lis D putih\', 8)'),
(148, 4, 'yii\\db\\Command::execute', 1583735596.1973, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (39)'),
(149, 4, 'yii\\db\\Command::execute', 1583735606.4665, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-040\', \'Profil Lis D coklat\', 8)'),
(150, 4, 'yii\\db\\Command::execute', 1583735606.4897, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (40)'),
(151, 4, 'yii\\db\\Command::execute', 1583735616.9957, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-041\', \'Profil Lis E putih\', 8)'),
(152, 4, 'yii\\db\\Command::execute', 1583735617.0264, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (41)'),
(153, 4, 'yii\\db\\Command::execute', 1583735625.658, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-042\', \'Profil Lis E coklat\', 8)'),
(154, 4, 'yii\\db\\Command::execute', 1583735625.6808, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (42)'),
(155, 4, 'yii\\db\\Command::execute', 1583735637.4636, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-043\', \'Profil Lis L putih\', 8)'),
(156, 4, 'yii\\db\\Command::execute', 1583735637.4819, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (43)'),
(157, 4, 'yii\\db\\Command::execute', 1583735649.9833, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-044\', \'Profil Lis L coklat\', 8)'),
(158, 4, 'yii\\db\\Command::execute', 1583735650.0243, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (44)'),
(159, 4, 'yii\\db\\Command::execute', 1583735661.7689, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-045\', \'Profil Lis T putih\', 8)'),
(160, 4, 'yii\\db\\Command::execute', 1583735661.7914, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (45)'),
(161, 4, 'yii\\db\\Command::execute', 1583735677.3456, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-046\', \'Profil Lis T coklat\', 8)'),
(162, 4, 'yii\\db\\Command::execute', 1583735677.3712, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (46)'),
(163, 4, 'yii\\db\\Command::execute', 1583735731.1099, 'Administrator', 'UPDATE `harga_barang` SET `id_barang`=1, `distributor`=8400, `toko1`=11400, `toko2`=10700, `toko3`=10000, `toko4`=9800, `toko5`=10200, `konsumen`=15300 WHERE `id_harga_barang`=1'),
(164, 4, 'yii\\db\\Command::execute', 1583735783.8033, 'Administrator', 'UPDATE `harga_barang` SET `id_barang`=2, `distributor`=8400, `toko1`=11400, `toko2`=10700, `toko3`=10000, `toko4`=9800, `toko5`=10200, `konsumen`=15300 WHERE `id_harga_barang`=2'),
(165, 4, 'yii\\db\\Command::execute', 1583737861.1602, 'Administrator', 'INSERT INTO `transaksi` (`nomor_sj`, `tanggal`, `nomor_transaksi`, `id_customer`) VALUES (\'001/SJ/MDK/III/2020\', \'2020-03-09\', \'001/INV/MDK/III/2020\', 2)'),
(166, 4, 'yii\\db\\Command::execute', 1583738977.4624, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `jenis_harga`, `ukuran_perlembar`, `jumlah_lembar`) VALUES (1, 1, 1, 3, 100)'),
(167, 4, 'yii\\db\\Command::execute', 1583740632.3782, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `jenis_harga`, `ukuran_perlembar`, `jumlah_lembar`) VALUES (1, 2, 2, 5, 150)'),
(168, 4, 'yii\\db\\Command::execute', 1583742100.9972, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `jenis_harga`, `ukuran_perlembar`, `jumlah_lembar`) VALUES (1, 2, 6, 5, 200)'),
(169, 4, 'yii\\db\\Command::execute', 1583742522.6531, 'Administrator', 'DELETE FROM `transaksi_detail` WHERE `id_transaksi_detail`=3'),
(170, 4, 'yii\\db\\Command::execute', 1583743004.788, 'Administrator', 'DELETE FROM `transaksi_detail` WHERE `id_transaksi_detail`=2'),
(171, 4, 'yii\\db\\Command::execute', 1583743006.8918, 'Administrator', 'DELETE FROM `transaksi_detail` WHERE `id_transaksi_detail`=1'),
(172, 4, 'yii\\db\\Command::execute', 1583743018.6277, 'Administrator', 'DELETE FROM `transaksi` WHERE `id_transaksi`=1'),
(173, 4, 'yii\\db\\Command::execute', 1583743034.4955, 'Administrator', 'INSERT INTO `transaksi` (`nomor_sj`, `tanggal`, `status`, `nomor_transaksi`, `id_customer`) VALUES (\'001/SJ/MDK/III/2020\', \'2020-03-09\', 1, \'001/INV/MDK/III/2020\', 2)'),
(174, 4, 'yii\\db\\Command::execute', 1583743050.129, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `jenis_harga`, `ukuran_perlembar`, `jumlah_lembar`) VALUES (2, 1, 1, 3, 150)'),
(175, 4, 'yii\\db\\Command::execute', 1583744054.8674, 'Administrator', 'UPDATE `transaksi` SET `nomor_sj`=\'001/INV/MDK/III/2020\', `id_customer`=4, `status`=0 WHERE `id_transaksi`=2'),
(176, 4, 'yii\\db\\Command::execute', 1583812113.3578, 'Administrator', 'INSERT INTO `transaksi` (`nomor_sj`, `tanggal`, `status`, `nomor_transaksi`, `id_customer`) VALUES (\'003/SJ/MDK/III/2020\', \'2020-03-10\', 0, \'003/INV/MDK/III/2020\', 2)'),
(177, 4, 'yii\\db\\Command::execute', 1583812129.5934, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `jenis_harga`, `ukuran_perlembar`, `jumlah_lembar`) VALUES (3, 1, 1, 5, 200)'),
(178, 0, 'Login', 1584612648.1171, 'Administrator', 'Login'),
(179, 4, 'yii\\db\\Command::execute', 1584612648.1173, 'Administrator', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1584612648.1171, \'Administrator\', \'Login\')'),
(180, 4, 'yii\\db\\Command::execute', 1584612705.7232, 'Administrator', 'INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_satuan`) VALUES (\'KB-047\', \'aqua\', 5)'),
(181, 4, 'yii\\db\\Command::execute', 1584612705.751, 'Administrator', 'INSERT INTO `harga_barang` (`id_barang`) VALUES (47)'),
(182, 4, 'yii\\db\\Command::execute', 1584612752.8505, 'Administrator', 'INSERT INTO `transaksi` (`nomor_sj`, `tanggal`, `status`, `nomor_transaksi`, `id_customer`) VALUES (\'004/SJ/MDK/III/2020\', \'2020-03-19\', 0, \'004/INV/MDK/III/2020\', 6)'),
(183, 4, 'yii\\db\\Command::execute', 1584612789.5198, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `jenis_harga`, `ukuran_perlembar`, `jumlah_lembar`) VALUES (4, 1, 1, 3, 100000)'),
(184, 0, 'Login', 1585588162.4312, 'Administrator', 'Login'),
(185, 4, 'yii\\db\\Command::execute', 1585588162.4314, 'Administrator', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1585588162.4312, \'Administrator\', \'Login\')'),
(186, 0, 'Login', 1585732735.7241, 'Administrator', 'Login'),
(187, 4, 'yii\\db\\Command::execute', 1585732735.7242, 'Administrator', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1585732735.7241, \'Administrator\', \'Login\')'),
(188, 0, 'Login', 1585732757.4459, 'Administrator', 'Login'),
(189, 4, 'yii\\db\\Command::execute', 1585732757.4461, 'Administrator', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1585732757.4459, \'Administrator\', \'Login\')'),
(190, 4, 'yii\\db\\Command::execute', 1585734862.9065, 'Administrator', 'UPDATE `harga_barang` SET `id_barang`=1, `distributor`=8500, `konsumen`=10000 WHERE `id_harga_barang`=1'),
(191, 4, 'yii\\db\\Command::execute', 1585759381.5246, 'Administrator', 'INSERT INTO `transaksi` (`nomor_sj`, `tanggal`, `status`, `nomor_transaksi`, `id_customer`) VALUES (\'005/SJ/MDK/IV/2020\', \'2020-04-01\', 0, \'005/INV/MDK/IV/2020\', 4)'),
(192, 4, 'yii\\db\\Command::execute', 1585759813.9324, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `jenis_harga`, `ukuran_perlembar`, `jumlah_lembar`) VALUES (5, 1, 1, 5, 200)'),
(193, 4, 'yii\\db\\Command::execute', 1585760556.4301, 'Administrator', 'UPDATE `menu_navigasi` SET `nama_menu`=\'Transaksi Distributor\', `id_parent`=155, `no_urut`=1, `status`=0 WHERE `id_menu`=156'),
(194, 4, 'yii\\db\\Command::execute', 1585760634.3336, 'Administrator', 'INSERT INTO `menu_navigasi` (`nama_menu`, `url`, `id_parent`, `icon`, `status`, `no_urut`) VALUES (\'Transaksi konsumen\', \'transaksi/create1\', 155, \'dollar-sign\', 0, 3)'),
(195, 4, 'yii\\db\\Command::execute', 1585760637.3288, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'158\''),
(196, 4, 'yii\\db\\Command::execute', 1585760637.3449, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 158)'),
(197, 4, 'yii\\db\\Command::execute', 1585760658.8471, 'Administrator', 'UPDATE `menu_navigasi` SET `id_parent`=155, `no_urut`=3, `status`=0 WHERE `id_menu`=157'),
(198, 4, 'yii\\db\\Command::execute', 1585760670.9563, 'Administrator', 'UPDATE `menu_navigasi` SET `id_parent`=155, `no_urut`=2, `status`=0 WHERE `id_menu`=158'),
(199, 4, 'yii\\db\\Command::execute', 1585761142.9717, 'Administrator', 'INSERT INTO `transaksi` (`nomor_sj`, `nomor_po`, `tanggal`, `status`, `nomor_transaksi`, `id_customer`) VALUES (\'001/SJ/MDK/IV/2020\', \'001/SJ/MDK/IV/2020\', \'2020-04-02\', 0, \'001/INV/MDK/IV/2020\', 4)'),
(200, 4, 'yii\\db\\Command::execute', 1585761191.5322, 'Administrator', 'INSERT INTO `transaksi` (`nomor_sj`, `nomor_po`, `tanggal`, `status`, `nomor_transaksi`, `id_customer`) VALUES (\'001/SJ/MDK/IV/2020\', \'001/PO/MDK/IV/2020\', \'2020-04-02\', 0, \'001/INV/MDK/IV/2020\', 4)'),
(201, 4, 'yii\\db\\Command::execute', 1585761928.7334, 'Administrator', 'INSERT INTO `transaksi` (`jenis_transaksi`, `nomor_sj`, `nomor_po`, `tanggal`, `status`, `nomor_transaksi`, `id_customer`) VALUES (1, \'001/SJ/MDK/IV/2020\', \'001/PO/MDK/IV/2020\', \'2020-04-02\', 0, \'001/INV/MDK/IV/2020\', 4)'),
(202, 4, 'yii\\db\\Command::execute', 1585762054.0613, 'Administrator', 'INSERT INTO `transaksi` (`jenis_transaksi`, `nomor_sj`, `nomor_po`, `tanggal`, `status`, `nomor_transaksi`, `id_customer`) VALUES (0, \'002/SJ/MDK/IV/2020\', \'002/PO/MDK/IV/2020\', \'2020-04-02\', 0, \'002/INV/MDK/IV/2020\', 4)'),
(203, 4, 'yii\\db\\Command::execute', 1585763787.8342, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `ukuran_perlembar`, `jumlah_lembar`) VALUES (2, 1, 5, 100)'),
(204, 4, 'yii\\db\\Command::execute', 1585764117.8209, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `ukuran_perlembar`, `jumlah_lembar`, `harga`) VALUES (2, 1, 5, 150, 8500)'),
(205, 4, 'yii\\db\\Command::execute', 1585764728.2701, 'Administrator', 'DELETE FROM `transaksi_detail` WHERE `id_transaksi_detail`=1'),
(206, 4, 'yii\\db\\Command::execute', 1585764738.0873, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `ukuran_perlembar`, `jumlah_lembar`, `harga`) VALUES (2, 1, 5, 150, 8500)'),
(207, 4, 'yii\\db\\Command::execute', 1585766017.5317, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `ukuran_perlembar`, `jumlah_lembar`, `harga`) VALUES (2, 2, 3, 200, 8400)'),
(208, 4, 'yii\\db\\Command::execute', 1585766327.3795, 'Administrator', 'DELETE FROM `transaksi_detail` WHERE `id_transaksi_detail`=3'),
(209, 4, 'yii\\db\\Command::execute', 1585768821.8228, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `ukuran_perlembar`, `jumlah_lembar`, `harga`) VALUES (2, 3, 5, 150, 0)'),
(210, 4, 'yii\\db\\Command::execute', 1585768830.163, 'Administrator', 'DELETE FROM `transaksi_detail` WHERE `id_transaksi_detail`=4'),
(211, 4, 'yii\\db\\Command::execute', 1585768841.5698, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `ukuran_perlembar`, `jumlah_lembar`, `harga`) VALUES (2, 2, 5, 100, 8400)'),
(212, 4, 'yii\\db\\Command::execute', 1585990916.597, 'Administrator', 'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (2, NULL, NULL, NULL, 0, 0, 0)'),
(213, 4, 'yii\\db\\Command::execute', 1585990916.7921, 'Administrator', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`)\r\n                VALUES (4, \'yii\\\\db\\\\Command::execute\', 1585990916.597, \'Administrator\', \'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (2, NULL, NULL, NULL, 0, 0, 0)\')'),
(214, 4, 'yii\\db\\Command::execute', 1585991039.1597, 'Administrator', 'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (2, NULL, 0, 0.02, 0, 0, 0)'),
(215, 4, 'yii\\db\\Command::execute', 1585991039.1841, 'Administrator', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`)\r\n                VALUES (4, \'yii\\\\db\\\\Command::execute\', 1585991039.1597, \'Administrator\', \'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (2, NULL, 0, 0.02, 0, 0, 0)\')'),
(216, 4, 'yii\\db\\Command::execute', 1585991212.4319, 'Administrator', 'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (2, NULL, NULL, NULL, 0, 0, 0)'),
(217, 4, 'yii\\db\\Command::execute', 1585991212.4614, 'Administrator', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`)\r\n                VALUES (4, \'yii\\\\db\\\\Command::execute\', 1585991212.4319, \'Administrator\', \'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (2, NULL, NULL, NULL, 0, 0, 0)\')'),
(218, 4, 'yii\\db\\Command::execute', 1585991782.4644, 'Administrator', 'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (2, 10575000, 0, 0.02, 10363500, 103635, 10467135)'),
(219, 4, 'yii\\db\\Command::execute', 1585991871.3745, 'Administrator', 'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (2, 10575000, 0, 0.02, 10363500, 103635, 10467135)'),
(220, 4, 'yii\\db\\Command::execute', 1585992004.3689, 'Administrator', 'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (2, 10575000, 0, 0.02, 10363500, 103635, 10467135)'),
(221, 4, 'yii\\db\\Command::execute', 1585992699.6785, 'Administrator', 'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (2, 10575000, 0, 0, 10575000, 105750, 10680750)'),
(222, 4, 'yii\\db\\Command::execute', 1585992730.1335, 'Administrator', 'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (2, 10575000, 0, 0.02, 10363500, 103635, 10467135)'),
(223, 4, 'yii\\db\\Command::execute', 1585992823.3061, 'Administrator', 'INSERT INTO `transaksi` (`jenis_transaksi`, `nomor_sj`, `nomor_po`, `tanggal`, `status`, `nomor_transaksi`, `id_customer`) VALUES (0, \'003/SJ/MDK/IV/2020\', \'003/PO/MDK/IV/2020\', \'2020-04-04\', 0, \'003/INV/MDK/IV/2020\', 7)'),
(224, 4, 'yii\\db\\Command::execute', 1585992966.4415, 'Administrator', 'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (2, 10575000, 0, 0.02, 10363500, 103635, 10467135)'),
(225, 4, 'yii\\db\\Command::execute', 1585994578.213, 'Administrator', 'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (2, 10575000, 0, 0.02, 10363500, 1036350, 11399850)'),
(226, 4, 'yii\\db\\Command::execute', 1586000463.1592, 'Administrator', 'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (2, 10575000, 12000, 0.02, 10363500, 1036350, 11411850)'),
(227, 4, 'yii\\db\\Command::execute', 1586000818.6993, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `ukuran_perlembar`, `jumlah_lembar`, `harga`) VALUES (3, 1, 5, 200, 8500)'),
(228, 4, 'yii\\db\\Command::execute', 1586001237.362, 'Administrator', 'UPDATE `transaksi_detail` SET `id_transaksi`=3, `harga`=9000 WHERE `id_transaksi_detail`=6'),
(229, 4, 'yii\\db\\Command::execute', 1586001315.1968, 'Administrator', 'UPDATE `transaksi_detail` SET `id_transaksi`=3, `harga`=8500 WHERE `id_transaksi_detail`=6'),
(230, 4, 'yii\\db\\Command::execute', 1586001374.001, 'Administrator', 'UPDATE `transaksi_detail` SET `id_transaksi`=6, `harga`=9000 WHERE `id_transaksi_detail`=6'),
(231, 4, 'yii\\db\\Command::execute', 1586001504.693, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `ukuran_perlembar`, `jumlah_lembar`, `harga`) VALUES (3, 1, 5, 150, 8500)'),
(232, 4, 'yii\\db\\Command::execute', 1586001508.4571, 'Administrator', 'DELETE FROM `transaksi_detail` WHERE `id_transaksi_detail`=7'),
(233, 4, 'yii\\db\\Command::execute', 1586001517.6909, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `ukuran_perlembar`, `jumlah_lembar`, `harga`) VALUES (3, 1, 5, 200, 8500)'),
(234, 4, 'yii\\db\\Command::execute', 1586001527.1788, 'Administrator', 'UPDATE `transaksi_detail` SET `id_transaksi`=3, `harga`=9000 WHERE `id_transaksi_detail`=8'),
(235, 4, 'yii\\db\\Command::execute', 1586001584.2687, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `ukuran_perlembar`, `jumlah_lembar`, `harga`) VALUES (3, 1, 5, 200, 8500)'),
(236, 4, 'yii\\db\\Command::execute', 1586001647.2653, 'Administrator', 'UPDATE `transaksi_detail` SET `id_transaksi`=3, `harga`=9000 WHERE `id_transaksi_detail`=9'),
(237, 4, 'yii\\db\\Command::execute', 1586001689.0008, 'Administrator', 'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (3, 9000000, 0, 0, 9000000, 900000, 9900000)'),
(238, 4, 'yii\\db\\Command::execute', 1586014425.1001, 'Administrator', 'DELETE FROM `transaksi_detail` WHERE `id_transaksi_detail`=9'),
(239, 4, 'yii\\db\\Command::execute', 1586014438.2017, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `ukuran_perlembar`, `jumlah_lembar`, `harga`) VALUES (3, 1, 5, 150, 8500)'),
(240, 4, 'yii\\db\\Command::execute', 1586014442.6382, 'Administrator', 'DELETE FROM `transaksi_detail` WHERE `id_transaksi_detail`=10'),
(241, 4, 'yii\\db\\Command::execute', 1586014461.8772, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `ukuran_perlembar`, `jumlah_lembar`, `harga`) VALUES (3, 1, 5, 150, 8500)'),
(242, 4, 'yii\\db\\Command::execute', 1586014572.7858, 'Administrator', 'DELETE FROM `transaksi_detail` WHERE `id_transaksi_detail`=11'),
(243, 4, 'yii\\db\\Command::execute', 1586014603.7166, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `ukuran_perlembar`, `jumlah_lembar`, `harga`) VALUES (3, 1, 5, 150, 10000)'),
(244, 4, 'yii\\db\\Command::execute', 1586014650.5123, 'Administrator', 'DELETE FROM `transaksi_detail` WHERE `id_transaksi_detail`=12'),
(245, 4, 'yii\\db\\Command::execute', 1586014858.2186, 'Administrator', 'INSERT INTO `transaksi` (`jenis_transaksi`, `nomor_sj`, `nomor_po`, `tanggal`, `status`, `nomor_transaksi`, `id_customer`) VALUES (0, \'004/SJ/MDK/IV/2020\', \'004/PO/MDK/IV/2020\', \'2020-04-04\', 0, \'004/INV/MDK/IV/2020\', 7)'),
(246, 4, 'yii\\db\\Command::execute', 1586014916.0517, 'Administrator', 'DELETE FROM `transaksi` WHERE `id_transaksi`=4'),
(247, 4, 'yii\\db\\Command::execute', 1586015013.0191, 'Administrator', 'INSERT INTO `transaksi` (`jenis_transaksi`, `nomor_sj`, `nomor_po`, `tanggal`, `status`, `nomor_transaksi`, `id_customer`) VALUES (1, \'004/SJ/MDK/IV/2020\', \'004/PO/MDK/IV/2020\', \'2020-04-04\', 0, \'004/INV/MDK/IV/2020\', 7)'),
(248, 4, 'yii\\db\\Command::execute', 1586015109.6911, 'Administrator', 'UPDATE `transaksi` SET `jenis_transaksi`=0, `nomor_sj`=\'001/INV/MDK/IV/2020\', `nomor_po`=\'001/INV/MDK/IV/2020\', `id_customer`=5, `status`=0 WHERE `id_transaksi`=1'),
(249, 4, 'yii\\db\\Command::execute', 1586016369.7126, 'Administrator', 'UPDATE `transaksi` SET `status`=1 WHERE `id_transaksi`=2'),
(250, 4, 'yii\\db\\Command::execute', 1586071799.469, 'Administrator', 'INSERT INTO `transaksi_detail` (`id_transaksi`, `id_barang`, `ukuran_perlembar`, `jumlah_lembar`, `harga`) VALUES (1, 1, 10, 500, 10000)'),
(251, 4, 'yii\\db\\Command::execute', 1586071819.3276, 'Administrator', 'INSERT INTO `transaksi_fix` (`id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES (1, 50000000, 20000, 0, 50000000, 5000000, 55020000)');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id_login`, `username`, `password`, `nama`, `foto`) VALUES
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'avatar5.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_navigasi`
--

CREATE TABLE `menu_navigasi` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `id_parent` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu_navigasi`
--

INSERT INTO `menu_navigasi` (`id_menu`, `nama_menu`, `url`, `id_parent`, `no_urut`, `icon`, `status`) VALUES
(1, 'Master Data', '#', 0, 1, 'database', 0),
(2, 'User Account', 'login', 1, 2, 'sign-in-alt', 0),
(3, 'Menu Navigasi', 'menu-navigasi', 1, 1, 'bars', 0),
(4, 'Hak Akses', 'systemrole', 1, 3, 'at', 0),
(5, 'Setting Company', 'setting', 1, 4, 'cogs', 0),
(115, 'Log', '#', 0, 3, 'check-circle', 0),
(124, 'Log', '/log', 115, 1, 'list-ul', 0),
(125, 'Rekap Log', '/log/rekap-log', 115, 2, 'list-ul', 0),
(152, 'Satuan', 'satuan', 1, 5, 'list', 0),
(153, 'Barang', 'barang', 1, 6, 'boxes', 0),
(154, 'Customer', 'customer', 1, 7, 'users', 0),
(155, 'Transaksi', '#', 0, 2, 'hand-holding-usd', 0),
(156, 'Transaksi Distributor', 'transaksi/create', 155, 1, 'dollar-sign', 0),
(157, 'Daftar Transaksi', 'transaksi', 155, 3, 'file-invoice-dollar', 0),
(158, 'Transaksi konsumen', 'transaksi/create1', 155, 2, 'dollar-sign', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_navigasi_role`
--

CREATE TABLE `menu_navigasi_role` (
  `id_menu_role` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_system_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu_navigasi_role`
--

INSERT INTO `menu_navigasi_role` (`id_menu_role`, `id_menu`, `id_system_role`) VALUES
(1, 1, 1),
(3, 3, 1),
(4, 2, 1),
(5, 4, 1),
(6, 5, 1),
(7, 115, 1),
(8, 124, 1),
(9, 125, 1),
(23, 152, 1),
(24, 153, 1),
(25, 154, 1),
(26, 155, 1),
(27, 156, 1),
(28, 157, 1),
(29, 158, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuan`
--

CREATE TABLE `satuan` (
  `id_satuan` int(11) NOT NULL,
  `satuan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `satuan`
--

INSERT INTO `satuan` (`id_satuan`, `satuan`) VALUES
(1, 'Botol'),
(2, 'Buah'),
(3, 'Bungkus'),
(4, 'Butir'),
(5, 'Dos'),
(6, 'Dozen'),
(7, 'Gram'),
(8, 'Karton'),
(9, 'Kilogram'),
(10, 'Lusin'),
(11, 'Paket'),
(12, 'Pcs'),
(13, 'Potong'),
(14, 'Set'),
(15, 'Ton'),
(16, 'Liter');

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `nama_bank` varchar(100) NOT NULL,
  `nomor_rekening` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `setting`
--

INSERT INTO `setting` (`id_setting`, `nama`, `email`, `alamat`, `telepon`, `nama_bank`, `nomor_rekening`, `foto`) VALUES
(1, 'PT. MITRA DWIARTHA KOMPAKINDO', '-', '-', '085692228990', '-', 0, '1583683076_1583591910_logo.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_role`
--

CREATE TABLE `system_role` (
  `id_system_role` int(11) NOT NULL,
  `nama_role` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `system_role`
--

INSERT INTO `system_role` (`id_system_role`, `nama_role`) VALUES
(1, 'SYSTEM ADMINISTRATOR');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `jenis_transaksi` int(11) NOT NULL,
  `nomor_transaksi` varchar(100) NOT NULL,
  `nomor_sj` varchar(100) NOT NULL,
  `nomor_po` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `id_customer` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `jenis_transaksi`, `nomor_transaksi`, `nomor_sj`, `nomor_po`, `tanggal`, `id_customer`, `status`) VALUES
(1, 1, '001/INV/MDK/IV/2020', '001/INV/MDK/IV/2020', '001/INV/MDK/IV/2020', '2020-04-02', 5, 0),
(2, 0, '002/INV/MDK/IV/2020', '002/SJ/MDK/IV/2020', '002/PO/MDK/IV/2020', '2020-04-02', 4, 1),
(3, 0, '003/INV/MDK/IV/2020', '003/SJ/MDK/IV/2020', '003/PO/MDK/IV/2020', '2020-04-04', 7, 0),
(5, 1, '004/INV/MDK/IV/2020', '004/SJ/MDK/IV/2020', '004/PO/MDK/IV/2020', '2020-04-04', 7, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id_transaksi_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `ukuran_perlembar` int(11) NOT NULL,
  `jumlah_lembar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id_transaksi_detail`, `id_transaksi`, `id_barang`, `harga`, `ukuran_perlembar`, `jumlah_lembar`) VALUES
(2, 2, 1, 8500, 5, 150),
(5, 2, 2, 8400, 5, 100),
(13, 1, 1, 10000, 10, 500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_fix`
--

CREATE TABLE `transaksi_fix` (
  `id_transaksi_fix` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `total_sp` int(11) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `diskon` double NOT NULL,
  `dpp` int(11) NOT NULL,
  `dpn` int(11) NOT NULL,
  `total_akhir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi_fix`
--

INSERT INTO `transaksi_fix` (`id_transaksi_fix`, `id_transaksi`, `total_sp`, `ongkir`, `diskon`, `dpp`, `dpn`, `total_akhir`) VALUES
(1, 2, 10575000, 12000, 0.02, 10363500, 1036350, 11411850),
(3, 1, 50000000, 20000, 0, 50000000, 5000000, 55020000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id_user_role` int(11) NOT NULL,
  `id_system_role` int(11) NOT NULL,
  `id_login` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id_user_role`, `id_system_role`, `id_login`) VALUES
(1, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id_foto`);

--
-- Indeks untuk tabel `harga_barang`
--
ALTER TABLE `harga_barang`
  ADD PRIMARY KEY (`id_harga_barang`);

--
-- Indeks untuk tabel `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `menu_navigasi`
--
ALTER TABLE `menu_navigasi`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `menu_navigasi_role`
--
ALTER TABLE `menu_navigasi_role`
  ADD PRIMARY KEY (`id_menu_role`);

--
-- Indeks untuk tabel `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indeks untuk tabel `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indeks untuk tabel `system_role`
--
ALTER TABLE `system_role`
  ADD PRIMARY KEY (`id_system_role`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`id_transaksi_detail`);

--
-- Indeks untuk tabel `transaksi_fix`
--
ALTER TABLE `transaksi_fix`
  ADD PRIMARY KEY (`id_transaksi_fix`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id_user_role`),
  ADD KEY `id_system_role` (`id_system_role`),
  ADD KEY `id_login` (`id_login`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `foto`
--
ALTER TABLE `foto`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `harga_barang`
--
ALTER TABLE `harga_barang`
  MODIFY `id_harga_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `log`
--
ALTER TABLE `log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `menu_navigasi`
--
ALTER TABLE `menu_navigasi`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT untuk tabel `menu_navigasi_role`
--
ALTER TABLE `menu_navigasi_role`
  MODIFY `id_menu_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `system_role`
--
ALTER TABLE `system_role`
  MODIFY `id_system_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `id_transaksi_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `transaksi_fix`
--
ALTER TABLE `transaksi_fix`
  MODIFY `id_transaksi_fix` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id_user_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
