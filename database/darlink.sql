-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Des 2021 pada 03.12
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `darlink`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'c');

-- --------------------------------------------------------

--
-- Struktur dari tabel `odp`
--

CREATE TABLE `odp` (
  `numbodp` bigint(14) NOT NULL,
  `namaodp` varchar(30) NOT NULL,
  `kapodp` varchar(3) NOT NULL,
  `koorodp` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `odp`
--

INSERT INTO `odp` (`numbodp`, `namaodp`, `kapodp`, `koorodp`) VALUES
(24210000001, 'ODP-DUMMY-FA/001', '8', '-6.986033,110.42392'),
(24210000002, 'ODP-DUMMY-FA/02', '8', '-6.986233,110.42422'),
(24210000003, 'ODP-DUMMY-FA/003', '16', '-6.982333,110.42292'),
(24210000004, 'ODP-DUMMY-FA/004', '8', '-6.986033,110.42392'),
(24210000005, 'ODP-DUMMY-FA/005', '8', '-6.986033,110.42392'),
(24210000006, 'ODP-DUMMY-FA/006', '8', '-6.986033,110.42392'),
(24210000007, 'ODP-DUMMY-FB/001', '8', '-6.986023,110.42342');

-- --------------------------------------------------------

--
-- Struktur dari tabel `olt`
--

CREATE TABLE `olt` (
  `numbgpon` int(10) NOT NULL,
  `hostnamegpon` varchar(30) NOT NULL,
  `slot` varchar(5) NOT NULL,
  `port` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `olt`
--

INSERT INTO `olt` (`numbgpon`, `hostnamegpon`, `slot`, `port`) VALUES
(64100001, 'GPON04-D4-SMT-2', '2', '1'),
(64100002, 'GPON04-D4-SMT-2', '2', '2'),
(64100003, 'GPON00-D4-ABR-3', '2', '3'),
(64100004, 'GPON00-D4-ABR-3', '2', '4'),
(64100005, 'GPON00-D4-ABR-3', '2', '5'),
(64100006, 'GPON00-D4-ABR-3', '2', '6'),
(64100007, 'GPON00-D4-ABR-3', '2', '7'),
(64100008, 'GPON00-D4-ABR-3', '2', '8'),
(64100009, 'GPON00-D4-ABR-3', '2', '9'),
(64100010, 'GPON00-D4-ABR-3', '2', '10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `report_co`
--

CREATE TABLE `report_co` (
  `id` bigint(14) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `namaodp` varchar(30) NOT NULL,
  `hostnamegpon` varchar(30) NOT NULL,
  `slotgpon` varchar(30) NOT NULL,
  `portgpon` varchar(30) NOT NULL,
  `pelapor` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `status` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `report_service`
--

CREATE TABLE `report_service` (
  `jenis` varchar(30) NOT NULL,
  `numbservice` varchar(20) NOT NULL,
  `numbservice2` varchar(20) NOT NULL,
  `namaodp` varchar(30) NOT NULL,
  `portodp` varchar(11) NOT NULL,
  `qrodp` varchar(40) NOT NULL,
  `qrdropcore` varchar(40) NOT NULL,
  `hostnamegpon` varchar(30) NOT NULL,
  `slotgpon` varchar(30) NOT NULL,
  `portgpon` varchar(30) NOT NULL,
  `sn` varchar(30) NOT NULL,
  `pelapor` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `status` char(1) NOT NULL,
  `id` bigint(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `report_service`
--

INSERT INTO `report_service` (`jenis`, `numbservice`, `numbservice2`, `namaodp`, `portodp`, `qrodp`, `qrdropcore`, `hostnamegpon`, `slotgpon`, `portgpon`, `sn`, `pelapor`, `tanggal`, `status`, `id`) VALUES
('Omset Service ODP', '1', '1', 'ODP-DUMMY-FA/001', '1', '1', '1', '1', '1', '1', '1', 'faris', '0000-00-00', '1', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `service`
--

CREATE TABLE `service` (
  `numbservice` varchar(20) NOT NULL,
  `numbservice2` varchar(20) NOT NULL,
  `sn` varchar(30) NOT NULL,
  `koorservice` varchar(40) NOT NULL,
  `onuservice` int(3) NOT NULL,
  `numbsplitter` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `service`
--

INSERT INTO `service` (`numbservice`, `numbservice2`, `sn`, `koorservice`, `onuservice`, `numbsplitter`) VALUES
('14140123456000', '024876000', 'ZTEGC0123000', '-6.986233,110.42492', 3, 543000001),
('14140123456001', '024876001', 'ZTEGC0123001', '-6.986233,110.42492', 15, 543000005),
('14140123456789', '024876543', 'ZTEGC0123456', '-6.986033,110.42392', 9, 543000001);

-- --------------------------------------------------------

--
-- Struktur dari tabel `splitter`
--

CREATE TABLE `splitter` (
  `numbsplitter` bigint(12) NOT NULL,
  `namasplitter` varchar(30) NOT NULL,
  `numbodp` bigint(14) NOT NULL,
  `numbgpon` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `splitter`
--

INSERT INTO `splitter` (`numbsplitter`, `namasplitter`, `numbodp`, `numbgpon`) VALUES
(543000001, 'SPT-GPON-01_01', 24210000001, 64100001),
(543000002, 'SPT-GPON-01_02', 24210000002, 64100001),
(543000003, 'SPT-GPON-01_03', 24210000003, 64100001),
(543000004, 'SPT-GPON-01_04', 24210000004, 64100001),
(543000005, 'SPT-GPON-02_01', 24210000005, 64100003),
(543000006, 'SPT-GPON-02_02', 24210000006, 64100003);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `nama` varchar(200) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `access` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`nama`, `username`, `password`, `access`) VALUES
('Muzakki Ahmad Al Farisi', 'faris', 'c', 1),
('akun 1', 'akun', 'c', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `odp`
--
ALTER TABLE `odp`
  ADD PRIMARY KEY (`numbodp`);

--
-- Indeks untuk tabel `olt`
--
ALTER TABLE `olt`
  ADD PRIMARY KEY (`numbgpon`);

--
-- Indeks untuk tabel `report_co`
--
ALTER TABLE `report_co`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `report_service`
--
ALTER TABLE `report_service`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`numbservice`);

--
-- Indeks untuk tabel `splitter`
--
ALTER TABLE `splitter`
  ADD PRIMARY KEY (`numbsplitter`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
