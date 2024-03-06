-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: predblagi
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barang` (
                          `id_barang` int(7) NOT NULL AUTO_INCREMENT,
                          `nama_barang` varchar(255) DEFAULT NULL,
                          `link` varchar(255) DEFAULT NULL,
                          `harga` int(10) DEFAULT NULL,
                          `stok` int(5) DEFAULT NULL,
                          `id_kategori` int(3) DEFAULT NULL,
                          `deskripsi` text DEFAULT NULL,
                          `asuransiB` enum('n','y') DEFAULT NULL,
                          `publishB` enum('n','y') DEFAULT NULL,
                          PRIMARY KEY (`id_barang`),
                          KEY `id_kategori` (`id_kategori`),
                          CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategory` (`id_kategory`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kategory`
--

DROP TABLE IF EXISTS `kategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategory` (
                            `id_kategory` int(6) NOT NULL AUTO_INCREMENT,
                            `nama` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`id_kategory`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komentar` (
                            `id_komentar` int(10) NOT NULL AUTO_INCREMENT,
                            `id_barang` int(7) DEFAULT NULL,
                            `id_user` int(7) DEFAULT NULL,
                            `tanggal` date DEFAULT NULL,
                            `komentar` text DEFAULT NULL,
                            `status_komentar` enum('m','p') DEFAULT NULL,
                            PRIMARY KEY (`id_komentar`),
                            KEY `id_barang` (`id_barang`),
                            KEY `id_user` (`id_user`),
                            CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `packing`
--

DROP TABLE IF EXISTS `packing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packing` (
                           `id_packing` int(10) NOT NULL AUTO_INCREMENT,
                           `berat` int(2) DEFAULT NULL,
                           `harga` int(7) DEFAULT NULL,
                           `nomor_resi` varchar(20) DEFAULT NULL,
                           `packing_ekspedisi` enum('jnt','jna','ninja','sicepat') DEFAULT NULL,
                           `tanggal_sampai` date DEFAULT NULL,
                           PRIMARY KEY (`id_packing`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refferal`
--

DROP TABLE IF EXISTS `refferal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refferal` (
                            `id_refferal` int(7) NOT NULL AUTO_INCREMENT,
                            `no_rek` varchar(20) DEFAULT NULL,
                            `bank` char(15) DEFAULT NULL,
                            `expired` date DEFAULT NULL,
                            PRIMARY KEY (`id_refferal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi` (
                             `id_transaksi` int(10) NOT NULL AUTO_INCREMENT,
                             `tanggal` datetime DEFAULT NULL,
                             `id_user` int(7) DEFAULT NULL,
                             `id_barang` int(7) DEFAULT NULL,
                             `harga` int(10) DEFAULT NULL,
                             `jumlah` int(5) DEFAULT NULL,
                             `asuransi` int(7) DEFAULT NULL,
                             `total_harga` int(10) DEFAULT NULL,
                             `tanggal_bayar` date DEFAULT NULL,
                             `bank_transaksi` enum('bni','bca') DEFAULT NULL,
                             `lama_pengiriman` char(6) DEFAULT NULL,
                             `status_transaksi` enum('pesan','konfirmasi','lunas','terkirim') DEFAULT NULL,
                             `tanggal_kirim` date DEFAULT NULL,
                             `id_packing` int(10) DEFAULT NULL,
                             `id_refferal` int(7) DEFAULT NULL,
                             PRIMARY KEY (`id_transaksi`),
                             KEY `id_packing` (`id_packing`),
                             KEY `id_barang` (`id_barang`),
                             KEY `id_user` (`id_user`),
                             KEY `id_refferal` (`id_refferal`),
                             CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_packing`) REFERENCES `packing` (`id_packing`),
                             CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
                             CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
                             CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`id_refferal`) REFERENCES `refferal` (`id_refferal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
                        `id_user` int(7) NOT NULL AUTO_INCREMENT,
                        `no_telp` varchar(12) DEFAULT NULL,
                        `password` varchar(32) DEFAULT NULL,
                        `nama` varchar(40) DEFAULT NULL,
                        `alamat` varchar(500) DEFAULT NULL,
                        `pangkatU` enum('user','affiliasi','non_aktif') DEFAULT NULL,
                        PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-06 15:22:25
