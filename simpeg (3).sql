-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2021 at 05:19 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simpeg`
--

-- --------------------------------------------------------

--
-- Table structure for table `hubungan_kel`
--

CREATE TABLE `hubungan_kel` (
  `id_hubungan` int(11) NOT NULL,
  `nama_hubungan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hubungan_kel`
--

INSERT INTO `hubungan_kel` (`id_hubungan`, `nama_hubungan`) VALUES
(1, 'Ayah'),
(2, 'Ibu'),
(3, 'Anak');

-- --------------------------------------------------------

--
-- Table structure for table `keluarga`
--

CREATE TABLE `keluarga` (
  `nik` varchar(19) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nama_keluarga` varchar(50) NOT NULL,
  `tempat_lahir` text NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nm_pendidikan` int(11) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `id_hubungan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keluarga`
--

INSERT INTO `keluarga` (`nik`, `nip`, `nama_keluarga`, `tempat_lahir`, `tanggal_lahir`, `nm_pendidikan`, `pekerjaan`, `id_hubungan`) VALUES
('1376021202021212', '123121251241213', 'Aguss', 'Jakarta', '2021-12-13', 3, 'Programmer', 1),
('1376021202021212123', '123121251241213', 'Aguss', 'Jakarta', '2021-12-13', 3, 'Programmer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nama_pendidikan`
--

CREATE TABLE `nama_pendidikan` (
  `nm_pendidikan` int(11) NOT NULL,
  `nama_pendidikan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nama_pendidikan`
--

INSERT INTO `nama_pendidikan` (`nm_pendidikan`, `nama_pendidikan`) VALUES
(1, 'Tidak Sekolah'),
(2, 'Belum Sekolah'),
(3, 'SD'),
(4, 'SMP'),
(5, 'SMA'),
(6, 'D3'),
(7, 'D4'),
(8, 'S1'),
(9, 'S2');

-- --------------------------------------------------------

--
-- Table structure for table `pangkat`
--

CREATE TABLE `pangkat` (
  `id_pangkat` int(11) NOT NULL,
  `nip` varchar(19) NOT NULL,
  `nama_pangkat` varchar(50) NOT NULL,
  `jenis_pangkat` varchar(50) NOT NULL,
  `tmt_pangkat` date NOT NULL,
  `sah_sk` date NOT NULL,
  `nama_pengesah_sk` varchar(50) NOT NULL,
  `no_sk` varchar(50) NOT NULL,
  `status_pangkat` enum('aktif','nonaktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pangkat`
--

INSERT INTO `pangkat` (`id_pangkat`, `nip`, `nama_pangkat`, `jenis_pangkat`, `tmt_pangkat`, `sah_sk`, `nama_pengesah_sk`, `no_sk`, `status_pangkat`) VALUES
(1, '0987654543432212324', 'penata muda', '3a', '2018-06-11', '2018-06-12', 'rusli s.ag', '09283skldjflk', 'nonaktif');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nip` varchar(20) NOT NULL,
  `nama_pegawai` varchar(50) NOT NULL,
  `foto_pegawai` varchar(255) NOT NULL,
  `tempat_lahir` text NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_pangkat` int(11) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `agama` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `alamat` text NOT NULL,
  `gol_darah` enum('o','a','b','ab') NOT NULL,
  `status_pernikahan` enum('kawin','lajang') NOT NULL,
  `status_kepegawaian` enum('pns','honor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nip`, `nama_pegawai`, `foto_pegawai`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `id_unit`, `id_pangkat`, `no_hp`, `agama`, `email`, `alamat`, `gol_darah`, `status_pernikahan`, `status_kepegawaian`) VALUES
('123121251241213', 'Agus Santosoyy', '1640435915.jpg', 'Bukittinggi', '2021-12-29', 'laki-laki', 1, 1, '928301298312', 'Buddha', 'admin@gmail.com', 'asdasd', 'a', 'lajang', 'pns');

-- --------------------------------------------------------

--
-- Table structure for table `pendidikan`
--

CREATE TABLE `pendidikan` (
  `id_pendidikan` int(11) NOT NULL,
  `nip` varchar(19) DEFAULT NULL,
  `nama_sekolah` varchar(50) NOT NULL,
  `nm_pendidikan` int(11) NOT NULL,
  `lokasi` text NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `tgl_ijazah` date NOT NULL,
  `no_ijazah` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pendidikan`
--

INSERT INTO `pendidikan` (`id_pendidikan`, `nip`, `nama_sekolah`, `nm_pendidikan`, `lokasi`, `jurusan`, `tgl_ijazah`, `no_ijazah`) VALUES
(3, '123121251241213', 'Politeknik Negeri Padang', 3, 'Bandung', 'Teknik Informatika', '2021-12-19', 'N00123123');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_cuti`
--

CREATE TABLE `pengajuan_cuti` (
  `id_cuti` int(11) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `tgl_masuk` date NOT NULL,
  `alasan` text NOT NULL,
  `status` enum('terima','tolak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengajuan_cuti`
--

INSERT INTO `pengajuan_cuti` (`id_cuti`, `nip`, `tgl_pengajuan`, `tgl_masuk`, `alasan`, `status`) VALUES
(3, '123121251241213', '2021-12-07', '2021-12-07', 'Sakitt', 'terima');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_pangkat`
--

CREATE TABLE `pengajuan_pangkat` (
  `id_pegajuan_p` int(11) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `id_pangkat` int(11) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `status` enum('terima','tolak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id_unit` int(11) NOT NULL,
  `nama_unit` varchar(50) NOT NULL,
  `kepala_unit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id_unit`, `nama_unit`, `kepala_unit`) VALUES
(1, 'Unit Keuangan', 'Eko S.Ag'),
(2, 'Unit Humas', 'Delwin S.pd');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `email`, `password`) VALUES
(1, 'admin', 'admin@gmail.com', 'd033e22ae348aeb5660fc2140aec35850c4da997');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hubungan_kel`
--
ALTER TABLE `hubungan_kel`
  ADD PRIMARY KEY (`id_hubungan`);

--
-- Indexes for table `keluarga`
--
ALTER TABLE `keluarga`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `nama_pendidikan`
--
ALTER TABLE `nama_pendidikan`
  ADD PRIMARY KEY (`nm_pendidikan`);

--
-- Indexes for table `pangkat`
--
ALTER TABLE `pangkat`
  ADD PRIMARY KEY (`id_pangkat`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `pendidikan`
--
ALTER TABLE `pendidikan`
  ADD PRIMARY KEY (`id_pendidikan`),
  ADD KEY `nip2` (`nip`);

--
-- Indexes for table `pengajuan_cuti`
--
ALTER TABLE `pengajuan_cuti`
  ADD PRIMARY KEY (`id_cuti`);

--
-- Indexes for table `pengajuan_pangkat`
--
ALTER TABLE `pengajuan_pangkat`
  ADD PRIMARY KEY (`id_pegajuan_p`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id_unit`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hubungan_kel`
--
ALTER TABLE `hubungan_kel`
  MODIFY `id_hubungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nama_pendidikan`
--
ALTER TABLE `nama_pendidikan`
  MODIFY `nm_pendidikan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pangkat`
--
ALTER TABLE `pangkat`
  MODIFY `id_pangkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pendidikan`
--
ALTER TABLE `pendidikan`
  MODIFY `id_pendidikan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengajuan_cuti`
--
ALTER TABLE `pengajuan_cuti`
  MODIFY `id_cuti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengajuan_pangkat`
--
ALTER TABLE `pengajuan_pangkat`
  MODIFY `id_pegajuan_p` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id_unit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
