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
Mengenai file sql yang sudah kami buat bisa diklik [di sini](https://raw.githubusercontent.com/adenafil/pre-test-mbd/main/sql/db.sql) , atau sebagai berikut :
```
use predblagi;

CREATE TABLE `user` (
  `id_user` int(7) PRIMARY KEY AUTO_INCREMENT,
  `no_telp` varchar(12),
  `password` varchar(32),
  `nama` varchar(40),
  `alamat` varchar(500),
  `id_kota` char(8),
  `id_refferal` int(8),
  `pangkatU` ENUM ('user', 'affiliasi', 'non_aktif')
);

CREATE TABLE `barang` (
  `id_barang` int(7) PRIMARY KEY AUTO_INCREMENT,
  `nama_barang` varchar(255),
  `link` varchar(255),
  `harga` int(10),
  `stok` int(5),
  `komisi` int(10),
  `id_kategori` int(3),
  `deskripsi` text,
  `asuransiB` ENUM ('n', 'y'),
  `publishB` ENUM ('n', 'y')
);

CREATE TABLE `transaksi` (
  `id_transaksi` int(10) PRIMARY KEY AUTO_INCREMENT,
  `tanggal` datetime,
  `id_user` int(7),
  `id_barang` int(7),
  `harga` int(10),
  `jumlah` int(5),
  `asuransi` int(7),
  `total_harga` int(10),
  `tanggal_bayar` date,
  `bank_transaksi` ENUM ('bni', 'bca'),
  `lama_pengiriman` char(6),
  `status_transaksi` ENUM ('pesan', 'konfirmasi', 'lunas', 'terkirim'),
  `tanggal_kirim` date,
  `packing` int(7),
  `id_packing` int(7)
);

CREATE TABLE `kategory` (
  `id_kategory` int(6) PRIMARY KEY AUTO_INCREMENT,
  `nama` varchar(255)
);

CREATE TABLE `komentar` (
  `id_komentar` int(10) PRIMARY KEY AUTO_INCREMENT,
  `id_barang` int(7),
  `id_user` int(7),
  `tanggal` date,
  `komentar` text,
  `status_komentar` ENUM ('m', 'p')
);

CREATE TABLE `bayar_komisi` (
  `id_bayar_K` int(10) PRIMARY KEY AUTO_INCREMENT,
  `tgl_pengajuan` date,
  `jumlah` int(10),
  `status_bayarK` ENUM ('diajukan', 'ditolak', 'dibayar'),
  `tgl_dibayar` date
);

CREATE TABLE `refferal` (
  `id_user` int(7) PRIMARY KEY AUTO_INCREMENT,
  `no_rek` varchar(20),
  `bank` char(15),
  `expired` date
);

CREATE TABLE `komisi` (
  `id_komisi` int(10) PRIMARY KEY AUTO_INCREMENT,
  `id_transaksi` int(10),
  `jenis_komisi` ENUM ('beli', 'daftar'),
  `id_refferal` int(7),
  `jumlah` int(10),
  `id_bayar_k` int(7),
  `status_komisi` ENUM ('valid', 'diajukan', 'dibayar', 'ditolak')
);

CREATE TABLE `packing` (
  `id_packing` int(10) PRIMARY KEY,
  `berat` int(2),
  `harga` int(7),
  `nomor_resi` varchar(20),
  `packing_ekspedisi` ENUM ('jnt', 'jna', 'ninja', 'sicepat'),
  `tanggal_sampai` date
);

-- ALTER TABLE `packing` ADD FOREIGN KEY (`id_packing`) REFERENCES `transaksi` (`id_packing`);

alter table `transaksi` add foreign key (`id_packing`) references `packing` (`id_packing`);

ALTER TABLE `transaksi` ADD FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

ALTER TABLE `transaksi` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

ALTER TABLE `refferal` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

ALTER TABLE `barang` ADD FOREIGN KEY (`id_kategori`) REFERENCES `kategory` (`id_kategory`);

-- ALTER TABLE `transaksi` ADD FOREIGN KEY (`id_transaksi`) REFERENCES `komisi` (`id_transaksi`);

alter table `komisi` add foreign key (`id_transaksi`) references `transaksi` (`id_transaksi`);

ALTER TABLE `packing` ADD FOREIGN KEY (`id_packing`) REFERENCES `transaksi` (`id_packing`);

ALTER TABLE `komentar` ADD FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

ALTER TABLE `komentar` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

ALTER TABLE `komisi` ADD FOREIGN KEY (`id_bayar_k`) REFERENCES `bayar_komisi` (`id_bayar_K`);
```

Kemdudian mengenai erd yang sudah kami buat ada 2 versi yang sebenarnya sama saja yaitu yang dibuat melalui platfrom [dbdiagram](https://dbdiagram.io) dan juga melalui dbeaver. Berikut untuk tampilan pada platfrom dbdiagram bisa diakses dengan klik [di sini](https://dbdiagram.io/d/65e5bfb0cd45b569fb7760a8) atau melalui lampiran gambar berikut.

![Gambar ERD DbDiagram](https://raw.githubusercontent.com/adenafil/pre-test-mbd/main/asset/erddbdiagram.png)

lalu sedangkan ERD pada dbeaver dapat dilihat pada lampiran berikut.

![Gambar ERD dbeaver](https://raw.githubusercontent.com/adenafil/pre-test-mbd/main/asset/erddebeiver.png)

Mengenai penjelasan, kami akan menaruhya pada section jawaban no 3.

# Jawaban Soal No 2
Ketika user memasuki sebuah website toko online perangkat IT dan aksesoris. Maka user harus membuat akun terlebih dahulu yang mana user direpresantikan pada table user, singkatnya ketika user sudah membuat akun maka dia harus login, setelah login dia mendapatkan pangkat user pada website toko online tersebut. pangkat user mendaptakan hak akses membeli barang yang mana barang terepresentasikan pada table barang kemudian user bisa melakukan check out yang direpresantasikan oleh table transaksi.

# Jawaban Soal No 3
Pada jawaban no 3 kami akan memulai menjawab atau menjelaskan mengenai table-table yang sudah kami buat, kemudian field mana yang termasuk primary key kemudian yang mana jugakah field yang merupakan foreign key. 

## Table user

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