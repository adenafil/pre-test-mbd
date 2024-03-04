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
  `bank` char(15)
);

CREATE TABLE `req_pass` (
  `id_req_pass` int(7) PRIMARY KEY AUTO_INCREMENT,
  `id_user` int(7),
  `password` varchar(32)
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

ALTER TABLE `packing` ADD FOREIGN KEY (`id_packing`) REFERENCES `transaksi` (`id_packing`);

ALTER TABLE `transaksi` ADD FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

ALTER TABLE `transaksi` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

ALTER TABLE `refferal` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

ALTER TABLE `barang` ADD FOREIGN KEY (`id_kategori`) REFERENCES `kategory` (`id_kategory`);

ALTER TABLE `user` ADD FOREIGN KEY (`id_user`) REFERENCES `req_pass` (`id_user`);

ALTER TABLE `transaksi` ADD FOREIGN KEY (`id_transaksi`) REFERENCES `komisi` (`id_transaksi`);

ALTER TABLE `komentar` ADD FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

ALTER TABLE `komentar` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

ALTER TABLE `komisi` ADD FOREIGN KEY (`id_bayar_k`) REFERENCES `bayar_komisi` (`id_bayar_K`);
