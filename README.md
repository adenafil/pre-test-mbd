**Table of Contents**

 - [Soal](#soal)
 - [Anggota Kelompok](#anggota-kelompok)
 - [Jawaban Soal NO 1](#jawaban-soal-no-1)
 - [Jawaban Soal NO 2](#jawaban-soal-no-2)
 - [Jawaban Soal NO 3](#jawaban-soal-no-3)
    - [Table user](#table-user)
      - [Column](#column)
      - [Constraints](#constraints)
      - [References](#references)
      - [Indexes
        ](#indexes)
      - [DDL
        ](#ddl)
    - [Table transaksi](#table-transaksi)
      - [Column](#column-1)
      - [Constraints](#constraints-1)
      - [Foreign Keys](#foreign-keys)
      - [Indexes
        ](#indexes-1)
      - [DDL
        ](#ddl-1)    
    - [Table refferal](#table-refferal)
      - [Column](#column-2)
      - [Constraints](#constraints-2)
      - [Foreign Keys](#foreign-keys-1)
      - [Indexes
        ](#indexes-2)
      - [DDL
        ](#ddl-2)
   - [Table packing](#table-packing)
      - [Column](#column-3)
      - [Constraints](#constraints-3)
      - [Refereces](#references-1)
      - [Foreign Keys](#foreign-keys-2)
      - [Indexes
        ](#indexes-3)
      - [DDL
        ](#ddl-3)
   - [Table komentar](#table-komentar)
      - [Column](#column-4)
      - [Constraints](#constraints-4)
      - [Foreign Keys](#foreign-keys-3)
      - [Indexes
        ](#indexes-4)
      - [DDL
        ](#ddl-4)
   - [Table ketagory](#table-ketagory)
      - [Column](#column-5)
      - [Constraints](#constraints-5)
      - [References](#references-2)
      - [Indexes
        ](#indexes-5)
      - [DDL
        ](#ddl-5)
   - [Table barang](#table-barang)
      - [Column](#column-6)
      - [Constraints](#constraints-6)
      - [References](#references-3)
      - [Indexes
        ](#indexes-6)
      - [DDL
        ](#ddl-6)
      - [Tampilan ERD](#tampilan-erd)
 - [Penjelasan Relasi Pada Setiap Database](#penjelasan-relasi-pada-setiap-database)
   - [Relasi Pada Table user](#relasi-pada-table-user) 
   - [Relasi Pada Table transaksi](#relasi-pada-table-transaksi) 
   - [Relasi Pada Table refferal](#relasi-pada-table-refferal) 
   - [Relasi Pada Table packing](#relasi-pada-table-packing) 
   - [Relasi Pada Table komentar](#relasi-pada-table-komentar) 
   - [Relasi Pada Table ketagory](#relasi-pada-table-ketagory) 
   - [Relasi Pada Table barang](#relasi-pada-table-barang)
- [Jawaban Soal No 4](#jawaban-soal-no-4)
    - [Melakukan Join Yang Pertama](#melakukan-join-yang-pertama)
        - [SQL Query](#sql-query)
        - [Result](#result)
    - [Melakukan Join Yang Kedua](#melakukan-join-yang-kedua)
        - [SQL Query](#sql-query-1)
        - [Result](#result-1)

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
</br>
Mengenai penjelasan atau detail mengenai properties pada database, kami akan menaruhya pada section jawaban no 3.

# Jawaban Soal No 2
Ketika user memasuki sebuah website toko online perangkat IT dan aksesoris. Maka user harus membuat akun terlebih dahulu yang mana user direpresantikan pada table user, singkatnya ketika user sudah membuat akun maka dia harus login, setelah login dia mendapatkan pangkat user pada website toko online tersebut. pangkat user mendaptakan hak akses membeli barang yang mana barang terepresentasikan pada table barang kemudian user bisa melakukan check out yang direpresantasikan oleh table transaksi.

# Jawaban Soal No 3
Pada jawaban no 3 kami akan memulai menjawab atau menjelaskan mengenai table-table yang sudah kami buat, kemudian field mana yang termasuk primary key kemudian yang mana jugakah field yang merupakan foreign key. 

## Table User
Table user merupakan represantasi dari seorang user. Berikut ini merupakan propery-properynya.

### Column

| Column Name | # | Data Type | Not Null | Auto Increment | Key | Default | extra |
|------|---|---------|----------|----------|-----|----------|--------|
|id_user| 1 |int(7)|[v]|[v]|PRI| |auto_increment|
|no_telp| 2 |varchar(12)|[]|[]| |NULL| |
|password| 3 |varchar(32)|[]|[]| |NULL| |
|nama| 4 |varchar(40)|[]|[]| |NULL| |
|alamat| 5 |varchar(500)|[]|[]| |NULL| |
|pangkatU| 6 |enum('user','affiliasi','non_aktif')|[]|[]| |NULL| |

### Constraints
| Name | Column | Owner | Type | Check Expression |
|------|--------|-------|------|------------------|
|PRIMARY| - |user|PRIMARY KEY| |

### References
| Name             | Column | Owner | Ref Table | Type | Ref Object |
|------------------|--------|-------|-----------|------|-------|
| Komentar_ibfk_1  |-|komentar|user|FOREIGN KEY|PRIMARY|
| transaksi_ibfk_3 |-|transaksi|user|FOREIGN KEY|PRIMARY|

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
  `pangkatU` enum('user','affiliasi','non_aktif') DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

## Table Transaksi


### Column

| Column Name        | # | Data Type | Not Null | Auto Increment | Key | Default | extra |
|--------------------|------------|---------|----------|----------|-----|----------|--------|
| id_transaksi       |1|int(10)|[v]|[v]|PRI|
| tanggal            |2|datetime|[]|[]|-|
| id_user            |3|int|[]|[]|MUL|
| id_barang          |4|int|[]|[]|MUL|
| harga              |5|int|[]|[]|-|
| jumlah             |6|int|[]|[]|-|
| asuransi           |7|int|[]|[]|-|
| total_harga        |8|int|[]|[]|-|
| tanggal_bayar      |9|date|[]|[]|-|
| bank_transaksi     |10|enum('bni','bca')|[]|[]|-|
| lama_pengiriman    |11|char(6)|[]|[]|-|
| status_transaksi   |12|enum('pesan','konfirmasi','lunas','terkirim')|[]|[]|-|
| tanggal_pengiriman |13|date|[]|[]|-|
| id_packing         |14|int|[]|[]|MUL|
| id_refferal        |14|int|[]|[]|MUL|

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
  `id_packing` int(10) NOT NULL AUTO_INCREMENT,
  `berat` int(2) DEFAULT NULL,
  `harga` int(7) DEFAULT NULL,
  `nomor_resi` varchar(20) DEFAULT NULL,
  `packing_ekspedisi` enum('jnt','jna','ninja','sicepat') DEFAULT NULL,
  `tanggal_sampai` date DEFAULT NULL,
  PRIMARY KEY (`id_packing`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
| komentar_ibfk_1 |-| komentar   | user      |FOREIGN KEY| PRIMARY    |

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
  CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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

## Table barang

### Column

| Column Name | # | Data Type     | Not Null | Auto Increment | Key | Default | extra |
|-------------|---|---------------|----------|----------|-----|----------|--------|
| id_barang   | 1 | int(10)       |[v]|[v]| PRI |auto_increment| |
| nama_barang | 2 | varchar       |[]|[]| -   |NULL|
| link        | 3 | varchar       |[]|[]| -   |NULL|
| harga       | 4 | int           |[]|[]| -   |NULL|
| stok        | 5 | int           |[]|[]| -   |NULL|
| id_ketagori | 6 | int           |[]|[]| MUL |NULL|
| deskripsi   | 7 | text          |[]|[]| -   |NULL|
| asuransiB   | 8 | enum('n','y') |[]|[]| -   |NULL|
| publishB    | 9 | enum('n','y') |[]|[]| -   |NULL|

### Constraints
| Name | Column | Owner  | Type | Check Expression |
|------|--------|--------|------|------------------|
|PRIMARY| - | barang |PRIMARY KEY| |

### References
| Name            | Column | Owner  | Ref Table | Type | Ref Object |
|-----------------|--------|--------|-----------|------|-------|
| komentar_ibfk_1 |-| barang | ketagory  |FOREIGN KEY|PRIMARY|

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
  `id_kategori` int(3) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `asuransiB` enum('n','y') DEFAULT NULL,
  `publishB` enum('n','y') DEFAULT NULL,
  PRIMARY KEY (`id_barang`),
  KEY `id_kategori` (`id_kategori`),
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategory` (`id_kategory`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

### Tampilan ERD

![Gambar ERD dbeaver](https://raw.githubusercontent.com/adenafil/pre-test-mbd/main/asset/erddebeiver.png)

## Penjelasan Relasi Pada Setiap Database

### Relasi Pada Table user

![Gambar ERD dbeaver](https://raw.githubusercontent.com/adenafil/pre-test-mbd/main/asset/user.png)

Pada table di atas dapat diketahui bahwasanya table user memiliki relasi ke table komentar
dan juga ke transaksi. Pada table user -> komentar relasinya adalah one to many dan user -> transaksi adalah
one to many juga.

### Relasi Pada Table transaksi

![Gambar ERD dbeaver](https://raw.githubusercontent.com/adenafil/pre-test-mbd/main/asset/transaksi.png)

Table transaksi memiliki relasi antar 4 database yang diantaranya adalah tabel
table barang, table packing, table refferal dan table user. 
Kemudian untuk table transaksi -> barang memiliki relasi many to one, transaksi -> packing
memiliki relasi many to one, transaksi -> refferal memiliki relasi many to one dan transaksi -> user
memiliki relasi many to one.

### Relasi Pada Table refferal

![Gambar ERD dbeaver](https://raw.githubusercontent.com/adenafil/pre-test-mbd/main/asset/refferal.png)

Pada table refferal dapat diketahui melalui gambar bahwasanya hanya memiliki relasi ke satu table yaitu transaksi
dan relasinya adalah one to many.

### Relasi Pada Table packing

![Gambar ERD dbeaver](https://raw.githubusercontent.com/adenafil/pre-test-mbd/main/asset/packing.png)

Table packing memiliki relasi ke table transaksi dengan hubungan one to many.

### Relasi Pada Table komentar

![Gambar ERD dbeaver](https://raw.githubusercontent.com/adenafil/pre-test-mbd/main/asset/komentar.png)

Melalui gambar di atas terindikasi bahwasanya table komentar memiliki relasi
many to one ke pada table user.

### Relasi Pada Table ketagory

![Gambar ERD dbeaver](https://raw.githubusercontent.com/adenafil/pre-test-mbd/main/asset/kategory.png)

Table ketagory memiliki relasi one to many terhadap table barang.

### Relasi Pada Table barang

![Gambar ERD dbeaver](https://raw.githubusercontent.com/adenafil/pre-test-mbd/main/asset/barangpng.png)

Terakhir adalah table barang. Relasi table barang adalah many to one pada kepada
table ketagory.

# Jawaban Soal No 4

Kami akan melakukan query dari database yang kami sudah buat
dengan melibatkan operasi JOIN di mysql

## Melakukan JOIN yang pertama

### SQL Query

```
SELECT t.tanggal, u.nama AS nama_pengguna, b.nama_barang, t.harga, t.jumlah, t.total_harga
FROM transaksi t
JOIN user u ON t.id_user = u.id_user
JOIN barang b ON t.id_barang = b.id_barang;
```


### Result

| tanggal               | nama_pengguna | nama_barang | harga | jumlah | total_harga |
|-----------------------|---------------|-------------|-------|--------|-------------|
| 2024-03-06 10:00:00.000 |John Doe|Laptop ASUS|7000000|1|7010000|


## Melakukan JOIN yang kedua

### SQL Query

```
SELECT u.nama AS nama_pengguna, b.nama_barang, k.komentar
FROM komentar k
JOIN user u ON k.id_user = u.id_user
JOIN barang b ON k.id_barang = b.id_barang;
```

### Result

| nama_pengguna | nama_barang | komentar    | 
|---|-------------|-------------|
| John Doe | Laptop ASUS | Barang ini sangat bagus! |


# Penutup

Demikian kiranya tugas yang telah kami kerjakan. Kami mengucapkan mohon maaf
sebesar-sebesarnya atas kesalahan pada tugas yang kami kerjakan dan mengucapkan
terima kasih atas bimbinganya.
Akhir kata kami ucapkan terima kasih kepada iabu dosen 🙏.
