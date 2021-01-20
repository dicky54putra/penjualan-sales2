-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Nov 2020 pada 10.54
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
-- Database: `penjualansales2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `angsuran`
--

CREATE TABLE `angsuran` (
  `id_angsuran` int(11) NOT NULL,
  `tanggal_angsuran` date NOT NULL,
  `total_angsuran` int(11) NOT NULL,
  `id_kolektor` int(11) NOT NULL,
  `id_pemesanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `angsuran`
--

INSERT INTO `angsuran` (`id_angsuran`, `tanggal_angsuran`, `total_angsuran`, `id_kolektor`, `id_pemesanan`) VALUES
(2, '2020-11-11', 200000, 1, 1),
(3, '2020-11-12', 150000, 1, 2),
(6, '2020-11-12', 150000, 1, 3),
(7, '2020-11-12', 600000, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `jenis_harga` varchar(20) NOT NULL,
  `jenis_pembayaran` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga`, `jenis_harga`, `jenis_pembayaran`) VALUES
(1, 'Sepatu Adidas', 150000, 'konsumen', 'cash'),
(2, 'Sepatu Adidas', 2000000, 'konsumen', 'credit');

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
-- Struktur dari tabel `kolektor`
--

CREATE TABLE `kolektor` (
  `id_kolektor` int(11) NOT NULL,
  `nama_kolektor` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tlp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kolektor`
--

INSERT INTO `kolektor` (`id_kolektor`, `nama_kolektor`, `alamat`, `tlp`) VALUES
(1, 'Diksa', 'Jepara', '087123456789'),
(2, 'four', 'Semarang', '081123456789');

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
(1, 4, 'yii\\db\\Command::execute', 1605017145.937, 'Daniel GSS', 'UPDATE `menu_navigasi` SET `nama_menu`=\'Pelanggan\', `url`=\'pelanggan\', `id_parent`=166, `no_urut`=7, `status`=0 WHERE `id_menu`=154'),
(2, 4, 'yii\\db\\Command::execute', 1605017173.4087, 'Daniel GSS', 'UPDATE `menu_navigasi` SET `id_parent`=166, `no_urut`=8, `status`=1 WHERE `id_menu`=170'),
(3, 4, 'yii\\db\\Command::execute', 1605017185.1594, 'Daniel GSS', 'UPDATE `menu_navigasi` SET `id_parent`=166, `no_urut`=5, `status`=1 WHERE `id_menu`=152'),
(4, 4, 'yii\\db\\Command::execute', 1605017204.0961, 'Daniel GSS', 'UPDATE `menu_navigasi` SET `id_parent`=166, `no_urut`=1, `status`=1 WHERE `id_menu`=167'),
(5, 4, 'yii\\db\\Command::execute', 1605017236.9779, 'Daniel GSS', 'INSERT INTO `menu_navigasi` (`nama_menu`, `url`, `id_parent`, `icon`, `status`, `no_urut`) VALUES (\'Data Sales\', \'sales\', 166, \'user\', 0, 9)'),
(6, 4, 'yii\\db\\Command::execute', 1605017240.7275, 'Daniel GSS', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'171\''),
(7, 4, 'yii\\db\\Command::execute', 1605017240.7531, 'Daniel GSS', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 171)'),
(8, 4, 'yii\\db\\Command::execute', 1605017276.5319, 'Daniel GSS', 'INSERT INTO `menu_navigasi` (`nama_menu`, `url`, `id_parent`, `icon`, `status`, `no_urut`) VALUES (\'Data Kolektor\', \'kolektor\', 166, \'user\', 0, 10)'),
(9, 4, 'yii\\db\\Command::execute', 1605017280.9915, 'Daniel GSS', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'172\''),
(10, 4, 'yii\\db\\Command::execute', 1605017281.0136, 'Daniel GSS', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 172)'),
(11, 4, 'yii\\db\\Command::execute', 1605060005.4607, 'Administrator', 'UPDATE `menu_navigasi` SET `url`=\'#\', `id_parent`=0, `no_urut`=6, `status`=0 WHERE `id_menu`=168'),
(12, 4, 'yii\\db\\Command::execute', 1605060009.6706, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'168\''),
(13, 4, 'yii\\db\\Command::execute', 1605060009.6929, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 168)'),
(14, 4, 'yii\\db\\Command::execute', 1605060009.6957, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (24, 168)'),
(15, 4, 'yii\\db\\Command::execute', 1605060009.6986, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 168)'),
(16, 4, 'yii\\db\\Command::execute', 1605061312.2416, 'Administrator', 'INSERT INTO `menu_navigasi` (`nama_menu`, `url`, `id_parent`, `icon`, `status`, `no_urut`) VALUES (\'Data Pemesanan\', \'pemesanan\', 168, \'file\', 0, 1)'),
(17, 4, 'yii\\db\\Command::execute', 1605061322.5716, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'173\''),
(18, 4, 'yii\\db\\Command::execute', 1605061322.5882, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 173)'),
(19, 4, 'yii\\db\\Command::execute', 1605061322.5925, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 173)'),
(20, 4, 'yii\\db\\Command::execute', 1605061385.3254, 'Administrator', 'INSERT INTO `menu_navigasi` (`nama_menu`, `url`, `id_parent`, `icon`, `status`, `no_urut`) VALUES (\'Data Penjualan\', \'penjualan\', 168, \'file\', 0, 2)'),
(21, 4, 'yii\\db\\Command::execute', 1605061389.4528, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'174\''),
(22, 4, 'yii\\db\\Command::execute', 1605061389.4684, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 174)'),
(23, 4, 'yii\\db\\Command::execute', 1605061389.4724, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 174)'),
(24, 4, 'yii\\db\\Command::execute', 1605061430.864, 'Administrator', 'INSERT INTO `menu_navigasi` (`nama_menu`, `url`, `id_parent`, `icon`, `status`, `no_urut`) VALUES (\'Data Angsuran\', \'angsuran\', 168, \'file\', 0, 3)'),
(25, 4, 'yii\\db\\Command::execute', 1605061435.755, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'175\''),
(26, 4, 'yii\\db\\Command::execute', 1605061435.7776, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 175)'),
(27, 4, 'yii\\db\\Command::execute', 1605061435.794, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 175)'),
(28, 4, 'yii\\db\\Command::execute', 1605061547.7684, 'Administrator', 'UPDATE `menu_navigasi` SET `url`=\'#\', `id_parent`=0, `no_urut`=7, `status`=0 WHERE `id_menu`=169'),
(29, 4, 'yii\\db\\Command::execute', 1605061549.8471, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'169\''),
(30, 4, 'yii\\db\\Command::execute', 1605061549.8665, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 169)'),
(31, 4, 'yii\\db\\Command::execute', 1605061549.8689, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 169)'),
(32, 4, 'yii\\db\\Command::execute', 1605062641.0535, 'Administrator', 'INSERT INTO `barang` (`nama_barang`, `harga`, `jenis_barang`) VALUES (\'Sepatu Adidas\', 150000, \'PCS\')'),
(33, 4, 'yii\\db\\Command::execute', 1605062994.127, 'Administrator', 'INSERT INTO `pelanggan` (`nama_pelanggan`, `alamat`, `tlp`) VALUES (\'Dicky\', \'Jepara\', \'089123456789\')'),
(34, 4, 'yii\\db\\Command::execute', 1605063021.7926, 'Administrator', 'INSERT INTO `sales` (`nama_sales`, `alamat`, `telp`) VALUES (\'Saputra\', \'Jepara\', \'085123456789\')'),
(35, 4, 'yii\\db\\Command::execute', 1605063053.4643, 'Administrator', 'INSERT INTO `kolektor` (`nama_kolektor`, `alamat`, `tlp`) VALUES (\'Diksa\', \'Jepara\', \'087123456789\')'),
(36, 4, 'yii\\db\\Command::execute', 1605064640.3414, 'Administrator', 'INSERT INTO `pemesanan` (`tanggal_pemesanan`, `paket_pemesanan`, `jumlah_pemesanan`, `id_sales`, `id_pelanggan`, `id_barang`) VALUES (\'2020-11-11\', \'Tes\', 2, 1, 1, 1)'),
(37, 4, 'yii\\db\\Command::execute', 1605066154.3578, 'Administrator', 'INSERT INTO `penjualan` (`tanggal_penjualan`, `total_penjualan`, `id_kolektor`, `id_pemesanan`) VALUES (\'2020-11-11\', 1, 1, 1)'),
(38, 4, 'yii\\db\\Command::execute', 1605075256.1921, 'Administrator', 'INSERT INTO `login` (`username`, `password`, `nama`, `foto`) VALUES (\'Jono085123456789\', \'202cb962ac59075b964b07152d234b70\', \'Jono\', \'avatar5.png\')'),
(39, 4, 'yii\\db\\Command::execute', 1605075256.2188, 'Administrator', 'INSERT INTO `user_role` (`id_system_role`, `id_login`) VALUES (23, 9)'),
(40, 4, 'yii\\db\\Command::execute', 1605075256.2227, 'Administrator', 'INSERT INTO `sales` (`nama_sales`, `alamat`, `telp`) VALUES (\'Jono\', \'Jepara\', \'085123456789\')'),
(41, 0, 'Login', 1605075305.4003, 'Jono', 'Login'),
(42, 4, 'yii\\db\\Command::execute', 1605075305.4005, 'Jono', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1605075305.4003, \'Jono\', \'Login\')'),
(43, 4, 'yii\\db\\Command::execute', 1605077209.6797, 'Administrator', 'UPDATE `login` SET `username`=\'Joni085123456789\', `password`=\'d9b1d7db4cd6e70935368a1efb10e377\', `nama`=\'Joni\' WHERE `id_login`=9'),
(44, 4, 'yii\\db\\Command::execute', 1605077209.6866, 'Administrator', 'UPDATE `sales` SET `nama_sales`=\'Joni\' WHERE `id_sales`=2'),
(45, 4, 'yii\\db\\Command::execute', 1605077496.0821, 'Administrator', 'INSERT INTO `login` (`username`, `password`, `nama`, `foto`) VALUES (\'Saputra085123456789\', \'202cb962ac59075b964b07152d234b70\', \'Saputra\', \'avatar5.png\')'),
(46, 4, 'yii\\db\\Command::execute', 1605077496.1013, 'Administrator', 'INSERT INTO `user_role` (`id_system_role`, `id_login`) VALUES (23, 10)'),
(47, 4, 'yii\\db\\Command::execute', 1605077514.202, 'Administrator', 'UPDATE `login` SET `username`=\'putra085123456789\', `password`=\'d9b1d7db4cd6e70935368a1efb10e377\', `nama`=\'putra\' WHERE `id_login`=10'),
(48, 4, 'yii\\db\\Command::execute', 1605077514.2103, 'Administrator', 'UPDATE `sales` SET `nama_sales`=\'putra\' WHERE `id_sales`=1'),
(49, 4, 'yii\\db\\Command::execute', 1605079398.6352, 'Administrator', 'UPDATE `barang` SET `harga`=150000, `jenis_harga`=\'konsumen\', `jenis_pembayaran`=\'cash\' WHERE `id_barang`=1'),
(50, 4, 'yii\\db\\Command::execute', 1605079510.3022, 'Administrator', 'INSERT INTO `barang` (`nama_barang`, `harga`, `jenis_harga`, `jenis_pembayaran`) VALUES (\'Sepatu Adidas\', 2000000, \'konsumen\', \'credit\')'),
(51, 4, 'yii\\db\\Command::execute', 1605084292.0904, 'Administrator', 'INSERT INTO `pemesanan` (`tanggal_pemesanan`, `paket_pemesanan`, `jumlah_pemesanan`, `id_sales`, `id_pelanggan`, `id_barang`) VALUES (\'2020-11-11\', \'cash\', 1, 2, 1, 1)'),
(52, 4, 'yii\\db\\Command::execute', 1605084337.4873, 'Administrator', 'UPDATE `pemesanan` SET `paket_pemesanan`=\'credit\', `jumlah_pemesanan`=1, `id_sales`=1, `id_pelanggan`=1, `id_barang`=2 WHERE `id_pemesanan`=1'),
(53, 4, 'yii\\db\\Command::execute', 1605084599.9827, 'Administrator', 'INSERT INTO `login` (`username`, `password`, `nama`, `foto`) VALUES (\'Diksa087123456789\', \'202cb962ac59075b964b07152d234b70\', \'Diksa\', \'avatar5.png\')'),
(54, 4, 'yii\\db\\Command::execute', 1605084600.0041, 'Administrator', 'INSERT INTO `user_role` (`id_system_role`, `id_login`) VALUES (23, 11)'),
(55, 4, 'yii\\db\\Command::execute', 1605084657.5469, 'Administrator', 'DELETE FROM `user_role` WHERE `id_login`=\'11\''),
(56, 4, 'yii\\db\\Command::execute', 1605084657.5683, 'Administrator', 'INSERT INTO `user_role` (`id_system_role`, `id_login`) VALUES (24, 11)'),
(57, 4, 'yii\\db\\Command::execute', 1605084699.6027, 'Administrator', 'INSERT INTO `login` (`username`, `password`, `nama`, `foto`) VALUES (\'four081123456789\', \'202cb962ac59075b964b07152d234b70\', \'four\', \'avatar5.png\')'),
(58, 4, 'yii\\db\\Command::execute', 1605084699.6309, 'Administrator', 'INSERT INTO `user_role` (`id_system_role`, `id_login`) VALUES (24, 12)'),
(59, 4, 'yii\\db\\Command::execute', 1605084699.6317, 'Administrator', 'INSERT INTO `kolektor` (`nama_kolektor`, `alamat`, `tlp`) VALUES (\'four\', \'Semarang\', \'081123456789\')'),
(60, 4, 'yii\\db\\Command::execute', 1605084978.3868, 'Joni', 'UPDATE `menu_navigasi` SET `id_parent`=0, `no_urut`=4, `status`=1 WHERE `id_menu`=155'),
(61, 4, 'yii\\db\\Command::execute', 1605085001.5067, 'Joni', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'168\''),
(62, 4, 'yii\\db\\Command::execute', 1605085001.5394, 'Joni', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 168)'),
(63, 4, 'yii\\db\\Command::execute', 1605085001.5429, 'Joni', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (23, 168)'),
(64, 4, 'yii\\db\\Command::execute', 1605085001.5461, 'Joni', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 168)'),
(65, 4, 'yii\\db\\Command::execute', 1605085015.4799, 'Joni', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'173\''),
(66, 4, 'yii\\db\\Command::execute', 1605085015.5049, 'Joni', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 173)'),
(67, 4, 'yii\\db\\Command::execute', 1605085015.5092, 'Joni', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (23, 173)'),
(68, 4, 'yii\\db\\Command::execute', 1605085015.5126, 'Joni', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 173)'),
(69, 4, 'yii\\db\\Command::execute', 1605100096.1022, 'Administrator', 'INSERT INTO `penjualan` (`tanggal_penjualan`, `total_penjualan`, `id_kolektor`, `id_pemesanan`) VALUES (\'2020-11-11\', 3, 1, 1)'),
(70, 4, 'yii\\db\\Command::execute', 1605100718.8779, 'Administrator', 'DELETE FROM `penjualan` WHERE `id_penjualan`=1'),
(71, 0, 'Login', 1605100887.8873, 'four', 'Login'),
(72, 4, 'yii\\db\\Command::execute', 1605100887.8875, 'four', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1605100887.8873, \'four\', \'Login\')'),
(73, 4, 'yii\\db\\Command::execute', 1605100957.872, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'168\''),
(74, 4, 'yii\\db\\Command::execute', 1605100957.8979, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 168)'),
(75, 4, 'yii\\db\\Command::execute', 1605100957.9028, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (24, 168)'),
(76, 4, 'yii\\db\\Command::execute', 1605100957.9065, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (23, 168)'),
(77, 4, 'yii\\db\\Command::execute', 1605100957.9095, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 168)'),
(78, 4, 'yii\\db\\Command::execute', 1605100969.1136, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'175\''),
(79, 4, 'yii\\db\\Command::execute', 1605100969.1354, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 175)'),
(80, 4, 'yii\\db\\Command::execute', 1605100969.1386, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (24, 175)'),
(81, 4, 'yii\\db\\Command::execute', 1605100969.1421, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 175)'),
(82, 4, 'yii\\db\\Command::execute', 1605100987.0934, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'175\''),
(83, 4, 'yii\\db\\Command::execute', 1605100987.1202, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 175)'),
(84, 4, 'yii\\db\\Command::execute', 1605100987.1239, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 175)'),
(85, 4, 'yii\\db\\Command::execute', 1605101027.4961, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'174\''),
(86, 4, 'yii\\db\\Command::execute', 1605101027.519, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 174)'),
(87, 4, 'yii\\db\\Command::execute', 1605101027.5239, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (24, 174)'),
(88, 4, 'yii\\db\\Command::execute', 1605101027.5275, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 174)'),
(89, 0, 'Login', 1605101264.1697, 'Diksa', 'Login'),
(90, 4, 'yii\\db\\Command::execute', 1605101264.1699, 'Diksa', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1605101264.1697, \'Diksa\', \'Login\')'),
(91, 4, 'yii\\db\\Command::execute', 1605105033.3217, 'Diksa', 'INSERT INTO `angsuran` (`tanggal_angsuran`, `total_angsuran`, `id_kolektor`, `id_pemesanan`) VALUES (\'2020-11-11\', 200000, 1, 1)'),
(92, 4, 'yii\\db\\Command::execute', 1605105598.8052, 'Diksa', 'INSERT INTO `angsuran` (`tanggal_angsuran`, `total_angsuran`, `id_kolektor`, `id_pemesanan`) VALUES (\'2020-11-11\', 200000, 1, 1)'),
(93, 4, 'yii\\db\\Command::execute', 1605105989.8511, 'Administrator', 'INSERT INTO `penjualan` (`tanggal_penjualan`, `total_penjualan`, `id_kolektor`, `id_pemesanan`) VALUES (\'2020-11-11\', 1, 1, 2)'),
(94, 4, 'yii\\db\\Command::execute', 1605106007.1229, 'Diksa', 'INSERT INTO `angsuran` (`tanggal_angsuran`, `total_angsuran`, `id_kolektor`, `id_pemesanan`) VALUES (\'2020-11-11\', 150000, 1, 2)'),
(95, 0, 'Login', 1605144853.8539, 'putra', 'Login'),
(96, 4, 'yii\\db\\Command::execute', 1605144853.8541, 'putra', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1605144853.8539, \'putra\', \'Login\')'),
(97, 4, 'yii\\db\\Command::execute', 1605145561.3785, 'putra', 'INSERT INTO `pemesanan` (`tanggal_pemesanan`, `paket_pemesanan`, `jumlah_pemesanan`, `id_sales`, `id_pelanggan`, `id_barang`) VALUES (\'2020-11-12\', \'cash\', 1, 1, 1, 1)'),
(98, 4, 'yii\\db\\Command::execute', 1605145601.8377, 'Administrator', 'INSERT INTO `penjualan` (`tanggal_penjualan`, `total_penjualan`, `id_kolektor`, `id_pemesanan`) VALUES (\'2020-11-12\', 1, 1, 3)'),
(99, 4, 'yii\\db\\Command::execute', 1605145706.6409, 'Administrator', 'INSERT INTO `penjualan` (`tanggal_penjualan`, `total_penjualan`, `id_kolektor`, `id_pemesanan`) VALUES (\'2020-11-12\', 1, 1, 3)'),
(100, 0, 'Login', 1605145766.9906, 'Diksa', 'Login'),
(101, 4, 'yii\\db\\Command::execute', 1605145766.9909, 'Diksa', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1605145766.9906, \'Diksa\', \'Login\')'),
(102, 4, 'yii\\db\\Command::execute', 1605146496.4119, 'Diksa', 'DELETE FROM `angsuran` WHERE `id_angsuran`=1'),
(103, 4, 'yii\\db\\Command::execute', 1605148268.7233, 'Diksa', 'UPDATE `angsuran` SET `tanggal_angsuran`=\'2020-11-12\', `total_angsuran`=150000, `id_kolektor`=1, `id_pemesanan`=2 WHERE `id_angsuran`=3'),
(104, 4, 'yii\\db\\Command::execute', 1605150269.9852, 'Diksa', 'INSERT INTO `angsuran` (`tanggal_angsuran`, `total_angsuran`, `id_kolektor`, `id_pemesanan`) VALUES (\'2020-11-12\', 150000, 1, 2)'),
(105, 4, 'yii\\db\\Command::execute', 1605150283.9012, 'Diksa', 'DELETE FROM `angsuran` WHERE `id_angsuran`=4'),
(106, 4, 'yii\\db\\Command::execute', 1605150301.3423, 'Diksa', 'INSERT INTO `angsuran` (`tanggal_angsuran`, `total_angsuran`, `id_kolektor`, `id_pemesanan`) VALUES (\'2020-11-12\', 200000, 1, 1)'),
(107, 4, 'yii\\db\\Command::execute', 1605150547.4873, 'Diksa', 'INSERT INTO `angsuran` (`tanggal_angsuran`, `total_angsuran`, `id_kolektor`, `id_pemesanan`) VALUES (\'2020-11-12\', 150000, 1, 3)'),
(108, 4, 'yii\\db\\Command::execute', 1605152693.3252, 'Administrator', 'INSERT INTO `menu_navigasi` (`nama_menu`, `url`, `id_parent`, `icon`, `status`, `no_urut`) VALUES (\'Laporan Pemesanan\', \'laporan/laporan-pemesanan\', 169, \'file\', 0, 1)'),
(109, 4, 'yii\\db\\Command::execute', 1605152698.9619, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'176\''),
(110, 4, 'yii\\db\\Command::execute', 1605152698.9788, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 176)'),
(111, 4, 'yii\\db\\Command::execute', 1605152770.6137, 'Administrator', 'INSERT INTO `menu_navigasi` (`nama_menu`, `url`, `id_parent`, `icon`, `status`, `no_urut`) VALUES (\'Laporan Penjualan\', \'laporan/laporan-penjualan\', 169, \'file\', 0, 2)'),
(112, 4, 'yii\\db\\Command::execute', 1605152773.789, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'177\''),
(113, 4, 'yii\\db\\Command::execute', 1605152773.8038, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 177)'),
(114, 4, 'yii\\db\\Command::execute', 1605152875.0025, 'Administrator', 'INSERT INTO `menu_navigasi` (`nama_menu`, `url`, `id_parent`, `icon`, `status`, `no_urut`) VALUES (\'Laporan Angsuran\', \'laporan/laporan-angsuran\', 169, \'file\', 0, 3)'),
(115, 4, 'yii\\db\\Command::execute', 1605152882.0497, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'178\''),
(116, 4, 'yii\\db\\Command::execute', 1605152882.0758, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 178)'),
(117, 4, 'yii\\db\\Command::execute', 1605153313.6255, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'174\''),
(118, 4, 'yii\\db\\Command::execute', 1605153313.6489, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (24, 174)'),
(119, 4, 'yii\\db\\Command::execute', 1605153313.6539, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 174)'),
(120, 4, 'yii\\db\\Command::execute', 1605153336.8771, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'175\''),
(121, 4, 'yii\\db\\Command::execute', 1605153336.898, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 175)'),
(122, 4, 'yii\\db\\Command::execute', 1605155726.2307, 'Administrator', 'INSERT INTO `pemesanan` (`tanggal_pemesanan`, `paket_pemesanan`, `jumlah_pemesanan`, `id_sales`, `id_pelanggan`, `id_barang`) VALUES (\'2020-11-12\', \'credit\', 1, 1, 1, 2)'),
(123, 4, 'yii\\db\\Command::execute', 1605161281.1311, 'Diksa', 'INSERT INTO `angsuran` (`tanggal_angsuran`, `total_angsuran`, `id_kolektor`, `id_pemesanan`) VALUES (\'2020-11-12\', 600000, 1, 1)'),
(124, 4, 'yii\\db\\Command::execute', 1605163670.2669, 'Administrator', 'UPDATE `menu_navigasi` SET `id_parent`=169, `no_urut`=2, `status`=1 WHERE `id_menu`=177'),
(125, 4, 'yii\\db\\Command::execute', 1605163686.3368, 'Administrator', 'UPDATE `menu_navigasi` SET `nama_menu`=\'Laporan Penjualan\', `id_parent`=169, `no_urut`=1, `status`=0 WHERE `id_menu`=176'),
(126, 4, 'yii\\db\\Command::execute', 1605166179.3003, 'Administrator', 'INSERT INTO `system_role` (`nama_role`) VALUES (\'PIMPINAN\')'),
(127, 4, 'yii\\db\\Command::execute', 1605166216.132, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'169\''),
(128, 4, 'yii\\db\\Command::execute', 1605166216.1567, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 169)'),
(129, 4, 'yii\\db\\Command::execute', 1605166216.1598, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (26, 169)'),
(130, 4, 'yii\\db\\Command::execute', 1605166216.1637, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 169)'),
(131, 4, 'yii\\db\\Command::execute', 1605166282.6479, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'176\''),
(132, 4, 'yii\\db\\Command::execute', 1605166282.6686, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 176)'),
(133, 4, 'yii\\db\\Command::execute', 1605166282.6737, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (26, 176)'),
(134, 4, 'yii\\db\\Command::execute', 1605166302.8608, 'Administrator', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'178\''),
(135, 4, 'yii\\db\\Command::execute', 1605166302.8883, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (25, 178)'),
(136, 4, 'yii\\db\\Command::execute', 1605166302.8924, 'Administrator', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (26, 178)'),
(137, 4, 'yii\\db\\Command::execute', 1605166403.581, 'Administrator', 'INSERT INTO `login` (`username`, `password`, `nama`, `foto`) VALUES (\'pimpinan\', \'202cb962ac59075b964b07152d234b70\', \'pimpiinan\', \'avatar5.png\')'),
(138, 4, 'yii\\db\\Command::execute', 1605166408.5476, 'Administrator', 'DELETE FROM `user_role` WHERE `id_login`=\'13\''),
(139, 4, 'yii\\db\\Command::execute', 1605166408.5647, 'Administrator', 'INSERT INTO `user_role` (`id_system_role`, `id_login`) VALUES (26, 13)'),
(140, 0, 'Login', 1605166418.4126, 'pimpiinan', 'Login'),
(141, 4, 'yii\\db\\Command::execute', 1605166418.4128, 'pimpiinan', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1605166418.4126, \'pimpiinan\', \'Login\')'),
(142, 0, 'Login', 1605167042.7479, 'Administrator', 'Login'),
(143, 4, 'yii\\db\\Command::execute', 1605167042.748, 'Administrator', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1605167042.7479, \'Administrator\', \'Login\')'),
(144, 0, 'Login', 1605169794.6531, 'Joni', 'Login'),
(145, 4, 'yii\\db\\Command::execute', 1605169794.6532, 'Joni', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1605169794.6531, \'Joni\', \'Login\')'),
(146, 0, 'Login', 1605169977.7534, 'Diksa', 'Login'),
(147, 4, 'yii\\db\\Command::execute', 1605169977.7536, 'Diksa', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1605169977.7534, \'Diksa\', \'Login\')'),
(148, 0, 'Login', 1605170294.0975, 'pimpiinan', 'Login'),
(149, 4, 'yii\\db\\Command::execute', 1605170294.0977, 'pimpiinan', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1605170294.0975, \'pimpiinan\', \'Login\')'),
(150, 4, 'yii\\db\\Command::execute', 1605170314.2342, 'pimpiinan', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'1\''),
(151, 4, 'yii\\db\\Command::execute', 1605170314.2634, 'pimpiinan', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (26, 1)'),
(152, 4, 'yii\\db\\Command::execute', 1605170314.2693, 'pimpiinan', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 1)'),
(153, 4, 'yii\\db\\Command::execute', 1605170325.1539, 'pimpiinan', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'2\''),
(154, 4, 'yii\\db\\Command::execute', 1605170325.1812, 'pimpiinan', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (26, 2)'),
(155, 4, 'yii\\db\\Command::execute', 1605170325.1861, 'pimpiinan', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 2)'),
(156, 4, 'yii\\db\\Command::execute', 1605170342.6646, 'pimpiinan', 'DELETE FROM `menu_navigasi_role` WHERE `id_menu`=\'5\''),
(157, 4, 'yii\\db\\Command::execute', 1605170342.6908, 'pimpiinan', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (26, 5)'),
(158, 4, 'yii\\db\\Command::execute', 1605170342.6975, 'pimpiinan', 'INSERT INTO `menu_navigasi_role` (`id_system_role`, `id_menu`) VALUES (1, 5)'),
(159, 0, 'Login', 1605186824.018, 'Joni', 'Login'),
(160, 4, 'yii\\db\\Command::execute', 1605186824.0183, 'Joni', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1605186824.018, \'Joni\', \'Login\')'),
(161, 0, 'Login', 1605230145.6575, 'Administrator', 'Login'),
(162, 4, 'yii\\db\\Command::execute', 1605230145.6577, 'Administrator', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1605230145.6575, \'Administrator\', \'Login\')'),
(163, 0, 'Login', 1605230824.8066, 'pimpiinan', 'Login'),
(164, 4, 'yii\\db\\Command::execute', 1605230824.807, 'pimpiinan', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1605230824.8066, \'pimpiinan\', \'Login\')'),
(165, 0, 'Login', 1605274966.3528, 'Administrator', 'Login'),
(166, 4, 'yii\\db\\Command::execute', 1605274966.3531, 'Administrator', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1605274966.3528, \'Administrator\', \'Login\')'),
(167, 0, 'Login', 1605314946.3808, 'pimpiinan', 'Login'),
(168, 4, 'yii\\db\\Command::execute', 1605314946.381, 'pimpiinan', 'INSERT INTO `log` (`level`, `category`, `log_time`, `prefix`, `message`) VALUES (0, \'Login\', 1605314946.3808, \'pimpiinan\', \'Login\')'),
(169, 4, 'yii\\db\\Command::execute', 1605316127.6849, 'pimpiinan', 'UPDATE `setting` SET `nomor_rekening`=2147483647, `foto`=NULL WHERE `id_setting`=1'),
(170, 4, 'yii\\db\\Command::execute', 1605316405.3377, 'pimpiinan', 'UPDATE `setting` SET `nomor_rekening`=2147483647, `foto`=NULL WHERE `id_setting`=1'),
(171, 4, 'yii\\db\\Command::execute', 1605316524.2002, 'pimpiinan', 'UPDATE `setting` SET `nomor_rekening`=2147483647 WHERE `id_setting`=1');

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
(2, 'admin', '202cb962ac59075b964b07152d234b70', 'Administrator', 'avatar5.png'),
(4, 'dicky', '52971ff2c206d011f6cb58e816b78759', 'Dicky', '1596078319_GSS.png'),
(5, 'daniel', '68477d24cc6842510b0ca24582af1688', 'Daniel GSS', ''),
(6, 'sales', '9ed083b1436e5f40ef984b28255eef18', 'Sales 1', 'avatar5.png'),
(7, 'sales_dua', 'a5d4b0b47ed08cb98d6fe196d34c3b65', 'Sales 2', 'avatar5.png'),
(8, 'kolektor', 'c0d70b7558f6cfdcacc8bb74a17fc718', 'Kolektor', 'avatar5.png'),
(9, 'Joni085123456789', '202cb962ac59075b964b07152d234b70', 'Joni', 'avatar5.png'),
(10, 'putra085123456789', '202cb962ac59075b964b07152d234b70', 'putra', 'avatar5.png'),
(11, 'Diksa087123456789', '202cb962ac59075b964b07152d234b70', 'Diksa', 'avatar5.png'),
(12, 'four081123456789', '202cb962ac59075b964b07152d234b70', 'four', 'avatar5.png'),
(13, 'pimpinan', '202cb962ac59075b964b07152d234b70', 'pimpiinan', 'avatar5.png');

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
(115, 'Log', '#', 0, 5, 'check-circle', 1),
(124, 'Log', '/log', 115, 1, 'list-ul', 0),
(125, 'Rekap Log', '/log/rekap-log', 115, 2, 'list-ul', 0),
(152, 'Satuan', 'satuan', 166, 5, 'list', 1),
(153, 'Barang', 'barang', 166, 6, 'boxes', 0),
(154, 'Pelanggan', 'pelanggan', 166, 7, 'users', 0),
(155, 'Transaksi', '#', 0, 4, 'hand-holding-usd', 1),
(162, 'Purchase Order', 'transaksi-pembelian/laporan-transaksi', 160, 1, 'folder', 1),
(163, 'Transaksi Penjualan', 'transaksi/laporan-transaksi', 160, 2, 'folder', 0),
(165, 'Penjualan', 'penjualan', 155, 5, 'dollar-sign', 0),
(166, 'Data Master', '#', 0, 3, 'database', 0),
(167, 'User Account', 'login', 166, 1, 'sign-in-alt', 1),
(168, 'Data Transaksi', '#', 0, 6, 'file-text', 0),
(169, 'Laporan', '#', 0, 7, 'file-text', 0),
(170, 'Setting Company', 'setting', 166, 8, 'cogs', 1),
(171, 'Data Sales', 'sales', 166, 9, 'user', 0),
(172, 'Data Kolektor', 'kolektor', 166, 10, 'user', 0),
(173, 'Data Pemesanan', 'pemesanan', 168, 1, 'file', 0),
(174, 'Data Penjualan', 'penjualan', 168, 2, 'file', 0),
(175, 'Data Angsuran', 'angsuran', 168, 3, 'file', 0),
(176, 'Laporan Penjualan', 'laporan/laporan-pemesanan', 169, 1, 'file', 0),
(177, 'Laporan Penjualan', 'laporan/laporan-penjualan', 169, 2, 'file', 1),
(178, 'Laporan Angsuran', 'laporan/laporan-angsuran', 169, 3, 'file', 0);

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
(3, 3, 1),
(5, 4, 1),
(7, 115, 1),
(8, 124, 1),
(9, 125, 1),
(30, 159, 1),
(44, 161, 1),
(47, 162, 22),
(48, 162, 1),
(51, 164, 1),
(58, 158, 23),
(59, 156, 23),
(64, 155, 23),
(65, 157, 23),
(66, 165, 23),
(72, 152, 25),
(73, 153, 25),
(74, 154, 25),
(75, 154, 23),
(76, 160, 25),
(77, 163, 25),
(92, 170, 25),
(101, 166, 25),
(102, 166, 23),
(103, 167, 1),
(104, 171, 25),
(105, 172, 25),
(120, 173, 25),
(121, 173, 23),
(122, 173, 1),
(123, 168, 25),
(124, 168, 24),
(125, 168, 23),
(126, 168, 1),
(136, 177, 25),
(138, 174, 24),
(139, 174, 1),
(140, 175, 1),
(141, 169, 25),
(142, 169, 26),
(143, 169, 1),
(144, 176, 25),
(145, 176, 26),
(146, 178, 25),
(147, 178, 26),
(148, 1, 26),
(149, 1, 1),
(150, 2, 26),
(151, 2, 1),
(152, 5, 26),
(153, 5, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tlp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`, `tlp`) VALUES
(1, 'Dicky', 'Jepara', '089123456789');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pemesanan` int(11) NOT NULL,
  `tanggal_pemesanan` date NOT NULL,
  `paket_pemesanan` varchar(50) NOT NULL,
  `jumlah_pemesanan` int(11) NOT NULL,
  `id_sales` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`id_pemesanan`, `tanggal_pemesanan`, `paket_pemesanan`, `jumlah_pemesanan`, `id_sales`, `id_pelanggan`, `id_barang`) VALUES
(1, '2020-11-11', 'credit', 3, 1, 1, 2),
(2, '2020-11-11', 'cash', 1, 2, 1, 1),
(3, '2020-11-12', 'cash', 1, 1, 1, 1),
(4, '2020-11-12', 'credit', 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `tanggal_penjualan` date NOT NULL,
  `total_penjualan` int(11) NOT NULL,
  `id_kolektor` int(11) NOT NULL,
  `id_pemesanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `tanggal_penjualan`, `total_penjualan`, `id_kolektor`, `id_pemesanan`) VALUES
(2, '2020-11-11', 3, 1, 1),
(3, '2020-11-11', 1, 1, 2),
(5, '2020-11-12', 1, 1, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `id_sales` int(11) NOT NULL,
  `nama_sales` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`id_sales`, `nama_sales`, `alamat`, `telp`) VALUES
(1, 'putra', 'Jepara', '085123456789'),
(2, 'Joni', 'Jepara', '085123456789');

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
(1, 'PT. VAGANZA SUMBER SUKSES CABANG SEMARANG', '-', '-', '085692228990', 'Bank Mandiri, KCP Sisingamangaraja Semarang', 2147483647, '1595581672_GSS.png');

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
(1, 'SYSTEM ADMINISTRATOR'),
(23, 'SALES'),
(24, 'KOLEKTOR'),
(25, 'ADMINISTRATOR'),
(26, 'PIMPINAN');

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
(15, 25, 2),
(3, 22, 3),
(16, 1, 4),
(10, 1, 5),
(7, 23, 6),
(8, 23, 7),
(13, 24, 8),
(17, 23, 9),
(18, 23, 10),
(20, 24, 11),
(21, 24, 12),
(22, 26, 13);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `angsuran`
--
ALTER TABLE `angsuran`
  ADD PRIMARY KEY (`id_angsuran`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id_foto`);

--
-- Indeks untuk tabel `kolektor`
--
ALTER TABLE `kolektor`
  ADD PRIMARY KEY (`id_kolektor`);

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
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id_sales`);

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
-- AUTO_INCREMENT untuk tabel `angsuran`
--
ALTER TABLE `angsuran`
  MODIFY `id_angsuran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `foto`
--
ALTER TABLE `foto`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kolektor`
--
ALTER TABLE `kolektor`
  MODIFY `id_kolektor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `log`
--
ALTER TABLE `log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `menu_navigasi`
--
ALTER TABLE `menu_navigasi`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT untuk tabel `menu_navigasi_role`
--
ALTER TABLE `menu_navigasi_role`
  MODIFY `id_menu_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `id_sales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `system_role`
--
ALTER TABLE `system_role`
  MODIFY `id_system_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id_user_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
