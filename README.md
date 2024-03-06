# Soal
1. Dalam kelompok beranggotakan 2 orang, buatlah sebuah desain database
sederhana (bebas) berupa Relational Data Model (Entity Relationship
Diagram) dengan jumlah tabel minimal 7! Pilih salah satu topik berikut:
- a. Toko Online perangkat IT dan aksesoris
- b. Toko Laundry baju dengan sistem antar jemput pesanan
- c. Toko roti butik (Bakery)
2. Berikan narasi singkat mengenai sistem yang dimodelkan dalam database
tersebut!
3. Berikan atribut pada masing-masing tabel dan keterangan primary key dan
foreign key. Pastikan ERD yang dibuat sudah ternormalisasi!
4. Tuliskan 2 contoh query dari desain database tersebut yang melibatkan
lebih dari 1 tabel (ada operasi JOIN)!

# Anggota Kelompok 
Berikut ini adalah anggota kelompok kami :
- Ade Nafil Firmansah (3012210002)
- Frenky (3012210019)
- Dinunaya Syuja 'Aryoko (3012210012)

# Jawaban Soal NO 1
kelompok kami mendapatkan studi kasus dengan judul <i><b>"Toko Online perangkat IT dan aksesoris"</b></i>.
Mengenai database sql yang sudah kami buat bisa diklik [di sini](https://raw.githubusercontent.com/adenafil/pre-test-mbd/main/sql/db.sql) , atau kami lampirkan sebagai berikut :
```
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
```

Untuk tampilan ERD pada database kami, bisa dilihat pada gambar berikut :

![Gambar ERD dbeaver](https://raw.githubusercontent.com/adenafil/pre-test-mbd/main/asset/erddebeiver.png)
Mengenai penjelasan atau detail mengenai properties pada database, kami akan menaruhya pada section jawaban no 3.

# Jawaban Soal No 2
Ketika user memasuki sebuah website toko online perangkat IT dan aksesoris. Maka user harus membuat akun terlebih dahulu yang mana user direpresantikan pada table user, singkatnya ketika user sudah membuat akun maka dia harus login, setelah login dia mendapatkan pangkat user pada website toko online tersebut. pangkat user mendaptakan hak akses membeli barang yang mana barang terepresentasikan pada table barang kemudian user bisa melakukan check out yang direpresantasikan oleh table transaksi.

# Jawaban Soal No 3
Pada jawaban no 3 kami akan memulai menjawab atau menjelaskan mengenai table-table yang sudah kami buat, kemudian field mana yang termasuk primary key kemudian yang mana jugakah field yang merupakan foreign key. 

## Table User
Table user merupakan represantasi dari seorang user. Berikut ini merupakan propery-properynya.

### Column

| Column Name | # | Data Type | Not Null | Auto Increment | Key | Default | extra |
|------|------------|---------|----------|----------|-----|----------|--------|
|id_user|1|int(7)|[v]|[v]|PRI| |auto_increment|
|no_telp|2|varchar(12)|[]|[]| |NULL| |
|password|3|varchar(32)|[]|[]| |NULL| |
|nama|4|varchar(40)|[]|[]| |NULL| |
|alamat|5|varchar(500)|[]|[]| |NULL| |
|id_kota|6|char(8)|[]|[]| |NULL| |
|id_refferal|7|int(8)|[]|[]| |NULL| |
|pangkatU|8|enum('user','affiliasi','non_aktif')|[]|[]| |NULL| |

### Constraints
| Name | Column | Owner | Type | Check Expression |
|------|--------|-------|------|------------------|
|PRIMARY| - |user|PRIMARY KEY| |

### References
| Name | Column | Owner | Ref Table | Type | Ref Object |
|------|--------|-------|-----------|------|-------|
|Komentar_ibfk_2|-|komentar|user|FOREIGN KEY|PRIMARY|
|refferal_ibfk_1|-|refferal|user|FOREIGN KEY|PRIMARY|
|transaksi_ibfk_3|-|transaksi|user|FOREIGN KEY|PRIMARY|

### Indexes
| Index Name | Column | Table | Index Type | Ascending | Nullable |
|------------|--------|-------|------------|---------|---------|
|PRIMARY KEY|id_user|user|BTree|-|-|

### DDL
```
-- predblagi.`user` definition

CREATE TABLE `user` (
  `id_user` int(7) NOT NULL AUTO_INCREMENT,
  `no_telp` varchar(12) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `nama` varchar(40) DEFAULT NULL,
  `alamat` varchar(500) DEFAULT NULL,
  `id_kota` char(8) DEFAULT NULL,
  `id_refferal` int(8) DEFAULT NULL,
  `pangkatU` enum('user','affiliasi','non_aktif') DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

## Table Transaksi


### Column

| Column Name | # | Data Type | Not Null | Auto Increment | Key | Default | extra |
|------|------------|---------|----------|----------|-----|----------|--------|
|id_transaksi|1|int(10)|[v]|[v]|PRI|
|tanggal|2|datetime|[]|[]|-|
|id_user|3|int|[]|[]|MUL|
|id_barang|4|int|[]|[]|MUL|
|harga|5|int|[]|[]|-|
|jumlah|6|int|[]|[]|-|
|asuransi|7|int|[]|[]|-|
|total_harga|8|int|[]|[]|-|
|tanggal_bayar|9|date|[]|[]|-|
|bank_transaksi|10|enum('bni','bca')|[]|[]|-|
|lama_pengiriman|11|char(6)|[]|[]|-|
|status_transaksi|12|enum('pesan','konfirmasi','lunas','terkirim')|[]|[]|-|
|tanggal_pengiriman|13|date|[]|[]|-|
|id_packing|14|int|[]|[]|MUL|

### Constraints
| Name | Column | Owner | Type | Check Expression |
|------|--------|-------|------|------------------|
|PRIMARY| - |transaksi|PRIMARY KEY| |

### Foreign Keys
| Name | Column | Owner | Ref Table | Type | Ref Object |
|------|--------|-------|-----------|------|--------|
|transaksi_ibfk_2|-|transaksi|barang|FOREIGN KEY|PRIMARY|
|transaksi_ibfk_1|-|transaksi|packing|FOREIGN KEY|PRIMARY|
|transaksi_ibfk_3|-|transaksi|user|FOREIGN KEY|PRIMARY|

### Indexes
| Index Name | Column | Table | Index Type | Ascending | Nullable |
|------------|--------|-------|------------|---------|---------|
|PRIMARY KEY|id_transaksi|transaksi|BTree|-|-|
|id_barang|id_barang|transaksi|BTree|-|-|
|id_packing|id_packing|transaksi|BTree|-|-|
|id_user|id_user|transaksi|BTree|-|-|


### DDL
```
-- predblagi.transaksi definition

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
  `packing` int(7) DEFAULT NULL,
  `id_packing` int(7) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `id_packing` (`id_packing`),
  KEY `id_barang` (`id_barang`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_packing`) REFERENCES `packing` (`id_packing`),
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```


## Table Refferal


### Column

| Column Name | # | Data Type | Not Null | Auto Increment | Key | Default | extra |
|------|------------|---------|----------|----------|-----|----------|--------|
|id_user|1|int(10)|[v]|[v]|PRI|auto_increment| |
|no_rek|2|varchar|[]|[]|-|NULL|
|bank|3|char|[]|[]|-|NULL|
|expired|4|date|[]|[]|-|NULL|

### Constraints
| Name | Column | Owner | Type | Check Expression |
|------|--------|-------|------|------------------|
|PRIMARY| - |transaksi|PRIMARY KEY| |

### Foreign Keys
| Name | Column | Owner | Ref Table | Type | Ref Object |
|------|--------|-------|-----------|------|--------|
|refferal_ibfk_1|-|refferal|user|FOREIGN KEY|PRIMARY|

### Indexes
| Index Name | Column | Table | Index Type | Ascending | Nullable |
|------------|--------|-------|------------|---------|---------|
|PRIMARY KEY|id_user|refferal|BTree|-|-|

### DDL
```
-- predblagi.refferal definition

CREATE TABLE `refferal` (
  `id_user` int(7) NOT NULL AUTO_INCREMENT,
  `no_rek` varchar(20) DEFAULT NULL,
  `bank` char(15) DEFAULT NULL,
  `expired` date DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  CONSTRAINT `refferal_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

## Table Packing

### Column

| Column Name       | # | Data Type | Not Null | Auto Increment | Key | Default | extra |
|-------------------|---|-----------|----------|----------|-----|----------|--------|
| id_packing        | 1 | int(10)   |[v]|[v]|PRI|auto_increment| |
| berat             | 2 | int       |[]|[]|-|NULL|
| harga             | 3 | int       |[]|[]|-|NULL|
| nomor_resi        | 4 | varchar   |[]|[]|-|NULL|
| packing_ekspedisi | 5 | enum('jnt','jna','ninja','sicepat')          |[]|[]|-|NULL|
| tanggal_sampai    | 6 | date      |[]|[]|-|NULL|

### Constraints
| Name | Column | Owner     | Type | Check Expression |
|------|--------|-----------|------|------------------|
|PRIMARY| - | packinig  |PRIMARY KEY| |

### Foreign Keys
| Name           | Column | Owner | Ref Table | Type | Ref Object |
|----------------|--------|--|-----------|------|--------|
| packing_ibfk_1 |-|packing|transaksi|FOREIGN KEY| |

### References
| Name             | Column | Owner     | Ref Table | Type | Ref Object |
|------------------|--------|-----------|-----------|------|-------|
| transaksi_ibfk_1 |-| transaksi | packing   |FOREIGN KEY|PRIMARY|

### Indexes
| Index Name | Column     | Table   | Index Type | Ascending | Nullable |
|------------|------------|---------|------------|---------|---------|
|PRIMARY KEY| id_packing | packing |BTree|-|-|

### DDL
```
-- predblagi.packing definition

CREATE TABLE `packing` (
  `id_packing` int(10) NOT NULL,
  `berat` int(2) DEFAULT NULL,
  `harga` int(7) DEFAULT NULL,
  `nomor_resi` varchar(20) DEFAULT NULL,
  `packing_ekspedisi` enum('jnt','jna','ninja','sicepat') DEFAULT NULL,
  `tanggal_sampai` date DEFAULT NULL,
  PRIMARY KEY (`id_packing`),
  CONSTRAINT `packing_ibfk_1` FOREIGN KEY (`id_packing`) REFERENCES `transaksi` (`id_packing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

## Table Komisi

### Column

| Column Name   | # | Data Type                                    | Not Null | Auto Increment | Key | Default | extra |
|---------------|---|----------------------------------------------|----------|----------|-----|----------|--------|
| id_komisi     | 1 | int(10)                                      |[v]|[v]|PRI|auto_increment| |
| id_transaksi  | 2 | int                                          |[]|[]|-|NULL|
| jenis_komisi  | 3 | enum('beli','daftar')                        |[]|[]|-|NULL|
| id_refferal   | 4 | int                                          |[]|[]|-|NULL|
| jumlah        | 5 | int                                          |[]|[]|-|NULL|
| id_bayar_k    | 6 | int                                          |[]|[]|-|NULL|
| status_komisi | 7 | enum('valid','diajukan','dibayar','ditolak') |[]|[]|-|NULL|

### Constraints
| Name | Column | Owner  | Type | Check Expression |
|------|--------|--------|------|------------------|
|PRIMARY| - | komisi |PRIMARY KEY| |

### Foreign Keys
| Name          | Column | Owner  | Ref Table    | Type | Ref Object |
|---------------|--------|--------|--------------|------|------------|
| komisi_ibfk_2 |-| komisi | bayar_komisi |FOREIGN KEY| PRIMARY    |
| komisi_ibfk_1 |-| komisi | transaksi    |FOREIGN KEY| PRIMARY    |

### Indexes
| Index Name   | Column    | Table  | Index Type | Ascending | Nullable |
|--------------|-----------|--------|------------|---------|---------|
| PRIMARY KEY  | id_komisi | komisi |BTree|-|-|
| id_bayar_k   | id_bayar_k | komisi |BTree|-|-|
| id_transaksi | id_transaksi | komisi |BTree|-|-|

### DDL
```
-- predblagi.komisi definition

CREATE TABLE `komisi` (
  `id_komisi` int(10) NOT NULL AUTO_INCREMENT,
  `id_transaksi` int(10) DEFAULT NULL,
  `jenis_komisi` enum('beli','daftar') DEFAULT NULL,
  `id_refferal` int(7) DEFAULT NULL,
  `jumlah` int(10) DEFAULT NULL,
  `id_bayar_k` int(7) DEFAULT NULL,
  `status_komisi` enum('valid','diajukan','dibayar','ditolak') DEFAULT NULL,
  PRIMARY KEY (`id_komisi`),
  KEY `id_transaksi` (`id_transaksi`),
  KEY `id_bayar_k` (`id_bayar_k`),
  CONSTRAINT `komisi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`),
  CONSTRAINT `komisi_ibfk_2` FOREIGN KEY (`id_bayar_k`) REFERENCES `bayar_komisi` (`id_bayar_K`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```
## Table Komentar

### Column

| Column Name     | # | Data Type    | Not Null | Auto Increment | Key | Default | extra |
|-----------------|---|--------------|----------|----------|-----|----------|--------|
| id_komentar     | 1 | int(10)      |[v]|[v]|PRI|auto_increment| |
| id_barang       | 2 | int          |[]|[]|-|NULL|
| id_user         | 3 | int          |[]|[]|-|NULL|
| tanggal         | 4 | date         |[]|[]|-|NULL|
| komentar        | 5 | text         |[]|[]|-|NULL|
| status_komentar | 6 | enum('m','p') |[]|[]|-|NULL|

### Constraints
| Name | Column | Owner    | Type | Check Expression |
|------|--------|----------|------|------------------|
|PRIMARY| - | komentar |PRIMARY KEY| |

### Foreign Keys
| Name            | Column | Owner    | Ref Table | Type | Ref Object |
|-----------------|--------|----------|-----------|------|------------|
| komentar_ibfk_1 |-| komentar | barang    |FOREIGN KEY| PRIMARY    |
| komentar_ibfk_2 |-| komentar   | user      |FOREIGN KEY| PRIMARY    |

### Indexes
| Index Name   | Column      | Table    | Index Type | Ascending | Nullable |
|--------------|-------------|----------|------------|---------|---------|
| PRIMARY KEY  | id_komentar | komentar |BTree|-|-|
| id_barang   | id_barang   | komentar   |BTree|-|-|
| id_user | id_user     | komentar   |BTree|-|-|

### DDL

```
-- predblagi.komentar definition

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
  CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

## Table Ketagory

| Column Name | # | Data Type | Not Null | Auto Increment | Key | Default | extra |
|-------------|---|-----------|----------|----------|-----|----------|--------|
| id_ketagory | 1 | int(10)   |[v]|[v]|PRI|auto_increment| |
| nama        | 2 | varchar   |[]|[]|-|NULL|

### Constraints
| Name | Column | Owner    | Type | Check Expression |
|------|--------|----------|------|------------------|
|PRIMARY| - | ketagory |PRIMARY KEY| |

### References
| Name          | Column | Owner  | Ref Table | Type | Ref Object |
|---------------|--------|--------|-----------|------|-------|
| barang_ibfk_1 |-| barang | ketagory  |FOREIGN KEY|PRIMARY|

### Indexes
| Index Name  | Column      | Table    | Index Type | Ascending | Nullable |
|-------------|-------------|----------|------------|---------|---------|
| PRIMARY  | id_ketagory | ketagory |BTree|-|-|

### DDL
```
-- predblagi.kategory definition

CREATE TABLE `kategory` (
  `id_kategory` int(6) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_kategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

## Table bayar_komisi

### Column

| Column Name   | # | Data Type                            | Not Null | Auto Increment | Key | Default | extra |
|---------------|---|--------------------------------------|----------|----------|-----|----------|--------|
| id_bayar_k    | 1 | int(10)                              |[v]|[v]|PRI|auto_increment| |
| tgl_pengajuan | 2 | date                                 |[]|[]|-|NULL|
| jumlah        | 3 | int                                  |[]|[]|-|NULL|
| status_bayarK | 4 | enum('diajukan','ditolak','dibayar') |[]|[]|-|NULL|
| tgl_dibayar   | 5 | date                                 |[]|[]|-|NULL|

### Constraints
| Name | Column | Owner        | Type | Check Expression |
|------|--------|--------------|------|------------------|
|PRIMARY| - | bayar_komisi |PRIMARY KEY| |

### References
| Name          | Column | Owner  | Ref Table    | Type | Ref Object |
|---------------|--------|--------|--------------|------|-------|
| komisi_ibfk_1 |-| komisi | bayar_komisi |FOREIGN KEY|PRIMARY|

### Indexes
| Index Name  | Column     | Table        | Index Type | Ascending | Nullable |
|-------------|------------|--------------|------------|---------|---------|
| PRIMARY  | id_bayar_k | bayar_komisi |BTree|-|-|

### DDL

```
-- predblagi.bayar_komisi definition

CREATE TABLE `bayar_komisi` (
  `id_bayar_K` int(10) NOT NULL AUTO_INCREMENT,
  `tgl_pengajuan` date DEFAULT NULL,
  `jumlah` int(10) DEFAULT NULL,
  `status_bayarK` enum('diajukan','ditolak','dibayar') DEFAULT NULL,
  `tgl_dibayar` date DEFAULT NULL,
  PRIMARY KEY (`id_bayar_K`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

## Table barang

### Column

| Column Name | #  | Data Type     | Not Null | Auto Increment | Key | Default | extra |
|-------------|----|---------------|----------|----------|-----|----------|--------|
| id_barang   | 1  | int(10)       |[v]|[v]| PRI |auto_increment| |
| nama_barang | 2  | varchar       |[]|[]| -   |NULL|
| link        | 3  | varchar       |[]|[]| -   |NULL|
| barga       | 4  | int           |[]|[]| -   |NULL|
| stok        | 5  | int           |[]|[]| -   |NULL|
| komisi      | 6  | int           |[]|[]| -   |NULL|
| id_ketagori | 7  | int           |[]|[]| MUL |NULL|
| deskripsi   | 8  | text          |[]|[]| -   |NULL|
| asuransiB   | 9  | enum('n','y') |[]|[]| -   |NULL|
| publishB    | 10 | enum('n','y') |[]|[]| -   |NULL|

### Constraints
| Name | Column | Owner  | Type | Check Expression |
|------|--------|--------|------|------------------|
|PRIMARY| - | barang |PRIMARY KEY| |

### References
| Name            | Column | Owner     | Ref Table | Type | Ref Object |
|-----------------|--------|-----------|-----------|------|-------|
| komentar_ibfk_1 |-| komentar  | barang    |FOREIGN KEY|PRIMARY|
| transaksi_ibfk_2 |-| transaksi | barang    |FOREIGN KEY|PRIMARY|

### Indexes
| Index Name | Column      | Table  | Index Type | Ascending | Nullable |
|----------|-------------|--------|------------|---------|---------|
| PRIMARY  | id_barang   | barang |BTree|-|-|
| PRIMARY  | id_ketagori | barang |BTree|-|-|

### DDL

```
-- predblagi.barang definition

CREATE TABLE `barang` (
  `id_barang` int(7) NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `harga` int(10) DEFAULT NULL,
  `stok` int(5) DEFAULT NULL,
  `komisi` int(10) DEFAULT NULL,
  `id_kategori` int(3) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `asuransiB` enum('n','y') DEFAULT NULL,
  `publishB` enum('n','y') DEFAULT NULL,
  PRIMARY KEY (`id_barang`),
  KEY `id_kategori` (`id_kategori`),
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategory` (`id_kategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

### Tampolan ERD

![Gambar ERD dbeaver](https://raw.githubusercontent.com/adenafil/pre-test-mbd/main/asset/erddebeiver.png)

# Jawaban Soal No 4

Kami akan melakukan query dari database yang kami sudah buat
dengan melibatkan operasi JOIN di mysql

## Melakukan JOIN yang pertama

### SQL Query

```angular2html

```


### Result


## Melakukan JOIN yang kedua

### SQL Query

```angular2html

```

### Result



