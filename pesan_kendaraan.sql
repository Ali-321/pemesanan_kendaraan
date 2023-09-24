-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2023 at 02:04 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pesan_kendaraan`
--

-- --------------------------------------------------------

--
-- Table structure for table `bbm`
--

CREATE TABLE `bbm` (
  `bbmId` int(11) NOT NULL,
  `jarak` int(11) NOT NULL,
  `bensin` tinyint(4) NOT NULL,
  `kdrnId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bbm`
--

INSERT INTO `bbm` (`bbmId`, `jarak`, `bensin`, `kdrnId`) VALUES
(1, 30, 20, 6),
(2, 30, 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `daerah`
--

CREATE TABLE `daerah` (
  `daerahId` int(11) NOT NULL,
  `namaDaerah` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daerah`
--

INSERT INTO `daerah` (`daerahId`, `namaDaerah`) VALUES
(1, 'daerah1'),
(2, 'daerah2'),
(3, 'daerah3'),
(4, 'daerah4'),
(5, 'daerah5'),
(6, 'daerah6'),
(7, 'daerah7');

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `kdrnId` int(11) NOT NULL,
  `namKdrn` varchar(25) NOT NULL,
  `jenisKdrn` enum('angkutan_orang','angkutan_barang') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`kdrnId`, `namKdrn`, `jenisKdrn`) VALUES
(1, 'truk1', 'angkutan_barang'),
(2, 'truk2', 'angkutan_barang'),
(3, 'truk3', 'angkutan_barang'),
(5, 'bus1', 'angkutan_orang'),
(6, 'bus2', 'angkutan_orang'),
(7, 'mobil', 'angkutan_orang');

-- --------------------------------------------------------

--
-- Table structure for table `persetujuan`
--

CREATE TABLE `persetujuan` (
  `persetujuanId` int(11) NOT NULL,
  `pesananId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `tgl` date NOT NULL DEFAULT current_timestamp(),
  `statusPesanan` enum('proses','diterima','ditolak') NOT NULL DEFAULT 'proses'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `persetujuan`
--

INSERT INTO `persetujuan` (`persetujuanId`, `pesananId`, `userId`, `tgl`, `statusPesanan`) VALUES
(1, 1, 3, '2023-09-24', 'diterima');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `pesananId` int(11) NOT NULL,
  `tglPesanan` date NOT NULL DEFAULT current_timestamp(),
  `lokasiAwal` varchar(25) NOT NULL,
  `lokasiAkhir` varchar(25) NOT NULL,
  `tglPemakain` date NOT NULL,
  `supirId` int(11) NOT NULL,
  `KdrnId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`pesananId`, `tglPesanan`, `lokasiAwal`, `lokasiAkhir`, `tglPemakain`, `supirId`, `KdrnId`, `userId`) VALUES
(1, '2023-09-24', 'lokasi1', 'lokasi2', '2023-09-25', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `servis`
--

CREATE TABLE `servis` (
  `servisId` int(11) NOT NULL,
  `tglMasuk` date NOT NULL,
  `tglKeluar` date NOT NULL,
  `jenisServis` varchar(50) NOT NULL,
  `biaya` int(11) NOT NULL,
  `catatan` varchar(100) NOT NULL,
  `kdrnId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `servis`
--

INSERT INTO `servis` (`servisId`, `tglMasuk`, `tglKeluar`, `jenisServis`, `biaya`, `catatan`, `kdrnId`) VALUES
(1, '2023-09-24', '2023-09-25', 'ganti ban,', 5000000, '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `supir`
--

CREATE TABLE `supir` (
  `supirId` int(11) NOT NULL,
  `namaSupir` varchar(25) NOT NULL,
  `tlp` varchar(25) NOT NULL,
  `daerahId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supir`
--

INSERT INTO `supir` (`supirId`, `namaSupir`, `tlp`, `daerahId`) VALUES
(1, 'ujang', '0811111111', 1),
(2, 'agung', '082222222', 2),
(3, 'riski', '08333333', 1),
(4, 'ridwan', '08444444', 1),
(5, 'lukman', '08232132', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tambang`
--

CREATE TABLE `tambang` (
  `tbngId` int(11) NOT NULL,
  `namaTbng` varchar(25) NOT NULL,
  `lokasiTbng` varchar(25) NOT NULL,
  `daerahId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tambang`
--

INSERT INTO `tambang` (`tbngId`, `namaTbng`, `lokasiTbng`, `daerahId`) VALUES
(1, 'Tbg emas', 'lokasi1', 1),
(2, 'Tbg nikel', 'lokasi2', 2),
(3, 'Tbg batu bara', 'lokasi3', 3),
(4, 'Tbg besi', 'lokasi 4', 4),
(5, 'Tbg baja', 'lokasi5', 5),
(6, 'Tbg bauksit', 'lokasi6', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `namaUser` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `jenisUser` enum('pemesan','penyetuju') NOT NULL,
  `daerahId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `namaUser`, `password`, `jenisUser`, `daerahId`) VALUES
(1, 'budi', '123', 'pemesan', 1),
(2, 'agus', '123', 'pemesan', 2),
(3, 'udin', '321', 'penyetuju', 2),
(4, 'rudi', '321', 'penyetuju', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bbm`
--
ALTER TABLE `bbm`
  ADD PRIMARY KEY (`bbmId`),
  ADD KEY `kdrnId` (`kdrnId`);

--
-- Indexes for table `daerah`
--
ALTER TABLE `daerah`
  ADD PRIMARY KEY (`daerahId`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`kdrnId`);

--
-- Indexes for table `persetujuan`
--
ALTER TABLE `persetujuan`
  ADD PRIMARY KEY (`persetujuanId`),
  ADD KEY `pesananId` (`pesananId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`pesananId`),
  ADD KEY `supirId` (`supirId`),
  ADD KEY `KdrnId` (`KdrnId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `servis`
--
ALTER TABLE `servis`
  ADD PRIMARY KEY (`servisId`),
  ADD KEY `kdrnId` (`kdrnId`);

--
-- Indexes for table `supir`
--
ALTER TABLE `supir`
  ADD PRIMARY KEY (`supirId`),
  ADD KEY `daerahId` (`daerahId`);

--
-- Indexes for table `tambang`
--
ALTER TABLE `tambang`
  ADD PRIMARY KEY (`tbngId`),
  ADD KEY `daerahId` (`daerahId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `daerahId` (`daerahId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bbm`
--
ALTER TABLE `bbm`
  MODIFY `bbmId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `daerah`
--
ALTER TABLE `daerah`
  MODIFY `daerahId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `kdrnId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `persetujuan`
--
ALTER TABLE `persetujuan`
  MODIFY `persetujuanId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `pesananId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `servis`
--
ALTER TABLE `servis`
  MODIFY `servisId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supir`
--
ALTER TABLE `supir`
  MODIFY `supirId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tambang`
--
ALTER TABLE `tambang`
  MODIFY `tbngId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bbm`
--
ALTER TABLE `bbm`
  ADD CONSTRAINT `bbm_ibfk_1` FOREIGN KEY (`kdrnId`) REFERENCES `kendaraan` (`kdrnId`);

--
-- Constraints for table `persetujuan`
--
ALTER TABLE `persetujuan`
  ADD CONSTRAINT `persetujuan_ibfk_1` FOREIGN KEY (`pesananId`) REFERENCES `pesanan` (`pesananId`),
  ADD CONSTRAINT `persetujuan_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`supirId`) REFERENCES `supir` (`supirId`),
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`KdrnId`) REFERENCES `kendaraan` (`kdrnId`),
  ADD CONSTRAINT `pesanan_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- Constraints for table `servis`
--
ALTER TABLE `servis`
  ADD CONSTRAINT `servis_ibfk_1` FOREIGN KEY (`kdrnId`) REFERENCES `kendaraan` (`kdrnId`);

--
-- Constraints for table `supir`
--
ALTER TABLE `supir`
  ADD CONSTRAINT `supir_ibfk_1` FOREIGN KEY (`daerahId`) REFERENCES `daerah` (`daerahId`);

--
-- Constraints for table `tambang`
--
ALTER TABLE `tambang`
  ADD CONSTRAINT `tambang_ibfk_1` FOREIGN KEY (`daerahId`) REFERENCES `daerah` (`daerahId`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`daerahId`) REFERENCES `daerah` (`daerahId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
