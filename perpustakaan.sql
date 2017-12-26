-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2017 at 02:58 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `q_detailygpnjam`
--

CREATE TABLE `q_detailygpnjam` (
  `kdPeminjaman` varchar(15) NOT NULL,
  `kdAnggota` varchar(13) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `rayon` varchar(15) NOT NULL,
  `kdItem` varchar(25) NOT NULL,
  `JudulItem` varchar(255) NOT NULL,
  `keterangan` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_anggota`
--

CREATE TABLE `tb_anggota` (
  `kdAnggota` varchar(13) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_status` varchar(2) NOT NULL,
  `alamat` text NOT NULL,
  `notelp` int(15) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `rayon` varchar(15) NOT NULL,
  `rombel` varchar(15) NOT NULL,
  `kelas` int(1) NOT NULL,
  `goldar` varchar(3) NOT NULL,
  `nisn` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barcode`
--

CREATE TABLE `tb_barcode` (
  `id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_buku_tamu`
--

CREATE TABLE `tb_buku_tamu` (
  `kdTamu` int(11) NOT NULL,
  `kdAnggota` int(11) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_keperluan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_donatur`
--

CREATE TABLE `tb_donatur` (
  `kdDonatur` varchar(14) NOT NULL,
  `donatur` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `noTelp` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ebook`
--

CREATE TABLE `tb_ebook` (
  `idFile` int(4) NOT NULL,
  `kdItem` varchar(25) NOT NULL,
  `File` varchar(60) NOT NULL,
  `tanggalUpload` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_item`
--

CREATE TABLE `tb_item` (
  `kdItem` varchar(50) NOT NULL,
  `kdJenisItem` varchar(4) NOT NULL,
  `KdKlasifikasi` varchar(4) NOT NULL,
  `kdKategori` varchar(6) NOT NULL,
  `kdLabel` varchar(5) NOT NULL,
  `kdTingkat` varchar(4) NOT NULL,
  `JudulItem` varchar(255) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `ISBN` varchar(35) NOT NULL,
  `jumlah` int(4) NOT NULL,
  `tahun_terbit` varchar(4) NOT NULL,
  `kata_kunci` varchar(50) NOT NULL,
  `resensi` text NOT NULL,
  `daftar_isi` text NOT NULL,
  `statuspinjam` varchar(1) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `kondisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis_item`
--

CREATE TABLE `tb_jenis_item` (
  `kdJenisItem` varchar(4) NOT NULL,
  `JenisItem` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori_item`
--

CREATE TABLE `tb_kategori_item` (
  `kdKategori` varchar(4) NOT NULL,
  `KdKlasifikasi` varchar(4) NOT NULL,
  `kategori` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_keperluan`
--

CREATE TABLE `tb_keperluan` (
  `id_keperluan` int(3) NOT NULL,
  `keperluan` int(50) NOT NULL,
  `id_status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_klasifikasi`
--

CREATE TABLE `tb_klasifikasi` (
  `KdKlasifikasi` varchar(4) NOT NULL,
  `KdJenisItem` varchar(4) NOT NULL,
  `Klasifikasi` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_label_rak`
--

CREATE TABLE `tb_label_rak` (
  `kdLabel` varchar(5) NOT NULL,
  `noRak` int(2) NOT NULL,
  `bagianRak` int(2) NOT NULL,
  `label` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_peminjaman`
--

CREATE TABLE `tb_peminjaman` (
  `kdPeminjaman` varchar(15) NOT NULL,
  `kdAnggota` varchar(13) NOT NULL,
  `tglPinjam` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penerbit`
--

CREATE TABLE `tb_penerbit` (
  `kdPenerbit` int(14) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `noTelp` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengarang`
--

CREATE TABLE `tb_pengarang` (
  `kdPengarang` varchar(14) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `notelp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pinjam_kelas`
--

CREATE TABLE `tb_pinjam_kelas` (
  `kdPinjam` varchar(25) NOT NULL,
  `kdAnggota` varchar(25) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `rombel` varchar(10) NOT NULL,
  `kdItem` varchar(30) NOT NULL,
  `JudulItem` varchar(255) NOT NULL,
  `KdTingkat` varchar(5) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jumlah` int(5) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rayon`
--

CREATE TABLE `tb_rayon` (
  `kdRayon` varchar(15) NOT NULL,
  `rayon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rombel`
--

CREATE TABLE `tb_rombel` (
  `id_rombel` int(11) NOT NULL,
  `rombel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_setting`
--

CREATE TABLE `tb_setting` (
  `id_set` int(11) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `denda` mediumint(9) NOT NULL,
  `maksimalBuku` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `nis` varchar(8) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_status`
--

CREATE TABLE `tb_status` (
  `id_status` varchar(2) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_totalitem`
--

CREATE TABLE `tb_totalitem` (
  `id` int(11) NOT NULL,
  `kdItem` varchar(12) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `jml_tersedia` int(12) NOT NULL,
  `jml_diluar` int(12) NOT NULL,
  `jml_toal` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(3) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_anggota`
--
ALTER TABLE `tb_anggota`
  ADD PRIMARY KEY (`kdAnggota`),
  ADD KEY `kelas` (`kelas`);

--
-- Indexes for table `tb_buku_tamu`
--
ALTER TABLE `tb_buku_tamu`
  ADD PRIMARY KEY (`kdTamu`);

--
-- Indexes for table `tb_donatur`
--
ALTER TABLE `tb_donatur`
  ADD PRIMARY KEY (`kdDonatur`);

--
-- Indexes for table `tb_ebook`
--
ALTER TABLE `tb_ebook`
  ADD PRIMARY KEY (`idFile`);

--
-- Indexes for table `tb_item`
--
ALTER TABLE `tb_item`
  ADD PRIMARY KEY (`kdItem`),
  ADD KEY `jumlah` (`jumlah`);

--
-- Indexes for table `tb_jenis_item`
--
ALTER TABLE `tb_jenis_item`
  ADD PRIMARY KEY (`kdJenisItem`);

--
-- Indexes for table `tb_kategori_item`
--
ALTER TABLE `tb_kategori_item`
  ADD PRIMARY KEY (`kdKategori`);

--
-- Indexes for table `tb_keperluan`
--
ALTER TABLE `tb_keperluan`
  ADD PRIMARY KEY (`id_keperluan`);

--
-- Indexes for table `tb_klasifikasi`
--
ALTER TABLE `tb_klasifikasi`
  ADD PRIMARY KEY (`KdKlasifikasi`);

--
-- Indexes for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD PRIMARY KEY (`kdPeminjaman`);

--
-- Indexes for table `tb_penerbit`
--
ALTER TABLE `tb_penerbit`
  ADD PRIMARY KEY (`kdPenerbit`);

--
-- Indexes for table `tb_pengarang`
--
ALTER TABLE `tb_pengarang`
  ADD PRIMARY KEY (`kdPengarang`);

--
-- Indexes for table `tb_pinjam_kelas`
--
ALTER TABLE `tb_pinjam_kelas`
  ADD PRIMARY KEY (`kdPinjam`);

--
-- Indexes for table `tb_rayon`
--
ALTER TABLE `tb_rayon`
  ADD PRIMARY KEY (`kdRayon`);

--
-- Indexes for table `tb_rombel`
--
ALTER TABLE `tb_rombel`
  ADD PRIMARY KEY (`id_rombel`);

--
-- Indexes for table `tb_setting`
--
ALTER TABLE `tb_setting`
  ADD PRIMARY KEY (`id_set`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `tb_status`
--
ALTER TABLE `tb_status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `tb_totalitem`
--
ALTER TABLE `tb_totalitem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_rombel`
--
ALTER TABLE `tb_rombel`
  MODIFY `id_rombel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_setting`
--
ALTER TABLE `tb_setting`
  MODIFY `id_set` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_totalitem`
--
ALTER TABLE `tb_totalitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
