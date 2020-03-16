/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : db_pordasi

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 16/03/2020 14:52:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for agenda
-- ----------------------------
DROP TABLE IF EXISTS `agenda`;
CREATE TABLE `agenda` (
  `id_agenda` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(500) NOT NULL,
  `jenis_agenda` varchar(50) NOT NULL,
  `panitia` varchar(200) DEFAULT NULL,
  `tempat` varchar(200) DEFAULT NULL,
  `mulai` date NOT NULL,
  `selesai` date NOT NULL,
  `ringkasan` text NOT NULL,
  `isi` longtext NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_agenda`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of agenda
-- ----------------------------
BEGIN;
INSERT INTO `agenda` VALUES (1, 'Pelantikan Gubernur DKI Jakarta', 'Internal', 'Pusdatin', 'Balai Kota', '2017-09-08', '2017-09-09', 'adada', '<p>adada</p>\r\n', '2017-09-08 08:18:36');
COMMIT;

-- ----------------------------
-- Table structure for asosiasi
-- ----------------------------
DROP TABLE IF EXISTS `asosiasi`;
CREATE TABLE `asosiasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provinsi_id` int(11) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kontak` varchar(15) DEFAULT NULL,
  `deskripsi` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asosiasi
-- ----------------------------
BEGIN;
INSERT INTO `asosiasi` VALUES (1, 9, 'Jln Bekasi1', '022 7271231', '<p><strong>Fasilitas:</strong></p>\r\n<p>Wifi, Toilet, Kamar Ganti</p>\r\n<p><strong>Nama Atlit:</strong></p>\r\n<p>-Ferdi</p>\r\n<p>-Bambang</p>\r\n<p><strong>Nama Kuda:</strong></p>\r\n<p>-Sukijan<br />-Mamba</p>');
INSERT INTO `asosiasi` VALUES (2, 2, 'Jln Teuing', '022 71231', '<p><strong>Fasilitas:</strong></p>\r\n<p>Wifi, Toilet, Kamar Ganti</p>\r\n<p><strong>Nama Atlit:</strong></p>\r\n<p>-Ferdi</p>\r\n<p>-Bambang</p>\r\n<p><strong>Nama Kuda:</strong></p>\r\n<p>-Sukijan<br />-Mamba</p>');
COMMIT;

-- ----------------------------
-- Table structure for bagian
-- ----------------------------
DROP TABLE IF EXISTS `bagian`;
CREATE TABLE `bagian` (
  `id_bagian` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `kode_bagian` varchar(10) NOT NULL,
  `nama_bagian` varchar(255) NOT NULL,
  `status_bagian` enum('Aktif','Non Aktif') NOT NULL,
  `keterangan` text,
  `wilayah` text,
  `tanggal_post` datetime NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_bagian`),
  UNIQUE KEY `kode_bagian` (`kode_bagian`),
  UNIQUE KEY `nama_bagian` (`nama_bagian`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bagian
-- ----------------------------
BEGIN;
INSERT INTO `bagian` VALUES (12, 1, 'MARKETING', 'Bagian Pemasaran', 'Aktif', '', '', '2019-04-13 20:10:33', '2019-04-13 20:10:33');
INSERT INTO `bagian` VALUES (13, 1, 'KEUANGAN', 'Bagian Keuangan', 'Aktif', '', '', '2019-04-13 20:10:46', '2019-04-13 20:10:46');
INSERT INTO `bagian` VALUES (14, 1, 'adada', 'adad', 'Aktif', '', '', '2019-04-14 05:45:14', '2019-04-14 05:45:14');
COMMIT;

-- ----------------------------
-- Table structure for berita
-- ----------------------------
DROP TABLE IF EXISTS `berita`;
CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `updater` varchar(32) NOT NULL,
  `slug_berita` varchar(255) NOT NULL,
  `judul_berita` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `status_berita` varchar(20) NOT NULL,
  `jenis_berita` varchar(20) NOT NULL,
  `keywords` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `hits` int(11) NOT NULL,
  `urutan` int(11) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `tanggal_post` datetime NOT NULL,
  `tanggal_publish` datetime NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_berita`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of berita
-- ----------------------------
BEGIN;
INSERT INTO `berita` VALUES (10, 1, 6, '', 'stukrur-organisasi', 'Stukrur Organisasi', '<p>Berikut Struktur Organisasi PORDASI 2020-2024</p>\r\n<p>Ketua Umum: <a href=\"asdasd\">Muhamad Habibi Azmi</a></p>\r\n<p>Wakil Ketua Umum 1: <a href=\"asd\">Tasik Indra</a></p>\r\n<p>Wakil Ketua Umum 2: <a href=\"Mandra\">Mandra</a></p>\r\n<p>Anggota eksekutif komite:</p>\r\n<p>-<a href=\"javawebmedia\">Japra</a></p>\r\n<p>-<a href=\"javawebmedia\">Tukiyem</a></p>\r\n<p>-<a href=\"javawebmedia\">Margonda</a></p>', 'Draft', 'Profil', '', 'unnamed.png', '', 27, 3, NULL, NULL, '2020-03-09 22:40:04', '2020-03-09 22:38:20', '2020-03-15 17:34:50');
INSERT INTO `berita` VALUES (12, 1, 7, '', 'cabang-archery', 'Cabang Archery', '<p>cabang archery</p>', 'Publish', 'Layanan', '', '9Q8O3Z3z_400x4004.jpg', '', 4, 0, NULL, NULL, '2020-03-10 16:25:02', '2020-03-10 16:24:47', '2020-03-15 19:21:23');
INSERT INTO `berita` VALUES (13, 1, 8, '', 'perlombaan-cabang-archery', 'Perlombaan cabang Archery', '<p>berita cabang archery...</p>', 'Publish', 'Berita', '', '9Q8O3Z3z_400x4005.jpg', '', 3, 0, NULL, NULL, '2020-03-10 16:28:24', '2020-03-10 16:27:51', '2020-03-15 23:32:39');
INSERT INTO `berita` VALUES (8, 1, 6, '', 'sejarah', 'Sejarah', '<p>Sejarah pordasi .....</p>', 'Publish', 'Profil', '', '9Q8O3Z3z_400x400.jpg', '', 9, 1, NULL, NULL, '2020-03-09 22:03:04', '2020-03-09 22:02:02', '2020-03-15 19:21:27');
INSERT INTO `berita` VALUES (9, 1, 6, '', 'visi-misi', 'Visi Misi', '<p>Visi Misi blabla</p>', 'Publish', 'Profil', '', '9Q8O3Z3z_400x4001.jpg', '', 6, 2, NULL, NULL, '2020-03-09 22:07:31', '2020-03-09 22:07:06', '2020-03-15 17:36:06');
COMMIT;

-- ----------------------------
-- Table structure for biografi
-- ----------------------------
DROP TABLE IF EXISTS `biografi`;
CREATE TABLE `biografi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jabatan_id` int(11) DEFAULT NULL,
  `nama` varchar(40) DEFAULT NULL,
  `deskripsi` text,
  `profil_picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biografi
-- ----------------------------
BEGIN;
INSERT INTO `biografi` VALUES (14, 1, 'Dr. Lorem Ipsum', '<div>\r\n<div>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Et vel vitae eaque. Animi totam perspiciatis omnis iure magnam adipisci, temporibus necessitatibus dolore et modi repudiandae eius vitae vero eos molestiae.</div>\r\n</div>', '61892387_146338843161454_7653082046217817755_n.jpg');
INSERT INTO `biografi` VALUES (15, 2, 'Hj. Mandra', '<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Et vel vitae eaque. Animi totam perspiciatis omnis iure magnam adipisci, temporibus necessitatibus dolore et modi repudiandae eius vitae vero eos molestiae.</p>', 'ICON.png');
COMMIT;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `jenis_client` enum('Perorangan','Perusahaan','Organisasi') NOT NULL,
  `nama` varchar(255) NOT NULL,
  `pimpinan` varchar(255) DEFAULT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `password_hint` varchar(64) DEFAULT NULL,
  `isi` text,
  `status_testimoni` varchar(20) DEFAULT NULL,
  `isi_testimoni` text,
  `gambar` varchar(200) DEFAULT NULL,
  `status_client` varchar(20) NOT NULL,
  `keywords` varchar(200) DEFAULT NULL,
  `status_baca` enum('Sudah','Belum') NOT NULL,
  `status_siswa` enum('Aktif','Calon','Lulus') NOT NULL,
  `ip_address` varchar(24) NOT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client
-- ----------------------------
BEGIN;
INSERT INTO `client` VALUES (2, 1, 'Perorangan', 'PT Java Web Media', 'Bapak Andoyo', 'Jalan Lapangan Banteng Barat No. 3-4\r\nTromol Pos 3500', '', '', 'javawebmedia@gmail.com', '8242de3f241790a591666ac9f6ad6be377c8a43f', 'wrygldyt', NULL, 'No', '', NULL, 'No', '', 'Sudah', 'Aktif', '', 'JAKARTA', '1962-01-02', '2019-04-14 08:08:26');
INSERT INTO `client` VALUES (3, 1, 'Perorangan', 'PT Indosat Sukses  Makmur', 'Eflita Meiyetriani', '', '0813 8841 0829', '', 'admin@kabupatenlestari.org', NULL, NULL, NULL, 'No', '', NULL, 'No', '', 'Sudah', 'Aktif', '', '', '1970-01-01', '2019-04-14 10:35:03');
COMMIT;

-- ----------------------------
-- Table structure for download
-- ----------------------------
DROP TABLE IF EXISTS `download`;
CREATE TABLE `download` (
  `id_download` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori_download` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul_download` varchar(200) DEFAULT NULL,
  `jenis_download` varchar(20) NOT NULL,
  `isi` text,
  `gambar` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `hits` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_download`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of download
-- ----------------------------
BEGIN;
INSERT INTO `download` VALUES (3, 2, 1, 'Paket Harga Kursus Desain dan Programming Java Web Media 2020', 'Download', '<p>Paket Harga Kursus Desain dan Programming Java Web Media 2020</p>', 'Daftar_Harga_Kursus_2020_v2.pdf', '', 0, '2020-02-13 07:50:27');
INSERT INTO `download` VALUES (4, 1, 1, 'Formulir Pendaftaran Siswa Kursus', 'Download', '<p>Formulir Pendaftaran Siswa Kursus</p>', 'FORMULIR_PENDAFTARAN_SISWA_KURSUS.pdf', '', 0, '2020-02-13 07:50:10');
INSERT INTO `download` VALUES (5, 2, 1, 'Paket Harga Kursus Statistik Java Web Media 2020', 'Download', '<p>Paket Harga Kursus Statistik Java Web Media 2020</p>', 'KURSUS_STATISTIK.pdf', '', 0, '2020-02-13 07:50:48');
COMMIT;

-- ----------------------------
-- Table structure for galeri
-- ----------------------------
DROP TABLE IF EXISTS `galeri`;
CREATE TABLE `galeri` (
  `id_galeri` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori_galeri` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul_galeri` varchar(200) DEFAULT NULL,
  `jenis_galeri` varchar(20) NOT NULL,
  `isi` text,
  `gambar` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `popup_status` enum('Publish','Draft','','') NOT NULL,
  `urutan` int(11) DEFAULT NULL,
  `status_text` enum('Ya','Tidak','','') NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_galeri`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of galeri
-- ----------------------------
BEGIN;
INSERT INTO `galeri` VALUES (4, 5, 1, 'Banner pordasi', 'Homepage', '<p>Pordasi</p>', 'website.jpg', 'http://pp.pordasi.co.id', NULL, 'Publish', 1, 'Ya', '2020-03-09 22:29:04');
INSERT INTO `galeri` VALUES (11, 4, 1, 'Kuda Autrali', 'Galeri', '<p>blablabla</p>\r\n<p>Fotographer : mr. simple</p>', 'ceklis.jpg', '', NULL, 'Publish', 0, 'Ya', '2020-03-11 14:36:52');
INSERT INTO `galeri` VALUES (12, 5, 1, 'Testing', 'Galeri', '<p>testing</p>', '61892387_146338843161454_7653082046217817755_n.jpg', 'http://localhost:8888/compro/admin/galeri/tambah', NULL, 'Publish', 2, 'Ya', '2020-03-14 00:03:46');
COMMIT;

-- ----------------------------
-- Table structure for hasil_pertandingan
-- ----------------------------
DROP TABLE IF EXISTS `hasil_pertandingan`;
CREATE TABLE `hasil_pertandingan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_urut` int(3) DEFAULT NULL,
  `nama_cabang` varchar(50) DEFAULT NULL,
  `nama_atlit` varchar(40) DEFAULT NULL,
  `nama_kuda` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hasil_pertandingan
-- ----------------------------
BEGIN;
INSERT INTO `hasil_pertandingan` VALUES (1, 1, 'Sea Games', 'Indra Tasik', 'Asep');
INSERT INTO `hasil_pertandingan` VALUES (2, 2, 'Sea Games', 'Rahmat', 'Junaidi');
INSERT INTO `hasil_pertandingan` VALUES (3, 3, 'Sea Games 1', 'Mandra 1', 'Kipl 1');
INSERT INTO `hasil_pertandingan` VALUES (6, 5, 'Cabang Archery', 'Tukimin', 'Marjuki');
COMMIT;

-- ----------------------------
-- Table structure for jabatan
-- ----------------------------
DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jabatan
-- ----------------------------
BEGIN;
INSERT INTO `jabatan` VALUES (1, 'Ketua Umum', NULL);
INSERT INTO `jabatan` VALUES (2, 'Wakil Ketua Umum', 1);
INSERT INTO `jabatan` VALUES (3, 'Anggota', 2);
COMMIT;

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `slug_kategori` varchar(255) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `urutan` int(11) DEFAULT NULL,
  `hits` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_kategori`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kategori
-- ----------------------------
BEGIN;
INSERT INTO `kategori` VALUES (8, 1, 'kegiatan', 'Kegiatan', 3, 0, '2020-03-09 22:54:40');
INSERT INTO `kategori` VALUES (6, 1, 'profile', 'Profile', 1, 0, '2020-03-09 22:01:55');
INSERT INTO `kategori` VALUES (7, 1, 'cabang', 'Cabang', 6, 0, '2020-03-09 22:45:18');
COMMIT;

-- ----------------------------
-- Table structure for kategori_download
-- ----------------------------
DROP TABLE IF EXISTS `kategori_download`;
CREATE TABLE `kategori_download` (
  `id_kategori_download` int(11) NOT NULL AUTO_INCREMENT,
  `slug_kategori_download` varchar(255) NOT NULL,
  `nama_kategori_download` varchar(255) NOT NULL,
  `urutan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kategori_download`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kategori_download
-- ----------------------------
BEGIN;
INSERT INTO `kategori_download` VALUES (1, 'formulir-pendaftaran', 'Formulir Pendaftaran', 1);
INSERT INTO `kategori_download` VALUES (2, 'promosi-java-web-media', 'Promosi Java Web Media', 2);
COMMIT;

-- ----------------------------
-- Table structure for kategori_galeri
-- ----------------------------
DROP TABLE IF EXISTS `kategori_galeri`;
CREATE TABLE `kategori_galeri` (
  `id_kategori_galeri` int(11) NOT NULL AUTO_INCREMENT,
  `slug_kategori_galeri` varchar(255) NOT NULL,
  `nama_kategori_galeri` varchar(255) NOT NULL,
  `urutan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kategori_galeri`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kategori_galeri
-- ----------------------------
BEGIN;
INSERT INTO `kategori_galeri` VALUES (4, 'kegiatan', 'Kegiatan', 4);
INSERT INTO `kategori_galeri` VALUES (5, 'banner-website', 'Banner Website', 4);
COMMIT;

-- ----------------------------
-- Table structure for kategori_staff
-- ----------------------------
DROP TABLE IF EXISTS `kategori_staff`;
CREATE TABLE `kategori_staff` (
  `id_kategori_staff` int(11) NOT NULL AUTO_INCREMENT,
  `slug_kategori_staff` varchar(255) NOT NULL,
  `nama_kategori_staff` varchar(255) NOT NULL,
  `urutan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kategori_staff`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kategori_staff
-- ----------------------------
BEGIN;
INSERT INTO `kategori_staff` VALUES (1, 'pejabat-eselon-1', 'Pejabat Eselon 1', 1);
INSERT INTO `kategori_staff` VALUES (2, 'pejabat-struktural', 'Pejabat Struktural', 2);
COMMIT;

-- ----------------------------
-- Table structure for konfigurasi
-- ----------------------------
DROP TABLE IF EXISTS `konfigurasi`;
CREATE TABLE `konfigurasi` (
  `id_konfigurasi` int(11) NOT NULL AUTO_INCREMENT,
  `namaweb` varchar(200) NOT NULL,
  `singkatan` varchar(255) DEFAULT NULL,
  `tagline` varchar(200) DEFAULT NULL,
  `tentang` text,
  `deskripsi` text,
  `website` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_cadangan` varchar(255) DEFAULT NULL,
  `alamat` text,
  `telepon` varchar(50) DEFAULT NULL,
  `hp` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `footer` varchar(255) DEFAULT NULL,
  `keywords` varchar(400) DEFAULT NULL,
  `metatext` text,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `google_plus` varchar(255) DEFAULT NULL,
  `google_map` text,
  `judul_1` varchar(200) DEFAULT NULL,
  `pesan_1` varchar(200) DEFAULT NULL,
  `judul_2` varchar(200) DEFAULT NULL,
  `pesan_2` varchar(200) DEFAULT NULL,
  `judul_3` varchar(200) DEFAULT NULL,
  `pesan_3` varchar(200) DEFAULT NULL,
  `judul_4` varchar(200) DEFAULT NULL,
  `pesan_4` varchar(200) DEFAULT NULL,
  `judul_5` varchar(200) DEFAULT NULL,
  `pesan_5` varchar(200) NOT NULL,
  `judul_6` varchar(200) DEFAULT NULL,
  `pesan_6` varchar(200) NOT NULL,
  `isi_1` varchar(500) DEFAULT NULL,
  `isi_2` varchar(500) DEFAULT NULL,
  `isi_3` varchar(500) DEFAULT NULL,
  `isi_4` varchar(500) DEFAULT NULL,
  `isi_5` varchar(500) DEFAULT NULL,
  `isi_6` varchar(500) DEFAULT NULL,
  `link_1` varchar(255) DEFAULT NULL,
  `link_2` varchar(255) DEFAULT NULL,
  `link_3` varchar(255) DEFAULT NULL,
  `link_4` varchar(255) DEFAULT NULL,
  `link_5` varchar(255) DEFAULT NULL,
  `link_6` varchar(255) DEFAULT NULL,
  `javawebmedia` text,
  `gambar` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `rekening` text,
  `gambar_berita` varchar(255) DEFAULT NULL,
  `status_form_booking` enum('Aktif','Nonaktif') NOT NULL,
  `max_room_booking` int(11) DEFAULT NULL,
  `nama_direktur` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `stempel_tanda_tangan` varchar(255) DEFAULT NULL,
  `protocol` varchar(255) NOT NULL,
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_timeout` int(11) NOT NULL,
  `smtp_user` varchar(255) NOT NULL,
  `smtp_pass` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_konfigurasi`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of konfigurasi
-- ----------------------------
BEGIN;
INSERT INTO `konfigurasi` VALUES (1, 'PORDASI', 'Persatuan Olahraga Berkuda Seluruh Indonesia', 'PP PORDASI', '<p>PORDASI adalah persatuan olahraga berkuda seluruh indonesia</p>', 'Hotel Bumi Wiyata is a three stars hotel that located on Jl. Margonda Raya Depok 16423 West Java.Â \r\n\r\nHotel Bumi Wiyata has 13 ha areas and 91 Rooms which divided into six types of room; Standard Room, Superior Room, Deluxe Superior Room, Suite Room, Deluxe Suite Room & Executive Room.\r\n\r\nHotel Bumi Wiyata is the perfect choice for your business activity, gathering, wedding, outbound and family. With the concept of the greatest hotel for recreational meeting surrounding with traditional nature, various facilities and warm hospitality will makes all your event become a memorable one.', 'http://pp.pordasi.co.id', 'offc@pordasi.co.id', 'bmwiyata@hotelbumiwiyata.com', '<p><strong>PORDASI</strong><br />Gedung Pulomas Jaya, RT.3/RW.13, Kayu Putih, Kec. Pulo Gadung, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13210</p>', '111', '11', '111', '9Q8O3Z3z_400x4002.jpg', '9Q8O3Z3z_400x4003.jpg', 'footer1.png', '\r\n', '', 'https://www.facebook.com/pordasi', 'http://twitter.com/pordasi', 'https://instagram.com/pordasi', 'https://www.youtube.com/channel/UCmm6mFZXYQ3ZylUMa0Tmc2Q', '', 'Bersedekah untuk anak yatim', 'fa-money', 'Pengasuh yang santun', 'fa-thumbs-up', 'Jadwal Flexibel', 'fa-adn', 'Menjaga Amanah', 'fa-check-square-o', 'Tempat belajar nyaman', 'fa-home', 'Online service', 'fa-laptop', 'Berbagi kebahagiaan dengan anak yatim adalah perintah Allah dan rasul', 'Pengasuh yang baik dan santun serta memberikan teladan yang baik bagi anak asuh', 'Bagi Anda siswa yang ingin belajar, kami menerapkan jadwal flexibel', 'Kami senantiasa menjaga amanah yang diberikan kepada donatur agar sampai di tangan yang berhak.', 'Kami menyediakan tempat belajar yang nyaman dan menyenangkan', 'Website kamu selalu uptodate, Anda bisa mengunduh apa yang dipelajari', '', '', '', '', '', '', '<p>Berawal dari keinginan ibunda Hj.Masah Muhari diakhir hidupnya untuk mewakaan sebagian hartanya dijalan Allah, gayungpun bersambut pada bulan Mei 2011 saat kami akan melaksanakan ibadah umrah, Seorang rekan kami sesama Jamaah bernama ustadzah Hj. Zainur Fahmid memberikan informasi Tentang Anggota yang hendak mewakaan sebidang tanahnya di wilayah Beji Timur. Kami pun memanjatkan doa di kota suci dengan penuh rasa harap pertolongan Allah untuk menunjukan jalan terbaik-Nya, maka sepulang umroh kami mengadakan pertemuan di kediaman Ibu Dra Hj Ratna Mardjanah untuk membicarakan visi misi kami dalam wakaf tersebut dan sepakat untuk mendirikan Istana Yatim Riyadhul Jannah ini.</p>\r\n<p>Nama Riyadhul Jannah Sendiri diambil dari nama pengelola wakaf (H. Ahmad Riyadh Muchtar, Lc) dan pemberi wakaf (Dra Hj Ratna Mardjanah). Istana Yatim Riyadhul Jannah hadir untuk melayani dan memfasilitasi segala kebutuhan anak yatim, terutama pendidikan agama, akhlak dan kehidupan yang layak untuk bekal masa depan mereka yang cerah agar bisa memberi manfaat bagi umat. Harapan kami semoga dengan membangunkan istana untuk anak yatim, maka Allah akan berikan istana-Nya di surga kelak dan kita termasuk manusia yang bisa memberika manfaat bagi sesama sebagaimana sabda Rasulullah SAW yang artinya:&nbsp;</p>\r\n<p>&ldquo;Sebaik-baik manusia adalah yang paling bermanfaat bagi manusia lainnya&rdquo;&nbsp;</p>\r\n<p>erimakasih atas segala bentuk bantuan yang dipercayakan kepada kami baik secara materi, tenaga dan kiran serta doa para muhsinin dan muhsinat Istana Yatim Riyadhul Jannah selama ini, mulai dari rencana pendirian hingga berkembang seperti saat ini. Semoga segala amal menjadi shadaqah jariyah disisi-Nya.&nbsp;</p>\r\n<p>&nbsp;</p>', 'istana-yatim.png', 'fsH_KhUWfho', '<table id=\"dataTables-example\" class=\"table table-bordered\" width=\"100%\">\r\n<thead>\r\n<tr>\r\n<th tabindex=\"0\" colspan=\"1\" rowspan=\"1\" width=\"19%\">Nama Bank</th>\r\n<th tabindex=\"0\" colspan=\"1\" rowspan=\"1\" width=\"21%\">Nomor Rekening</th>\r\n<th tabindex=\"0\" colspan=\"1\" rowspan=\"1\" width=\"7%\">Atas nama</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>BCA KCP Margo City</td>\r\n<td>4212548204</td>\r\n<td>Andoyo</td>\r\n</tr>\r\n<tr>\r\n<td>Bank Mandiri KCP Universitas Indonesia</td>\r\n<td>1570001807768</td>\r\n<td>Eflita Meiyetriani</td>\r\n</tr>\r\n<tr>\r\n<td>Bank BNI Syariah Kantor Cabang Jakarta Selatan</td>\r\n<td>0105301001</td>\r\n<td>Eflita Meiyetriani</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'balairung-budiutomo-01.jpg', 'Aktif', 3, 'Sigit Yuwono Wachid', 'Direktur', 'tanda-tangan-nba.png', 'smtp', 'ssl://mail.websitemu.com', 465, 7, 'contact@websitemu.com', 'muhammad', 0, '2020-03-09 22:25:38');
COMMIT;

-- ----------------------------
-- Table structure for kunjungan
-- ----------------------------
DROP TABLE IF EXISTS `kunjungan`;
CREATE TABLE `kunjungan` (
  `id_kunjungan` int(11) NOT NULL AUTO_INCREMENT,
  `alamat` varchar(255) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `hari` date DEFAULT NULL,
  `waktu` datetime NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_kunjungan`)
) ENGINE=MyISAM AUTO_INCREMENT=1045 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kunjungan
-- ----------------------------
BEGIN;
INSERT INTO `kunjungan` VALUES (1, 'http://localhost/bkkbn/masuk', '127.0.0.1', '2019-02-23', '2019-02-23 12:38:06', '2019-02-23 12:38:06');
INSERT INTO `kunjungan` VALUES (2, 'http://localhost/bkkbn/masuk', '127.0.0.1', '2019-02-23', '2019-02-23 14:06:56', '2019-02-23 14:06:56');
INSERT INTO `kunjungan` VALUES (3, 'http://localhost/bkkbn/index.php', '127.0.0.1', '2019-02-23', '2019-02-23 14:15:12', '2019-02-23 14:15:12');
INSERT INTO `kunjungan` VALUES (4, 'http://localhost/bkkbn/peneliti/anggota/pendidikan/1', '127.0.0.1', '2019-02-23', '2019-02-23 14:38:24', '2019-02-23 14:38:24');
INSERT INTO `kunjungan` VALUES (5, 'http://localhost/bkkbn/masuk', '127.0.0.1', '2019-02-24', '2019-02-24 14:10:08', '2019-02-24 14:10:08');
INSERT INTO `kunjungan` VALUES (6, 'http://localhost/bkkbn/masuk', '127.0.0.1', '2019-02-24', '2019-02-24 16:56:03', '2019-02-24 16:56:03');
INSERT INTO `kunjungan` VALUES (7, 'http://localhost/bkkbn/masuk', '127.0.0.1', '2019-02-24', '2019-02-24 20:00:37', '2019-02-24 20:00:37');
INSERT INTO `kunjungan` VALUES (8, 'http://localhost/bkkbn/masuk', '::1', '2019-02-24', '2019-02-24 21:18:38', '2019-02-24 21:18:38');
INSERT INTO `kunjungan` VALUES (9, 'http://localhost/bkkbn/masuk', '::1', '2019-02-24', '2019-02-24 21:41:37', '2019-02-24 21:41:37');
INSERT INTO `kunjungan` VALUES (10, 'http://localhost/bkkbn/masuk', '::1', '2019-02-26', '2019-02-26 10:53:44', '2019-02-26 10:53:44');
INSERT INTO `kunjungan` VALUES (11, 'http://localhost/bkkbn/masuk', '::1', '2019-02-26', '2019-02-26 10:58:07', '2019-02-26 10:58:07');
INSERT INTO `kunjungan` VALUES (12, 'http://localhost/bkkbn/masuk', '::1', '2019-02-26', '2019-02-26 13:06:36', '2019-02-26 13:06:36');
INSERT INTO `kunjungan` VALUES (13, 'http://localhost/bkkbn/index.php', '::1', '2019-02-26', '2019-02-26 14:52:03', '2019-02-26 14:52:03');
INSERT INTO `kunjungan` VALUES (14, 'http://localhost/bkkbn/masuk', '::1', '2019-02-27', '2019-02-27 18:48:15', '2019-02-27 18:48:15');
INSERT INTO `kunjungan` VALUES (15, 'http://localhost/bkkbn/masuk', '::1', '2019-02-28', '2019-02-28 20:30:53', '2019-02-28 20:30:53');
INSERT INTO `kunjungan` VALUES (16, 'http://localhost/bkkbn/masuk', '::1', '2019-02-28', '2019-02-28 20:34:12', '2019-02-28 20:34:12');
INSERT INTO `kunjungan` VALUES (17, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 10:29:12', '2019-03-01 10:29:12');
INSERT INTO `kunjungan` VALUES (18, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-01', '2019-03-01 10:35:23', '2019-03-01 10:35:23');
INSERT INTO `kunjungan` VALUES (19, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 10:36:32', '2019-03-01 10:36:32');
INSERT INTO `kunjungan` VALUES (20, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-01', '2019-03-01 10:36:49', '2019-03-01 10:36:49');
INSERT INTO `kunjungan` VALUES (21, 'http://localhost/bkkbn/masuk', '::1', '2019-03-01', '2019-03-01 10:37:57', '2019-03-01 10:37:57');
INSERT INTO `kunjungan` VALUES (22, 'http://localhost/bkkbn/masuk', '::1', '2019-03-01', '2019-03-01 10:39:31', '2019-03-01 10:39:31');
INSERT INTO `kunjungan` VALUES (23, 'http://localhost/bkkbn/masuk', '::1', '2019-03-01', '2019-03-01 10:54:13', '2019-03-01 10:54:13');
INSERT INTO `kunjungan` VALUES (24, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 10:57:41', '2019-03-01 10:57:41');
INSERT INTO `kunjungan` VALUES (25, 'http://localhost/bkkbn/kontak', '::1', '2019-03-01', '2019-03-01 11:04:07', '2019-03-01 11:04:07');
INSERT INTO `kunjungan` VALUES (26, 'http://localhost/bkkbn/kontak', '::1', '2019-03-01', '2019-03-01 11:04:57', '2019-03-01 11:04:57');
INSERT INTO `kunjungan` VALUES (27, 'http://localhost/bkkbn/masuk', '::1', '2019-03-01', '2019-03-01 11:05:07', '2019-03-01 11:05:07');
INSERT INTO `kunjungan` VALUES (28, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:05:14', '2019-03-01 11:05:14');
INSERT INTO `kunjungan` VALUES (29, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:07:10', '2019-03-01 11:07:10');
INSERT INTO `kunjungan` VALUES (30, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:07:53', '2019-03-01 11:07:53');
INSERT INTO `kunjungan` VALUES (31, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:10:09', '2019-03-01 11:10:09');
INSERT INTO `kunjungan` VALUES (32, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:10:23', '2019-03-01 11:10:23');
INSERT INTO `kunjungan` VALUES (33, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:11:48', '2019-03-01 11:11:48');
INSERT INTO `kunjungan` VALUES (34, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:12:17', '2019-03-01 11:12:17');
INSERT INTO `kunjungan` VALUES (35, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:12:20', '2019-03-01 11:12:20');
INSERT INTO `kunjungan` VALUES (36, 'http://localhost/bkkbn/masuk', '::1', '2019-03-01', '2019-03-01 11:12:29', '2019-03-01 11:12:29');
INSERT INTO `kunjungan` VALUES (37, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:13:15', '2019-03-01 11:13:15');
INSERT INTO `kunjungan` VALUES (38, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:14:32', '2019-03-01 11:14:32');
INSERT INTO `kunjungan` VALUES (39, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:16:15', '2019-03-01 11:16:15');
INSERT INTO `kunjungan` VALUES (40, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:20:09', '2019-03-01 11:20:09');
INSERT INTO `kunjungan` VALUES (41, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:21:19', '2019-03-01 11:21:19');
INSERT INTO `kunjungan` VALUES (42, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:22:44', '2019-03-01 11:22:44');
INSERT INTO `kunjungan` VALUES (43, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:23:08', '2019-03-01 11:23:08');
INSERT INTO `kunjungan` VALUES (44, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:23:44', '2019-03-01 11:23:44');
INSERT INTO `kunjungan` VALUES (45, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:23:55', '2019-03-01 11:23:55');
INSERT INTO `kunjungan` VALUES (46, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:24:06', '2019-03-01 11:24:06');
INSERT INTO `kunjungan` VALUES (47, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:24:32', '2019-03-01 11:24:32');
INSERT INTO `kunjungan` VALUES (48, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:25:00', '2019-03-01 11:25:00');
INSERT INTO `kunjungan` VALUES (49, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:25:18', '2019-03-01 11:25:18');
INSERT INTO `kunjungan` VALUES (50, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:25:33', '2019-03-01 11:25:33');
INSERT INTO `kunjungan` VALUES (51, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:26:07', '2019-03-01 11:26:07');
INSERT INTO `kunjungan` VALUES (52, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:26:58', '2019-03-01 11:26:58');
INSERT INTO `kunjungan` VALUES (53, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:27:59', '2019-03-01 11:27:59');
INSERT INTO `kunjungan` VALUES (54, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:28:21', '2019-03-01 11:28:21');
INSERT INTO `kunjungan` VALUES (55, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:29:18', '2019-03-01 11:29:18');
INSERT INTO `kunjungan` VALUES (56, 'http://localhost/bkkbn/berita/profil/profil-kami', '::1', '2019-03-01', '2019-03-01 11:34:29', '2019-03-01 11:34:29');
INSERT INTO `kunjungan` VALUES (57, 'http://localhost/bkkbn/berita/profil/profil-kami', '::1', '2019-03-01', '2019-03-01 11:34:33', '2019-03-01 11:34:33');
INSERT INTO `kunjungan` VALUES (58, 'http://localhost/bkkbn/berita/profil/profil-kami', '::1', '2019-03-01', '2019-03-01 11:35:51', '2019-03-01 11:35:51');
INSERT INTO `kunjungan` VALUES (59, 'http://localhost/bkkbn/berita/profil/profil-kami', '::1', '2019-03-01', '2019-03-01 11:35:53', '2019-03-01 11:35:53');
INSERT INTO `kunjungan` VALUES (60, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:36:07', '2019-03-01 11:36:07');
INSERT INTO `kunjungan` VALUES (61, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:38:01', '2019-03-01 11:38:01');
INSERT INTO `kunjungan` VALUES (62, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:40:14', '2019-03-01 11:40:14');
INSERT INTO `kunjungan` VALUES (63, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:40:46', '2019-03-01 11:40:46');
INSERT INTO `kunjungan` VALUES (64, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:41:14', '2019-03-01 11:41:14');
INSERT INTO `kunjungan` VALUES (65, 'http://localhost/bkkbn/gelombang', '::1', '2019-03-01', '2019-03-01 11:41:57', '2019-03-01 11:41:57');
INSERT INTO `kunjungan` VALUES (66, 'http://localhost/bkkbn/gelombang', '::1', '2019-03-01', '2019-03-01 11:42:16', '2019-03-01 11:42:16');
INSERT INTO `kunjungan` VALUES (67, 'http://localhost/bkkbn/gelombang', '::1', '2019-03-01', '2019-03-01 11:43:34', '2019-03-01 11:43:34');
INSERT INTO `kunjungan` VALUES (68, 'http://localhost/bkkbn/gelombang', '::1', '2019-03-01', '2019-03-01 11:46:03', '2019-03-01 11:46:03');
INSERT INTO `kunjungan` VALUES (69, 'http://localhost/bkkbn/gelombang', '::1', '2019-03-01', '2019-03-01 11:46:45', '2019-03-01 11:46:45');
INSERT INTO `kunjungan` VALUES (70, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:46:53', '2019-03-01 11:46:53');
INSERT INTO `kunjungan` VALUES (71, 'http://localhost/bkkbn/masuk', '::1', '2019-03-01', '2019-03-01 11:49:23', '2019-03-01 11:49:23');
INSERT INTO `kunjungan` VALUES (72, 'http://localhost/bkkbn/masuk', '::1', '2019-03-01', '2019-03-01 11:50:38', '2019-03-01 11:50:38');
INSERT INTO `kunjungan` VALUES (73, 'http://localhost/bkkbn/masuk', '::1', '2019-03-01', '2019-03-01 11:50:58', '2019-03-01 11:50:58');
INSERT INTO `kunjungan` VALUES (74, 'http://localhost/bkkbn/masuk', '::1', '2019-03-01', '2019-03-01 11:51:25', '2019-03-01 11:51:25');
INSERT INTO `kunjungan` VALUES (75, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:51:40', '2019-03-01 11:51:40');
INSERT INTO `kunjungan` VALUES (76, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:53:15', '2019-03-01 11:53:15');
INSERT INTO `kunjungan` VALUES (77, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:53:37', '2019-03-01 11:53:37');
INSERT INTO `kunjungan` VALUES (78, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:54:02', '2019-03-01 11:54:02');
INSERT INTO `kunjungan` VALUES (79, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:55:03', '2019-03-01 11:55:03');
INSERT INTO `kunjungan` VALUES (80, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:56:34', '2019-03-01 11:56:34');
INSERT INTO `kunjungan` VALUES (81, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 11:57:05', '2019-03-01 11:57:05');
INSERT INTO `kunjungan` VALUES (82, 'http://localhost/bkkbn/berita/profil/profil-kami', '::1', '2019-03-01', '2019-03-01 14:04:57', '2019-03-01 14:04:57');
INSERT INTO `kunjungan` VALUES (83, 'http://localhost/bkkbn/download', '::1', '2019-03-01', '2019-03-01 14:05:19', '2019-03-01 14:05:19');
INSERT INTO `kunjungan` VALUES (84, 'http://localhost/bkkbn/galeri', '::1', '2019-03-01', '2019-03-01 14:05:30', '2019-03-01 14:05:30');
INSERT INTO `kunjungan` VALUES (85, 'http://localhost/bkkbn/video', '::1', '2019-03-01', '2019-03-01 14:05:42', '2019-03-01 14:05:42');
INSERT INTO `kunjungan` VALUES (86, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 14:17:12', '2019-03-01 14:17:12');
INSERT INTO `kunjungan` VALUES (87, 'http://localhost/bkkbn/berita/profil/profil-kami', '::1', '2019-03-01', '2019-03-01 14:28:50', '2019-03-01 14:28:50');
INSERT INTO `kunjungan` VALUES (88, 'http://localhost/bkkbn/berita/profil/profil-kami', '::1', '2019-03-01', '2019-03-01 14:31:05', '2019-03-01 14:31:05');
INSERT INTO `kunjungan` VALUES (89, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 14:43:34', '2019-03-01 14:43:34');
INSERT INTO `kunjungan` VALUES (90, 'http://localhost/bkkbn/index.php', '::1', '2019-03-01', '2019-03-01 15:46:17', '2019-03-01 15:46:17');
INSERT INTO `kunjungan` VALUES (91, 'http://localhost/bkkbn/index.php', '::1', '2019-03-02', '2019-03-02 13:53:37', '2019-03-02 13:53:37');
INSERT INTO `kunjungan` VALUES (92, 'http://localhost/bkkbn/index.php', '::1', '2019-03-02', '2019-03-02 14:21:18', '2019-03-02 14:21:18');
INSERT INTO `kunjungan` VALUES (93, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 06:02:48', '2019-03-04 06:02:48');
INSERT INTO `kunjungan` VALUES (94, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 07:38:09', '2019-03-04 07:38:09');
INSERT INTO `kunjungan` VALUES (95, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 07:41:19', '2019-03-04 07:41:19');
INSERT INTO `kunjungan` VALUES (96, 'http://localhost/bkkbn/berita/profil/profil-kami', '::1', '2019-03-04', '2019-03-04 07:41:40', '2019-03-04 07:41:40');
INSERT INTO `kunjungan` VALUES (97, 'http://localhost/bkkbn/berita/profil/profil-kami', '::1', '2019-03-04', '2019-03-04 07:42:10', '2019-03-04 07:42:10');
INSERT INTO `kunjungan` VALUES (98, 'http://localhost/bkkbn/download', '::1', '2019-03-04', '2019-03-04 07:42:29', '2019-03-04 07:42:29');
INSERT INTO `kunjungan` VALUES (99, 'http://localhost/bkkbn/download', '::1', '2019-03-04', '2019-03-04 07:42:43', '2019-03-04 07:42:43');
INSERT INTO `kunjungan` VALUES (100, 'http://localhost/bkkbn/galeri', '::1', '2019-03-04', '2019-03-04 07:42:52', '2019-03-04 07:42:52');
INSERT INTO `kunjungan` VALUES (101, 'http://localhost/bkkbn/video', '::1', '2019-03-04', '2019-03-04 07:42:59', '2019-03-04 07:42:59');
INSERT INTO `kunjungan` VALUES (102, 'http://localhost/bkkbn/video', '::1', '2019-03-04', '2019-03-04 07:44:00', '2019-03-04 07:44:00');
INSERT INTO `kunjungan` VALUES (103, 'http://localhost/bkkbn/video/read/5', '::1', '2019-03-04', '2019-03-04 07:44:04', '2019-03-04 07:44:04');
INSERT INTO `kunjungan` VALUES (104, 'http://localhost/bkkbn/video/read/5', '::1', '2019-03-04', '2019-03-04 07:44:51', '2019-03-04 07:44:51');
INSERT INTO `kunjungan` VALUES (105, 'http://localhost/bkkbn/video/read/5', '::1', '2019-03-04', '2019-03-04 07:45:06', '2019-03-04 07:45:06');
INSERT INTO `kunjungan` VALUES (106, 'http://localhost/bkkbn/video/read/5', '::1', '2019-03-04', '2019-03-04 07:45:26', '2019-03-04 07:45:26');
INSERT INTO `kunjungan` VALUES (107, 'http://localhost/bkkbn/berita', '::1', '2019-03-04', '2019-03-04 07:45:36', '2019-03-04 07:45:36');
INSERT INTO `kunjungan` VALUES (108, 'http://localhost/bkkbn/galeri', '::1', '2019-03-04', '2019-03-04 07:45:44', '2019-03-04 07:45:44');
INSERT INTO `kunjungan` VALUES (109, 'http://localhost/bkkbn/kontak', '::1', '2019-03-04', '2019-03-04 07:45:49', '2019-03-04 07:45:49');
INSERT INTO `kunjungan` VALUES (110, 'http://localhost/bkkbn/kontak', '::1', '2019-03-04', '2019-03-04 07:46:30', '2019-03-04 07:46:30');
INSERT INTO `kunjungan` VALUES (111, 'http://localhost/bkkbn/kontak', '::1', '2019-03-04', '2019-03-04 07:46:44', '2019-03-04 07:46:44');
INSERT INTO `kunjungan` VALUES (112, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 07:53:11', '2019-03-04 07:53:11');
INSERT INTO `kunjungan` VALUES (113, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 07:53:55', '2019-03-04 07:53:55');
INSERT INTO `kunjungan` VALUES (114, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 07:54:27', '2019-03-04 07:54:27');
INSERT INTO `kunjungan` VALUES (115, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 07:55:22', '2019-03-04 07:55:22');
INSERT INTO `kunjungan` VALUES (116, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 08:24:22', '2019-03-04 08:24:22');
INSERT INTO `kunjungan` VALUES (117, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 08:29:55', '2019-03-04 08:29:55');
INSERT INTO `kunjungan` VALUES (118, 'http://localhost/bkkbn/berita/read/bkkbn-adakan-simposium-nasional-sebagai-upaya-hadapi-revolusi-industri-40', '::1', '2019-03-04', '2019-03-04 08:30:43', '2019-03-04 08:30:43');
INSERT INTO `kunjungan` VALUES (119, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 08:31:35', '2019-03-04 08:31:35');
INSERT INTO `kunjungan` VALUES (120, 'http://localhost/bkkbn/berita/kategori/kegiatan', '::1', '2019-03-04', '2019-03-04 08:31:40', '2019-03-04 08:31:40');
INSERT INTO `kunjungan` VALUES (121, 'http://localhost/bkkbn/berita/read/bkkbn-adakan-simposium-nasional-sebagai-upaya-hadapi-revolusi-industri-40', '::1', '2019-03-04', '2019-03-04 08:31:45', '2019-03-04 08:31:45');
INSERT INTO `kunjungan` VALUES (122, 'http://localhost/bkkbn/masuk', '::1', '2019-03-04', '2019-03-04 08:32:15', '2019-03-04 08:32:15');
INSERT INTO `kunjungan` VALUES (123, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-04', '2019-03-04 08:34:08', '2019-03-04 08:34:08');
INSERT INTO `kunjungan` VALUES (124, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-04', '2019-03-04 08:34:50', '2019-03-04 08:34:50');
INSERT INTO `kunjungan` VALUES (125, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-04', '2019-03-04 08:35:16', '2019-03-04 08:35:16');
INSERT INTO `kunjungan` VALUES (126, 'http://localhost/bkkbn/berita', '::1', '2019-03-04', '2019-03-04 08:35:29', '2019-03-04 08:35:29');
INSERT INTO `kunjungan` VALUES (127, 'http://localhost/bkkbn/berita/profil/profil-kami', '::1', '2019-03-04', '2019-03-04 08:36:00', '2019-03-04 08:36:00');
INSERT INTO `kunjungan` VALUES (128, 'http://localhost/bkkbn/kontak', '::1', '2019-03-04', '2019-03-04 08:36:38', '2019-03-04 08:36:38');
INSERT INTO `kunjungan` VALUES (129, 'http://localhost/bkkbn/kontak', '::1', '2019-03-04', '2019-03-04 08:37:26', '2019-03-04 08:37:26');
INSERT INTO `kunjungan` VALUES (130, 'http://localhost/bkkbn/kontak', '::1', '2019-03-04', '2019-03-04 08:37:41', '2019-03-04 08:37:41');
INSERT INTO `kunjungan` VALUES (131, 'http://localhost/bkkbn/kontak', '::1', '2019-03-04', '2019-03-04 08:37:57', '2019-03-04 08:37:57');
INSERT INTO `kunjungan` VALUES (132, 'http://localhost/bkkbn/kontak', '::1', '2019-03-04', '2019-03-04 08:38:16', '2019-03-04 08:38:16');
INSERT INTO `kunjungan` VALUES (133, 'http://localhost/bkkbn/kontak', '::1', '2019-03-04', '2019-03-04 08:38:27', '2019-03-04 08:38:27');
INSERT INTO `kunjungan` VALUES (134, 'http://localhost/bkkbn/kontak', '::1', '2019-03-04', '2019-03-04 08:39:17', '2019-03-04 08:39:17');
INSERT INTO `kunjungan` VALUES (135, 'http://localhost/bkkbn/kontak', '::1', '2019-03-04', '2019-03-04 08:39:30', '2019-03-04 08:39:30');
INSERT INTO `kunjungan` VALUES (136, 'http://localhost/bkkbn/kontak', '::1', '2019-03-04', '2019-03-04 08:39:38', '2019-03-04 08:39:38');
INSERT INTO `kunjungan` VALUES (137, 'http://localhost/bkkbn/kontak', '::1', '2019-03-04', '2019-03-04 08:40:16', '2019-03-04 08:40:16');
INSERT INTO `kunjungan` VALUES (138, 'http://localhost/bkkbn/kontak', '::1', '2019-03-04', '2019-03-04 08:40:33', '2019-03-04 08:40:33');
INSERT INTO `kunjungan` VALUES (139, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 08:40:38', '2019-03-04 08:40:38');
INSERT INTO `kunjungan` VALUES (140, 'http://localhost/bkkbn/masuk', '::1', '2019-03-04', '2019-03-04 08:42:42', '2019-03-04 08:42:42');
INSERT INTO `kunjungan` VALUES (141, 'http://localhost/bkkbn/masuk', '::1', '2019-03-04', '2019-03-04 10:43:14', '2019-03-04 10:43:14');
INSERT INTO `kunjungan` VALUES (142, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 11:29:05', '2019-03-04 11:29:05');
INSERT INTO `kunjungan` VALUES (143, 'http://localhost/bkkbn/masuk', '::1', '2019-03-04', '2019-03-04 11:29:10', '2019-03-04 11:29:10');
INSERT INTO `kunjungan` VALUES (144, 'http://localhost/bkkbn/masuk', '::1', '2019-03-04', '2019-03-04 11:30:34', '2019-03-04 11:30:34');
INSERT INTO `kunjungan` VALUES (145, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 12:57:30', '2019-03-04 12:57:30');
INSERT INTO `kunjungan` VALUES (146, 'http://localhost/bkkbn/masuk', '::1', '2019-03-04', '2019-03-04 12:57:37', '2019-03-04 12:57:37');
INSERT INTO `kunjungan` VALUES (147, 'http://localhost/bkkbn/masuk', '::1', '2019-03-04', '2019-03-04 12:58:51', '2019-03-04 12:58:51');
INSERT INTO `kunjungan` VALUES (148, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 12:59:13', '2019-03-04 12:59:13');
INSERT INTO `kunjungan` VALUES (149, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 13:01:37', '2019-03-04 13:01:37');
INSERT INTO `kunjungan` VALUES (150, 'http://localhost/bkkbn/penelitian/tema/kesehatan-reproduksi', '::1', '2019-03-04', '2019-03-04 13:03:32', '2019-03-04 13:03:32');
INSERT INTO `kunjungan` VALUES (151, 'http://localhost/bkkbn/penelitian/tema/kesehatan-reproduksi', '::1', '2019-03-04', '2019-03-04 13:04:11', '2019-03-04 13:04:11');
INSERT INTO `kunjungan` VALUES (152, 'http://localhost/bkkbn/penelitian/tema/kesehatan-reproduksi', '::1', '2019-03-04', '2019-03-04 13:04:46', '2019-03-04 13:04:46');
INSERT INTO `kunjungan` VALUES (153, 'http://localhost/bkkbn/penelitian/tema/kesehatan-reproduksi', '::1', '2019-03-04', '2019-03-04 13:05:03', '2019-03-04 13:05:03');
INSERT INTO `kunjungan` VALUES (154, 'http://localhost/bkkbn/penelitian/tema/kesehatan-reproduksi', '::1', '2019-03-04', '2019-03-04 13:05:16', '2019-03-04 13:05:16');
INSERT INTO `kunjungan` VALUES (155, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 13:05:23', '2019-03-04 13:05:23');
INSERT INTO `kunjungan` VALUES (156, 'http://localhost/bkkbn/koss', '::1', '2019-03-04', '2019-03-04 13:05:31', '2019-03-04 13:05:31');
INSERT INTO `kunjungan` VALUES (157, 'http://localhost/bkkbn/koss', '::1', '2019-03-04', '2019-03-04 13:05:52', '2019-03-04 13:05:52');
INSERT INTO `kunjungan` VALUES (158, 'http://localhost/bkkbn/koss', '::1', '2019-03-04', '2019-03-04 13:06:10', '2019-03-04 13:06:10');
INSERT INTO `kunjungan` VALUES (159, 'http://localhost/bkkbn/download', '::1', '2019-03-04', '2019-03-04 13:06:29', '2019-03-04 13:06:29');
INSERT INTO `kunjungan` VALUES (160, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:28:48', '2019-03-04 14:28:48');
INSERT INTO `kunjungan` VALUES (161, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:31:21', '2019-03-04 14:31:21');
INSERT INTO `kunjungan` VALUES (162, 'http://localhost/bkkbn/berita/read/bkkbn-adakan-simposium-nasional-sebagai-upaya-hadapi-revolusi-industri-40', '::1', '2019-03-04', '2019-03-04 14:31:33', '2019-03-04 14:31:33');
INSERT INTO `kunjungan` VALUES (163, 'http://localhost/bkkbn/berita/read/bkkbn-adakan-simposium-nasional-sebagai-upaya-hadapi-revolusi-industri-40', '::1', '2019-03-04', '2019-03-04 14:32:20', '2019-03-04 14:32:20');
INSERT INTO `kunjungan` VALUES (164, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:32:45', '2019-03-04 14:32:45');
INSERT INTO `kunjungan` VALUES (165, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:32:52', '2019-03-04 14:32:52');
INSERT INTO `kunjungan` VALUES (166, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:33:05', '2019-03-04 14:33:05');
INSERT INTO `kunjungan` VALUES (167, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:33:39', '2019-03-04 14:33:39');
INSERT INTO `kunjungan` VALUES (168, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:33:54', '2019-03-04 14:33:54');
INSERT INTO `kunjungan` VALUES (169, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:34:27', '2019-03-04 14:34:27');
INSERT INTO `kunjungan` VALUES (170, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:35:49', '2019-03-04 14:35:49');
INSERT INTO `kunjungan` VALUES (171, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:36:05', '2019-03-04 14:36:05');
INSERT INTO `kunjungan` VALUES (172, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:37:42', '2019-03-04 14:37:42');
INSERT INTO `kunjungan` VALUES (173, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-04', '2019-03-04 14:37:53', '2019-03-04 14:37:53');
INSERT INTO `kunjungan` VALUES (174, 'http://localhost/bkkbn/masuk', '::1', '2019-03-04', '2019-03-04 14:38:10', '2019-03-04 14:38:10');
INSERT INTO `kunjungan` VALUES (175, 'http://localhost/bkkbn/masuk', '::1', '2019-03-04', '2019-03-04 14:43:00', '2019-03-04 14:43:00');
INSERT INTO `kunjungan` VALUES (176, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-04', '2019-03-04 14:44:17', '2019-03-04 14:44:17');
INSERT INTO `kunjungan` VALUES (177, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-04', '2019-03-04 14:45:19', '2019-03-04 14:45:19');
INSERT INTO `kunjungan` VALUES (178, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-04', '2019-03-04 14:45:56', '2019-03-04 14:45:56');
INSERT INTO `kunjungan` VALUES (179, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-04', '2019-03-04 14:46:24', '2019-03-04 14:46:24');
INSERT INTO `kunjungan` VALUES (180, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-04', '2019-03-04 14:46:53', '2019-03-04 14:46:53');
INSERT INTO `kunjungan` VALUES (181, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:47:08', '2019-03-04 14:47:08');
INSERT INTO `kunjungan` VALUES (182, 'http://localhost/bkkbn/kontak', '::1', '2019-03-04', '2019-03-04 14:48:43', '2019-03-04 14:48:43');
INSERT INTO `kunjungan` VALUES (183, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:48:55', '2019-03-04 14:48:55');
INSERT INTO `kunjungan` VALUES (184, 'http://localhost/bkkbn/masuk', '::1', '2019-03-04', '2019-03-04 14:49:16', '2019-03-04 14:49:16');
INSERT INTO `kunjungan` VALUES (185, 'http://localhost/bkkbn/masuk', '::1', '2019-03-04', '2019-03-04 14:51:48', '2019-03-04 14:51:48');
INSERT INTO `kunjungan` VALUES (186, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:51:53', '2019-03-04 14:51:53');
INSERT INTO `kunjungan` VALUES (187, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:59:03', '2019-03-04 14:59:03');
INSERT INTO `kunjungan` VALUES (188, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 14:59:20', '2019-03-04 14:59:20');
INSERT INTO `kunjungan` VALUES (189, 'http://localhost/bkkbn/masuk', '::1', '2019-03-04', '2019-03-04 15:09:07', '2019-03-04 15:09:07');
INSERT INTO `kunjungan` VALUES (190, 'http://localhost/bkkbn/masuk', '::1', '2019-03-04', '2019-03-04 15:10:46', '2019-03-04 15:10:46');
INSERT INTO `kunjungan` VALUES (191, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 15:33:08', '2019-03-04 15:33:08');
INSERT INTO `kunjungan` VALUES (192, 'http://localhost/bkkbn/masuk', '::1', '2019-03-04', '2019-03-04 15:43:13', '2019-03-04 15:43:13');
INSERT INTO `kunjungan` VALUES (193, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 15:43:18', '2019-03-04 15:43:18');
INSERT INTO `kunjungan` VALUES (194, 'http://localhost/bkkbn/gelombang', '::1', '2019-03-04', '2019-03-04 15:43:38', '2019-03-04 15:43:38');
INSERT INTO `kunjungan` VALUES (195, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-04', '2019-03-04 15:43:52', '2019-03-04 15:43:52');
INSERT INTO `kunjungan` VALUES (196, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-04', '2019-03-04 15:44:38', '2019-03-04 15:44:38');
INSERT INTO `kunjungan` VALUES (197, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 15:46:11', '2019-03-04 15:46:11');
INSERT INTO `kunjungan` VALUES (198, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-04', '2019-03-04 15:46:46', '2019-03-04 15:46:46');
INSERT INTO `kunjungan` VALUES (199, 'http://localhost/bkkbn/masuk', '::1', '2019-03-04', '2019-03-04 15:48:59', '2019-03-04 15:48:59');
INSERT INTO `kunjungan` VALUES (200, 'http://localhost/bkkbn/index.php', '::1', '2019-03-04', '2019-03-04 16:23:00', '2019-03-04 16:23:00');
INSERT INTO `kunjungan` VALUES (201, 'http://localhost/bkkbn/index.php', '::1', '2019-03-07', '2019-03-07 08:36:55', '2019-03-07 08:36:55');
INSERT INTO `kunjungan` VALUES (202, 'http://localhost/bkkbn/index.php', '::1', '2019-03-07', '2019-03-07 10:22:10', '2019-03-07 10:22:10');
INSERT INTO `kunjungan` VALUES (203, 'http://localhost/bkkbn/masuk', '::1', '2019-03-07', '2019-03-07 12:12:54', '2019-03-07 12:12:54');
INSERT INTO `kunjungan` VALUES (204, 'http://localhost/bkkbn/masuk', '::1', '2019-03-07', '2019-03-07 20:14:44', '2019-03-07 20:14:44');
INSERT INTO `kunjungan` VALUES (205, 'http://localhost/bkkbn/index.php', '::1', '2019-03-07', '2019-03-07 20:46:31', '2019-03-07 20:46:31');
INSERT INTO `kunjungan` VALUES (206, 'http://localhost/bkkbn/provinsi/dasbor', '::1', '2019-03-07', '2019-03-07 21:09:42', '2019-03-07 21:09:42');
INSERT INTO `kunjungan` VALUES (207, 'http://localhost/bkkbn/provinsi/panduan', '::1', '2019-03-08', '2019-03-08 06:14:51', '2019-03-08 06:14:51');
INSERT INTO `kunjungan` VALUES (208, 'http://localhost/bkkbn/profil/password', '::1', '2019-03-08', '2019-03-08 06:25:58', '2019-03-08 06:25:58');
INSERT INTO `kunjungan` VALUES (209, 'http://localhost/bkkbn/provinsi/hasil', '::1', '2019-03-08', '2019-03-08 06:41:11', '2019-03-08 06:41:11');
INSERT INTO `kunjungan` VALUES (210, 'http://localhost/bkkbn/index.php', '::1', '2019-03-10', '2019-03-10 08:49:36', '2019-03-10 08:49:36');
INSERT INTO `kunjungan` VALUES (211, 'http://localhost/bkkbn/masuk', '::1', '2019-03-11', '2019-03-11 10:59:46', '2019-03-11 10:59:46');
INSERT INTO `kunjungan` VALUES (212, 'http://localhost/bkkbn/index.php', '::1', '2019-03-13', '2019-03-13 11:31:47', '2019-03-13 11:31:47');
INSERT INTO `kunjungan` VALUES (213, 'http://localhost/bkkbn/masuk', '::1', '2019-03-13', '2019-03-13 11:31:52', '2019-03-13 11:31:52');
INSERT INTO `kunjungan` VALUES (214, 'http://localhost/bkkbn/masuk', '::1', '2019-03-13', '2019-03-13 11:31:56', '2019-03-13 11:31:56');
INSERT INTO `kunjungan` VALUES (215, 'http://localhost/bkkbn/masuk', '::1', '2019-03-13', '2019-03-13 11:34:54', '2019-03-13 11:34:54');
INSERT INTO `kunjungan` VALUES (216, 'http://localhost/bkkbn/index.php', '::1', '2019-03-13', '2019-03-13 19:00:11', '2019-03-13 19:00:11');
INSERT INTO `kunjungan` VALUES (217, 'http://localhost/bkkbn/provinsi/penelitian/review/2', '::1', '2019-03-14', '2019-03-14 07:56:24', '2019-03-14 07:56:24');
INSERT INTO `kunjungan` VALUES (218, 'http://localhost/bkkbn/provinsi/penelitian/review/2', '::1', '2019-03-14', '2019-03-14 08:29:36', '2019-03-14 08:29:36');
INSERT INTO `kunjungan` VALUES (219, 'http://localhost/bkkbn/index.php', '::1', '2019-03-14', '2019-03-14 08:48:37', '2019-03-14 08:48:37');
INSERT INTO `kunjungan` VALUES (220, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-14', '2019-03-14 08:48:46', '2019-03-14 08:48:46');
INSERT INTO `kunjungan` VALUES (221, 'http://localhost/bkkbn/masuk', '::1', '2019-03-14', '2019-03-14 08:49:48', '2019-03-14 08:49:48');
INSERT INTO `kunjungan` VALUES (222, 'http://localhost/bkkbn/masuk', '::1', '2019-03-14', '2019-03-14 08:50:38', '2019-03-14 08:50:38');
INSERT INTO `kunjungan` VALUES (223, 'http://localhost/bkkbn/masuk', '::1', '2019-03-14', '2019-03-14 08:51:47', '2019-03-14 08:51:47');
INSERT INTO `kunjungan` VALUES (224, 'http://localhost/bkkbn/masuk', '::1', '2019-03-14', '2019-03-14 08:57:20', '2019-03-14 08:57:20');
INSERT INTO `kunjungan` VALUES (225, 'http://localhost/bkkbn/index.php', '::1', '2019-03-18', '2019-03-18 15:46:38', '2019-03-18 15:46:38');
INSERT INTO `kunjungan` VALUES (226, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-18', '2019-03-18 15:47:37', '2019-03-18 15:47:37');
INSERT INTO `kunjungan` VALUES (227, 'http://localhost/bkkbn/index.php', '::1', '2019-03-18', '2019-03-18 15:48:13', '2019-03-18 15:48:13');
INSERT INTO `kunjungan` VALUES (228, 'http://localhost/bkkbn/masuk', '::1', '2019-03-18', '2019-03-18 15:49:11', '2019-03-18 15:49:11');
INSERT INTO `kunjungan` VALUES (229, 'http://localhost/bkkbn/index.php', '::1', '2019-03-18', '2019-03-18 15:49:17', '2019-03-18 15:49:17');
INSERT INTO `kunjungan` VALUES (230, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-18', '2019-03-18 15:52:15', '2019-03-18 15:52:15');
INSERT INTO `kunjungan` VALUES (231, 'http://localhost/bkkbn/masuk', '::1', '2019-03-18', '2019-03-18 15:52:49', '2019-03-18 15:52:49');
INSERT INTO `kunjungan` VALUES (232, 'http://localhost/bkkbn/masuk', '::1', '2019-03-18', '2019-03-18 15:53:55', '2019-03-18 15:53:55');
INSERT INTO `kunjungan` VALUES (233, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-18', '2019-03-18 15:54:03', '2019-03-18 15:54:03');
INSERT INTO `kunjungan` VALUES (234, 'http://localhost/bkkbn/gelombang', '::1', '2019-03-18', '2019-03-18 15:54:16', '2019-03-18 15:54:16');
INSERT INTO `kunjungan` VALUES (235, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-18', '2019-03-18 15:54:41', '2019-03-18 15:54:41');
INSERT INTO `kunjungan` VALUES (236, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-18', '2019-03-18 15:55:13', '2019-03-18 15:55:13');
INSERT INTO `kunjungan` VALUES (237, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-18', '2019-03-18 15:55:46', '2019-03-18 15:55:46');
INSERT INTO `kunjungan` VALUES (238, 'http://localhost/bkkbn/masuk', '::1', '2019-03-18', '2019-03-18 15:56:01', '2019-03-18 15:56:01');
INSERT INTO `kunjungan` VALUES (239, 'http://localhost/bkkbn/index.php', '::1', '2019-03-18', '2019-03-18 16:33:37', '2019-03-18 16:33:37');
INSERT INTO `kunjungan` VALUES (240, 'http://localhost/bkkbn/gelombang', '::1', '2019-03-18', '2019-03-18 16:33:42', '2019-03-18 16:33:42');
INSERT INTO `kunjungan` VALUES (241, 'http://localhost/bkkbn/gelombang/read/1-gelombang-tes-ukp-2019', '::1', '2019-03-18', '2019-03-18 16:33:46', '2019-03-18 16:33:46');
INSERT INTO `kunjungan` VALUES (242, 'http://localhost/bkkbn/index.php', '::1', '2019-03-18', '2019-03-18 16:33:57', '2019-03-18 16:33:57');
INSERT INTO `kunjungan` VALUES (243, 'http://localhost/bkkbn/index.php', '::1', '2019-03-18', '2019-03-18 16:34:12', '2019-03-18 16:34:12');
INSERT INTO `kunjungan` VALUES (244, 'http://localhost/bkkbn/masuk', '::1', '2019-03-18', '2019-03-18 16:35:48', '2019-03-18 16:35:48');
INSERT INTO `kunjungan` VALUES (245, 'http://localhost/bkkbn/index.php', '::1', '2019-03-18', '2019-03-18 16:35:52', '2019-03-18 16:35:52');
INSERT INTO `kunjungan` VALUES (246, 'http://localhost/bkkbn/download', '::1', '2019-03-18', '2019-03-18 16:36:37', '2019-03-18 16:36:37');
INSERT INTO `kunjungan` VALUES (247, 'http://localhost/bkkbn/masuk', '::1', '2019-03-18', '2019-03-18 16:36:52', '2019-03-18 16:36:52');
INSERT INTO `kunjungan` VALUES (248, 'http://localhost/bkkbn/masuk', '::1', '2019-03-18', '2019-03-18 16:41:04', '2019-03-18 16:41:04');
INSERT INTO `kunjungan` VALUES (249, 'http://localhost/bkkbn/kontak', '::1', '2019-03-18', '2019-03-18 16:50:22', '2019-03-18 16:50:22');
INSERT INTO `kunjungan` VALUES (250, 'http://localhost/bkkbn/index.php', '::1', '2019-03-24', '2019-03-24 05:46:23', '2019-03-24 05:46:23');
INSERT INTO `kunjungan` VALUES (251, 'http://localhost/bkkbn/sk', '::1', '2019-03-24', '2019-03-24 06:05:11', '2019-03-24 06:05:11');
INSERT INTO `kunjungan` VALUES (252, 'http://localhost/bkkbn/sk', '::1', '2019-03-25', '2019-03-25 08:23:43', '2019-03-25 08:23:43');
INSERT INTO `kunjungan` VALUES (253, 'http://localhost/bkkbn/sk', '::1', '2019-03-25', '2019-03-25 08:25:44', '2019-03-25 08:25:44');
INSERT INTO `kunjungan` VALUES (254, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 10:37:24', '2019-03-25 10:37:24');
INSERT INTO `kunjungan` VALUES (255, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 11:13:25', '2019-03-25 11:13:25');
INSERT INTO `kunjungan` VALUES (256, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 11:17:10', '2019-03-25 11:17:10');
INSERT INTO `kunjungan` VALUES (257, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 11:20:06', '2019-03-25 11:20:06');
INSERT INTO `kunjungan` VALUES (258, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 11:21:18', '2019-03-25 11:21:18');
INSERT INTO `kunjungan` VALUES (259, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 11:22:04', '2019-03-25 11:22:04');
INSERT INTO `kunjungan` VALUES (260, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 11:22:24', '2019-03-25 11:22:24');
INSERT INTO `kunjungan` VALUES (261, 'http://localhost/bkkbn/berita/kategori/kegiatan', '::1', '2019-03-25', '2019-03-25 11:22:39', '2019-03-25 11:22:39');
INSERT INTO `kunjungan` VALUES (262, 'http://localhost/bkkbn/download', '::1', '2019-03-25', '2019-03-25 11:22:44', '2019-03-25 11:22:44');
INSERT INTO `kunjungan` VALUES (263, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-25', '2019-03-25 11:32:13', '2019-03-25 11:32:13');
INSERT INTO `kunjungan` VALUES (264, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 14:07:27', '2019-03-25 14:07:27');
INSERT INTO `kunjungan` VALUES (265, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 14:19:16', '2019-03-25 14:19:16');
INSERT INTO `kunjungan` VALUES (266, 'http://localhost/bkkbn/masuk', '::1', '2019-03-25', '2019-03-25 14:19:20', '2019-03-25 14:19:20');
INSERT INTO `kunjungan` VALUES (267, 'http://localhost/bkkbn/masuk', '::1', '2019-03-25', '2019-03-25 14:23:40', '2019-03-25 14:23:40');
INSERT INTO `kunjungan` VALUES (268, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 14:23:56', '2019-03-25 14:23:56');
INSERT INTO `kunjungan` VALUES (269, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 14:40:40', '2019-03-25 14:40:40');
INSERT INTO `kunjungan` VALUES (270, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-25', '2019-03-25 14:41:11', '2019-03-25 14:41:11');
INSERT INTO `kunjungan` VALUES (271, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-25', '2019-03-25 14:42:24', '2019-03-25 14:42:24');
INSERT INTO `kunjungan` VALUES (272, 'http://localhost/bkkbn/masuk', '::1', '2019-03-25', '2019-03-25 14:43:51', '2019-03-25 14:43:51');
INSERT INTO `kunjungan` VALUES (273, 'http://localhost/bkkbn/masuk', '::1', '2019-03-25', '2019-03-25 14:45:14', '2019-03-25 14:45:14');
INSERT INTO `kunjungan` VALUES (274, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 15:07:53', '2019-03-25 15:07:53');
INSERT INTO `kunjungan` VALUES (275, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 15:13:42', '2019-03-25 15:13:42');
INSERT INTO `kunjungan` VALUES (276, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 15:14:43', '2019-03-25 15:14:43');
INSERT INTO `kunjungan` VALUES (277, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 15:15:14', '2019-03-25 15:15:14');
INSERT INTO `kunjungan` VALUES (278, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 15:15:40', '2019-03-25 15:15:40');
INSERT INTO `kunjungan` VALUES (279, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 15:17:44', '2019-03-25 15:17:44');
INSERT INTO `kunjungan` VALUES (280, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 15:20:02', '2019-03-25 15:20:02');
INSERT INTO `kunjungan` VALUES (281, 'http://localhost/bkkbn/gelombang', '::1', '2019-03-25', '2019-03-25 15:36:18', '2019-03-25 15:36:18');
INSERT INTO `kunjungan` VALUES (282, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 15:36:45', '2019-03-25 15:36:45');
INSERT INTO `kunjungan` VALUES (283, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 15:48:49', '2019-03-25 15:48:49');
INSERT INTO `kunjungan` VALUES (284, 'http://localhost/bkkbn/berita/profil/fungsi-pusdu', '::1', '2019-03-25', '2019-03-25 15:52:51', '2019-03-25 15:52:51');
INSERT INTO `kunjungan` VALUES (285, 'http://localhost/bkkbn/berita/profil/tugas-pokok', '::1', '2019-03-25', '2019-03-25 15:53:00', '2019-03-25 15:53:00');
INSERT INTO `kunjungan` VALUES (286, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 15:53:10', '2019-03-25 15:53:10');
INSERT INTO `kunjungan` VALUES (287, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 16:14:03', '2019-03-25 16:14:03');
INSERT INTO `kunjungan` VALUES (288, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 16:14:26', '2019-03-25 16:14:26');
INSERT INTO `kunjungan` VALUES (289, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 16:14:43', '2019-03-25 16:14:43');
INSERT INTO `kunjungan` VALUES (290, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-25', '2019-03-25 16:15:01', '2019-03-25 16:15:01');
INSERT INTO `kunjungan` VALUES (291, 'http://localhost/bkkbn/index.php', '::1', '2019-03-25', '2019-03-25 16:16:41', '2019-03-25 16:16:41');
INSERT INTO `kunjungan` VALUES (292, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-26', '2019-03-26 13:15:07', '2019-03-26 13:15:07');
INSERT INTO `kunjungan` VALUES (293, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-26', '2019-03-26 13:16:38', '2019-03-26 13:16:38');
INSERT INTO `kunjungan` VALUES (294, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-26', '2019-03-26 13:17:32', '2019-03-26 13:17:32');
INSERT INTO `kunjungan` VALUES (295, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-26', '2019-03-26 13:17:57', '2019-03-26 13:17:57');
INSERT INTO `kunjungan` VALUES (296, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-26', '2019-03-26 13:18:23', '2019-03-26 13:18:23');
INSERT INTO `kunjungan` VALUES (297, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-26', '2019-03-26 13:18:56', '2019-03-26 13:18:56');
INSERT INTO `kunjungan` VALUES (298, 'http://localhost/bkkbn/index.php', '::1', '2019-03-26', '2019-03-26 14:45:30', '2019-03-26 14:45:30');
INSERT INTO `kunjungan` VALUES (299, 'http://localhost/bkkbn/index.php', '::1', '2019-03-26', '2019-03-26 15:23:19', '2019-03-26 15:23:19');
INSERT INTO `kunjungan` VALUES (300, 'http://localhost/bkkbn/masuk', '::1', '2019-03-26', '2019-03-26 15:23:37', '2019-03-26 15:23:37');
INSERT INTO `kunjungan` VALUES (301, 'http://localhost/bkkbn/masuk', '::1', '2019-03-27', '2019-03-27 07:54:53', '2019-03-27 07:54:53');
INSERT INTO `kunjungan` VALUES (302, 'http://localhost/bkkbn/index.php', '::1', '2019-03-27', '2019-03-27 08:54:06', '2019-03-27 08:54:06');
INSERT INTO `kunjungan` VALUES (303, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-27', '2019-03-27 09:24:47', '2019-03-27 09:24:47');
INSERT INTO `kunjungan` VALUES (304, 'http://localhost/bkkbn/masuk', '::1', '2019-03-27', '2019-03-27 10:21:39', '2019-03-27 10:21:39');
INSERT INTO `kunjungan` VALUES (305, 'http://localhost/bkkbn/pendaftaran', '::1', '2019-03-27', '2019-03-27 10:21:56', '2019-03-27 10:21:56');
INSERT INTO `kunjungan` VALUES (306, 'http://localhost/bkkbn/index.php', '::1', '2019-03-27', '2019-03-27 10:50:28', '2019-03-27 10:50:28');
INSERT INTO `kunjungan` VALUES (307, 'http://localhost/bkkbn/index.php', '::1', '2019-04-03', '2019-04-03 14:10:13', '2019-04-03 14:10:13');
INSERT INTO `kunjungan` VALUES (308, 'http://localhost/bkkbn/index.php', '::1', '2019-04-03', '2019-04-03 14:39:14', '2019-04-03 14:39:14');
INSERT INTO `kunjungan` VALUES (309, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:32:31', '2019-05-13 15:32:31');
INSERT INTO `kunjungan` VALUES (310, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:33:08', '2019-05-13 15:33:08');
INSERT INTO `kunjungan` VALUES (311, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:33:32', '2019-05-13 15:33:32');
INSERT INTO `kunjungan` VALUES (312, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:34:14', '2019-05-13 15:34:14');
INSERT INTO `kunjungan` VALUES (313, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:34:21', '2019-05-13 15:34:21');
INSERT INTO `kunjungan` VALUES (314, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:35:08', '2019-05-13 15:35:08');
INSERT INTO `kunjungan` VALUES (315, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:36:08', '2019-05-13 15:36:08');
INSERT INTO `kunjungan` VALUES (316, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:36:13', '2019-05-13 15:36:13');
INSERT INTO `kunjungan` VALUES (317, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:37:00', '2019-05-13 15:37:00');
INSERT INTO `kunjungan` VALUES (318, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:37:03', '2019-05-13 15:37:03');
INSERT INTO `kunjungan` VALUES (319, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:37:29', '2019-05-13 15:37:29');
INSERT INTO `kunjungan` VALUES (320, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:37:43', '2019-05-13 15:37:43');
INSERT INTO `kunjungan` VALUES (321, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:48:01', '2019-05-13 15:48:01');
INSERT INTO `kunjungan` VALUES (322, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:49:07', '2019-05-13 15:49:07');
INSERT INTO `kunjungan` VALUES (323, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:50:30', '2019-05-13 15:50:30');
INSERT INTO `kunjungan` VALUES (324, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:51:01', '2019-05-13 15:51:01');
INSERT INTO `kunjungan` VALUES (325, 'http://localhost/sigit/index.php', '::1', '2019-05-13', '2019-05-13 15:51:55', '2019-05-13 15:51:55');
INSERT INTO `kunjungan` VALUES (326, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 03:55:19', '2019-05-17 03:55:19');
INSERT INTO `kunjungan` VALUES (327, 'http://localhost/sigit/galeri', '::1', '2019-05-17', '2019-05-17 03:56:05', '2019-05-17 03:56:05');
INSERT INTO `kunjungan` VALUES (328, 'http://localhost/sigit/video', '::1', '2019-05-17', '2019-05-17 03:56:11', '2019-05-17 03:56:11');
INSERT INTO `kunjungan` VALUES (329, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 03:57:36', '2019-05-17 03:57:36');
INSERT INTO `kunjungan` VALUES (330, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:01:10', '2019-05-17 04:01:10');
INSERT INTO `kunjungan` VALUES (331, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:08:10', '2019-05-17 04:08:10');
INSERT INTO `kunjungan` VALUES (332, 'http://localhost/sigit/download', '::1', '2019-05-17', '2019-05-17 04:08:24', '2019-05-17 04:08:24');
INSERT INTO `kunjungan` VALUES (333, 'http://localhost/sigit/download', '::1', '2019-05-17', '2019-05-17 04:08:32', '2019-05-17 04:08:32');
INSERT INTO `kunjungan` VALUES (334, 'http://localhost/sigit/kontak', '::1', '2019-05-17', '2019-05-17 04:08:36', '2019-05-17 04:08:36');
INSERT INTO `kunjungan` VALUES (335, 'http://localhost/sigit/kontak', '::1', '2019-05-17', '2019-05-17 04:08:53', '2019-05-17 04:08:53');
INSERT INTO `kunjungan` VALUES (336, 'http://localhost/sigit/kontak', '::1', '2019-05-17', '2019-05-17 04:10:12', '2019-05-17 04:10:12');
INSERT INTO `kunjungan` VALUES (337, 'http://localhost/sigit/kontak', '::1', '2019-05-17', '2019-05-17 04:10:36', '2019-05-17 04:10:36');
INSERT INTO `kunjungan` VALUES (338, 'http://localhost/sigit/kontak', '::1', '2019-05-17', '2019-05-17 04:10:49', '2019-05-17 04:10:49');
INSERT INTO `kunjungan` VALUES (339, 'http://localhost/sigit/kontak', '::1', '2019-05-17', '2019-05-17 04:11:18', '2019-05-17 04:11:18');
INSERT INTO `kunjungan` VALUES (340, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:11:26', '2019-05-17 04:11:26');
INSERT INTO `kunjungan` VALUES (341, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:12:08', '2019-05-17 04:12:08');
INSERT INTO `kunjungan` VALUES (342, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:12:28', '2019-05-17 04:12:28');
INSERT INTO `kunjungan` VALUES (343, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:14:13', '2019-05-17 04:14:13');
INSERT INTO `kunjungan` VALUES (344, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:14:56', '2019-05-17 04:14:56');
INSERT INTO `kunjungan` VALUES (345, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:15:16', '2019-05-17 04:15:16');
INSERT INTO `kunjungan` VALUES (346, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:15:40', '2019-05-17 04:15:40');
INSERT INTO `kunjungan` VALUES (347, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:15:56', '2019-05-17 04:15:56');
INSERT INTO `kunjungan` VALUES (348, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:16:17', '2019-05-17 04:16:17');
INSERT INTO `kunjungan` VALUES (349, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:16:56', '2019-05-17 04:16:56');
INSERT INTO `kunjungan` VALUES (350, 'http://localhost/sigit/berita/layanan/integrasi-data-dan-pengetahuan', '::1', '2019-05-17', '2019-05-17 04:17:29', '2019-05-17 04:17:29');
INSERT INTO `kunjungan` VALUES (351, 'http://localhost/sigit/berita/layanan/integrasi-data-dan-pengetahuan', '::1', '2019-05-17', '2019-05-17 04:18:05', '2019-05-17 04:18:05');
INSERT INTO `kunjungan` VALUES (352, 'http://localhost/sigit/berita/layanan/integrasi-data-dan-pengetahuan', '::1', '2019-05-17', '2019-05-17 04:18:37', '2019-05-17 04:18:37');
INSERT INTO `kunjungan` VALUES (353, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:18:42', '2019-05-17 04:18:42');
INSERT INTO `kunjungan` VALUES (354, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:20:36', '2019-05-17 04:20:36');
INSERT INTO `kunjungan` VALUES (355, 'http://localhost/sigit/berita/layanan/integrasi-data-dan-pengetahuan', '::1', '2019-05-17', '2019-05-17 04:21:03', '2019-05-17 04:21:03');
INSERT INTO `kunjungan` VALUES (356, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:22:17', '2019-05-17 04:22:17');
INSERT INTO `kunjungan` VALUES (357, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:22:35', '2019-05-17 04:22:35');
INSERT INTO `kunjungan` VALUES (358, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:31:34', '2019-05-17 04:31:34');
INSERT INTO `kunjungan` VALUES (359, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:32:06', '2019-05-17 04:32:06');
INSERT INTO `kunjungan` VALUES (360, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:32:23', '2019-05-17 04:32:23');
INSERT INTO `kunjungan` VALUES (361, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:32:37', '2019-05-17 04:32:37');
INSERT INTO `kunjungan` VALUES (362, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:34:48', '2019-05-17 04:34:48');
INSERT INTO `kunjungan` VALUES (363, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:35:07', '2019-05-17 04:35:07');
INSERT INTO `kunjungan` VALUES (364, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:35:56', '2019-05-17 04:35:56');
INSERT INTO `kunjungan` VALUES (365, 'http://localhost/sigit/index.php', '::1', '2019-05-17', '2019-05-17 04:37:07', '2019-05-17 04:37:07');
INSERT INTO `kunjungan` VALUES (366, 'http://localhost/sigit/berita/layanan/temu-kolaborasi', '::1', '2019-05-17', '2019-05-17 07:35:57', '2019-05-17 07:35:57');
INSERT INTO `kunjungan` VALUES (367, 'http://localhost/sigit/index.php', '::1', '2019-05-27', '2019-05-27 12:38:33', '2019-05-27 12:38:33');
INSERT INTO `kunjungan` VALUES (368, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:31:01', '2019-07-15 12:31:01');
INSERT INTO `kunjungan` VALUES (369, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:39:02', '2019-07-15 12:39:02');
INSERT INTO `kunjungan` VALUES (370, 'http://localhost/sigit/images/image_1.jpg', '::1', '2019-07-15', '2019-07-15 12:39:03', '2019-07-15 12:39:03');
INSERT INTO `kunjungan` VALUES (371, 'http://localhost/sigit/images/image_2.jpg', '::1', '2019-07-15', '2019-07-15 12:39:03', '2019-07-15 12:39:03');
INSERT INTO `kunjungan` VALUES (372, 'http://localhost/sigit/images/image_3.jpg', '::1', '2019-07-15', '2019-07-15 12:39:03', '2019-07-15 12:39:03');
INSERT INTO `kunjungan` VALUES (373, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:39:50', '2019-07-15 12:39:50');
INSERT INTO `kunjungan` VALUES (374, 'http://localhost/sigit/images/image_3.jpg', '::1', '2019-07-15', '2019-07-15 12:39:51', '2019-07-15 12:39:51');
INSERT INTO `kunjungan` VALUES (375, 'http://localhost/sigit/images/image_2.jpg', '::1', '2019-07-15', '2019-07-15 12:39:51', '2019-07-15 12:39:51');
INSERT INTO `kunjungan` VALUES (376, 'http://localhost/sigit/images/image_1.jpg', '::1', '2019-07-15', '2019-07-15 12:39:51', '2019-07-15 12:39:51');
INSERT INTO `kunjungan` VALUES (377, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:42:39', '2019-07-15 12:42:39');
INSERT INTO `kunjungan` VALUES (378, 'http://localhost/sigit/images/image_1.jpg', '::1', '2019-07-15', '2019-07-15 12:42:39', '2019-07-15 12:42:39');
INSERT INTO `kunjungan` VALUES (379, 'http://localhost/sigit/images/image_2.jpg', '::1', '2019-07-15', '2019-07-15 12:42:40', '2019-07-15 12:42:40');
INSERT INTO `kunjungan` VALUES (380, 'http://localhost/sigit/images/image_3.jpg', '::1', '2019-07-15', '2019-07-15 12:42:40', '2019-07-15 12:42:40');
INSERT INTO `kunjungan` VALUES (381, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:45:42', '2019-07-15 12:45:42');
INSERT INTO `kunjungan` VALUES (382, 'http://localhost/sigit/images/image_2.jpg', '::1', '2019-07-15', '2019-07-15 12:45:43', '2019-07-15 12:45:43');
INSERT INTO `kunjungan` VALUES (383, 'http://localhost/sigit/images/image_3.jpg', '::1', '2019-07-15', '2019-07-15 12:45:43', '2019-07-15 12:45:43');
INSERT INTO `kunjungan` VALUES (384, 'http://localhost/sigit/images/image_1.jpg', '::1', '2019-07-15', '2019-07-15 12:45:43', '2019-07-15 12:45:43');
INSERT INTO `kunjungan` VALUES (385, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:47:13', '2019-07-15 12:47:13');
INSERT INTO `kunjungan` VALUES (386, 'http://localhost/sigit/images/image_1.jpg', '::1', '2019-07-15', '2019-07-15 12:47:14', '2019-07-15 12:47:14');
INSERT INTO `kunjungan` VALUES (387, 'http://localhost/sigit/images/image_3.jpg', '::1', '2019-07-15', '2019-07-15 12:47:14', '2019-07-15 12:47:14');
INSERT INTO `kunjungan` VALUES (388, 'http://localhost/sigit/images/image_2.jpg', '::1', '2019-07-15', '2019-07-15 12:47:14', '2019-07-15 12:47:14');
INSERT INTO `kunjungan` VALUES (389, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:47:51', '2019-07-15 12:47:51');
INSERT INTO `kunjungan` VALUES (390, 'http://localhost/sigit/images/image_2.jpg', '::1', '2019-07-15', '2019-07-15 12:47:52', '2019-07-15 12:47:52');
INSERT INTO `kunjungan` VALUES (391, 'http://localhost/sigit/images/image_3.jpg', '::1', '2019-07-15', '2019-07-15 12:47:52', '2019-07-15 12:47:52');
INSERT INTO `kunjungan` VALUES (392, 'http://localhost/sigit/images/image_1.jpg', '::1', '2019-07-15', '2019-07-15 12:47:52', '2019-07-15 12:47:52');
INSERT INTO `kunjungan` VALUES (393, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:48:36', '2019-07-15 12:48:36');
INSERT INTO `kunjungan` VALUES (394, 'http://localhost/sigit/images/image_3.jpg', '::1', '2019-07-15', '2019-07-15 12:48:37', '2019-07-15 12:48:37');
INSERT INTO `kunjungan` VALUES (395, 'http://localhost/sigit/images/image_2.jpg', '::1', '2019-07-15', '2019-07-15 12:48:37', '2019-07-15 12:48:37');
INSERT INTO `kunjungan` VALUES (396, 'http://localhost/sigit/images/image_1.jpg', '::1', '2019-07-15', '2019-07-15 12:48:37', '2019-07-15 12:48:37');
INSERT INTO `kunjungan` VALUES (397, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:49:16', '2019-07-15 12:49:16');
INSERT INTO `kunjungan` VALUES (398, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:49:21', '2019-07-15 12:49:21');
INSERT INTO `kunjungan` VALUES (399, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:49:58', '2019-07-15 12:49:58');
INSERT INTO `kunjungan` VALUES (400, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:50:09', '2019-07-15 12:50:09');
INSERT INTO `kunjungan` VALUES (401, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:51:08', '2019-07-15 12:51:08');
INSERT INTO `kunjungan` VALUES (402, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:51:16', '2019-07-15 12:51:16');
INSERT INTO `kunjungan` VALUES (403, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:51:46', '2019-07-15 12:51:46');
INSERT INTO `kunjungan` VALUES (404, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:53:02', '2019-07-15 12:53:02');
INSERT INTO `kunjungan` VALUES (405, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:55:23', '2019-07-15 12:55:23');
INSERT INTO `kunjungan` VALUES (406, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:56:38', '2019-07-15 12:56:38');
INSERT INTO `kunjungan` VALUES (407, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:58:37', '2019-07-15 12:58:37');
INSERT INTO `kunjungan` VALUES (408, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 12:58:44', '2019-07-15 12:58:44');
INSERT INTO `kunjungan` VALUES (409, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:02:32', '2019-07-15 13:02:32');
INSERT INTO `kunjungan` VALUES (410, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:05:43', '2019-07-15 13:05:43');
INSERT INTO `kunjungan` VALUES (411, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:06:27', '2019-07-15 13:06:27');
INSERT INTO `kunjungan` VALUES (412, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:07:11', '2019-07-15 13:07:11');
INSERT INTO `kunjungan` VALUES (413, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:07:27', '2019-07-15 13:07:27');
INSERT INTO `kunjungan` VALUES (414, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:08:07', '2019-07-15 13:08:07');
INSERT INTO `kunjungan` VALUES (415, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:08:31', '2019-07-15 13:08:31');
INSERT INTO `kunjungan` VALUES (416, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:08:53', '2019-07-15 13:08:53');
INSERT INTO `kunjungan` VALUES (417, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:10:48', '2019-07-15 13:10:48');
INSERT INTO `kunjungan` VALUES (418, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:13:14', '2019-07-15 13:13:14');
INSERT INTO `kunjungan` VALUES (419, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:14:32', '2019-07-15 13:14:32');
INSERT INTO `kunjungan` VALUES (420, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:19:34', '2019-07-15 13:19:34');
INSERT INTO `kunjungan` VALUES (421, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:19:44', '2019-07-15 13:19:44');
INSERT INTO `kunjungan` VALUES (422, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:21:29', '2019-07-15 13:21:29');
INSERT INTO `kunjungan` VALUES (423, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:22:24', '2019-07-15 13:22:24');
INSERT INTO `kunjungan` VALUES (424, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:31:30', '2019-07-15 13:31:30');
INSERT INTO `kunjungan` VALUES (425, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:31:47', '2019-07-15 13:31:47');
INSERT INTO `kunjungan` VALUES (426, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-15', '2019-07-15 13:31:47', '2019-07-15 13:31:47');
INSERT INTO `kunjungan` VALUES (427, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:37:36', '2019-07-15 13:37:36');
INSERT INTO `kunjungan` VALUES (428, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-15', '2019-07-15 13:37:37', '2019-07-15 13:37:37');
INSERT INTO `kunjungan` VALUES (429, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:38:01', '2019-07-15 13:38:01');
INSERT INTO `kunjungan` VALUES (430, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-15', '2019-07-15 13:38:02', '2019-07-15 13:38:02');
INSERT INTO `kunjungan` VALUES (431, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:40:43', '2019-07-15 13:40:43');
INSERT INTO `kunjungan` VALUES (432, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-15', '2019-07-15 13:40:43', '2019-07-15 13:40:43');
INSERT INTO `kunjungan` VALUES (433, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:41:15', '2019-07-15 13:41:15');
INSERT INTO `kunjungan` VALUES (434, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-15', '2019-07-15 13:41:16', '2019-07-15 13:41:16');
INSERT INTO `kunjungan` VALUES (435, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:41:35', '2019-07-15 13:41:35');
INSERT INTO `kunjungan` VALUES (436, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-15', '2019-07-15 13:41:36', '2019-07-15 13:41:36');
INSERT INTO `kunjungan` VALUES (437, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:46:14', '2019-07-15 13:46:14');
INSERT INTO `kunjungan` VALUES (438, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-15', '2019-07-15 13:46:15', '2019-07-15 13:46:15');
INSERT INTO `kunjungan` VALUES (439, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:46:41', '2019-07-15 13:46:41');
INSERT INTO `kunjungan` VALUES (440, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-15', '2019-07-15 13:46:42', '2019-07-15 13:46:42');
INSERT INTO `kunjungan` VALUES (441, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:46:52', '2019-07-15 13:46:52');
INSERT INTO `kunjungan` VALUES (442, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-15', '2019-07-15 13:46:52', '2019-07-15 13:46:52');
INSERT INTO `kunjungan` VALUES (443, 'http://localhost/sigit/index.php', '::1', '2019-07-15', '2019-07-15 13:48:48', '2019-07-15 13:48:48');
INSERT INTO `kunjungan` VALUES (444, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-15', '2019-07-15 13:48:48', '2019-07-15 13:48:48');
INSERT INTO `kunjungan` VALUES (445, 'http://localhost/sigit/index.php', '::1', '2019-07-25', '2019-07-25 10:23:31', '2019-07-25 10:23:31');
INSERT INTO `kunjungan` VALUES (446, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-25', '2019-07-25 10:23:35', '2019-07-25 10:23:35');
INSERT INTO `kunjungan` VALUES (447, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 09:26:51', '2019-07-26 09:26:51');
INSERT INTO `kunjungan` VALUES (448, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-26', '2019-07-26 09:26:58', '2019-07-26 09:26:58');
INSERT INTO `kunjungan` VALUES (449, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 09:29:40', '2019-07-26 09:29:40');
INSERT INTO `kunjungan` VALUES (450, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-26', '2019-07-26 09:29:41', '2019-07-26 09:29:41');
INSERT INTO `kunjungan` VALUES (451, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 09:31:36', '2019-07-26 09:31:36');
INSERT INTO `kunjungan` VALUES (452, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-26', '2019-07-26 09:31:37', '2019-07-26 09:31:37');
INSERT INTO `kunjungan` VALUES (453, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 09:38:56', '2019-07-26 09:38:56');
INSERT INTO `kunjungan` VALUES (454, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-26', '2019-07-26 09:38:58', '2019-07-26 09:38:58');
INSERT INTO `kunjungan` VALUES (455, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 09:40:10', '2019-07-26 09:40:10');
INSERT INTO `kunjungan` VALUES (456, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-26', '2019-07-26 09:40:11', '2019-07-26 09:40:11');
INSERT INTO `kunjungan` VALUES (457, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:05:16', '2019-07-26 10:05:16');
INSERT INTO `kunjungan` VALUES (458, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-26', '2019-07-26 10:05:19', '2019-07-26 10:05:19');
INSERT INTO `kunjungan` VALUES (459, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:06:19', '2019-07-26 10:06:19');
INSERT INTO `kunjungan` VALUES (460, 'http://localhost/sigit/asets/upload/staff', '::1', '2019-07-26', '2019-07-26 10:06:20', '2019-07-26 10:06:20');
INSERT INTO `kunjungan` VALUES (461, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:07:26', '2019-07-26 10:07:26');
INSERT INTO `kunjungan` VALUES (462, 'http://localhost/sigit/berita/kategori/kegiatan', '::1', '2019-07-26', '2019-07-26 10:08:13', '2019-07-26 10:08:13');
INSERT INTO `kunjungan` VALUES (463, 'http://localhost/sigit/berita/layanan/integrasi-data-dan-pengetahuan', '::1', '2019-07-26', '2019-07-26 10:08:20', '2019-07-26 10:08:20');
INSERT INTO `kunjungan` VALUES (464, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:08:26', '2019-07-26 10:08:26');
INSERT INTO `kunjungan` VALUES (465, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:11:02', '2019-07-26 10:11:02');
INSERT INTO `kunjungan` VALUES (466, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:11:49', '2019-07-26 10:11:49');
INSERT INTO `kunjungan` VALUES (467, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:12:17', '2019-07-26 10:12:17');
INSERT INTO `kunjungan` VALUES (468, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:14:06', '2019-07-26 10:14:06');
INSERT INTO `kunjungan` VALUES (469, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:14:49', '2019-07-26 10:14:49');
INSERT INTO `kunjungan` VALUES (470, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:15:03', '2019-07-26 10:15:03');
INSERT INTO `kunjungan` VALUES (471, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:16:56', '2019-07-26 10:16:56');
INSERT INTO `kunjungan` VALUES (472, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:18:39', '2019-07-26 10:18:39');
INSERT INTO `kunjungan` VALUES (473, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:21:24', '2019-07-26 10:21:24');
INSERT INTO `kunjungan` VALUES (474, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:22:25', '2019-07-26 10:22:25');
INSERT INTO `kunjungan` VALUES (475, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:23:07', '2019-07-26 10:23:07');
INSERT INTO `kunjungan` VALUES (476, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:23:27', '2019-07-26 10:23:27');
INSERT INTO `kunjungan` VALUES (477, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:24:17', '2019-07-26 10:24:17');
INSERT INTO `kunjungan` VALUES (478, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:25:03', '2019-07-26 10:25:03');
INSERT INTO `kunjungan` VALUES (479, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:25:39', '2019-07-26 10:25:39');
INSERT INTO `kunjungan` VALUES (480, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:26:30', '2019-07-26 10:26:30');
INSERT INTO `kunjungan` VALUES (481, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:26:44', '2019-07-26 10:26:44');
INSERT INTO `kunjungan` VALUES (482, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:29:16', '2019-07-26 10:29:16');
INSERT INTO `kunjungan` VALUES (483, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:30:52', '2019-07-26 10:30:52');
INSERT INTO `kunjungan` VALUES (484, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:31:52', '2019-07-26 10:31:52');
INSERT INTO `kunjungan` VALUES (485, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:34:47', '2019-07-26 10:34:47');
INSERT INTO `kunjungan` VALUES (486, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:35:27', '2019-07-26 10:35:27');
INSERT INTO `kunjungan` VALUES (487, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:35:29', '2019-07-26 10:35:29');
INSERT INTO `kunjungan` VALUES (488, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:36:19', '2019-07-26 10:36:19');
INSERT INTO `kunjungan` VALUES (489, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:38:37', '2019-07-26 10:38:37');
INSERT INTO `kunjungan` VALUES (490, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:38:58', '2019-07-26 10:38:58');
INSERT INTO `kunjungan` VALUES (491, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:39:10', '2019-07-26 10:39:10');
INSERT INTO `kunjungan` VALUES (492, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:39:27', '2019-07-26 10:39:27');
INSERT INTO `kunjungan` VALUES (493, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:39:36', '2019-07-26 10:39:36');
INSERT INTO `kunjungan` VALUES (494, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:40:37', '2019-07-26 10:40:37');
INSERT INTO `kunjungan` VALUES (495, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:52:08', '2019-07-26 10:52:08');
INSERT INTO `kunjungan` VALUES (496, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:53:30', '2019-07-26 10:53:30');
INSERT INTO `kunjungan` VALUES (497, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:54:11', '2019-07-26 10:54:11');
INSERT INTO `kunjungan` VALUES (498, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:54:34', '2019-07-26 10:54:34');
INSERT INTO `kunjungan` VALUES (499, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:56:33', '2019-07-26 10:56:33');
INSERT INTO `kunjungan` VALUES (500, 'http://localhost/sigit/berita/layanan/iso-90012015', '::1', '2019-07-26', '2019-07-26 10:56:59', '2019-07-26 10:56:59');
INSERT INTO `kunjungan` VALUES (501, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:57:18', '2019-07-26 10:57:18');
INSERT INTO `kunjungan` VALUES (502, 'http://localhost/sigit/index.php', '::1', '2019-07-26', '2019-07-26 10:57:49', '2019-07-26 10:57:49');
INSERT INTO `kunjungan` VALUES (503, 'http://localhost/sigit/galeri', '::1', '2019-07-26', '2019-07-26 11:01:58', '2019-07-26 11:01:58');
INSERT INTO `kunjungan` VALUES (504, 'http://localhost/sigit/download', '::1', '2019-07-26', '2019-07-26 11:02:03', '2019-07-26 11:02:03');
INSERT INTO `kunjungan` VALUES (505, 'http://localhost/sigit/index.php', '::1', '2019-10-11', '2019-10-11 19:30:33', '2019-10-11 19:30:33');
INSERT INTO `kunjungan` VALUES (506, 'http://localhost/compro/index.php', '::1', '2019-10-11', '2019-10-11 19:35:59', '2019-10-11 19:35:59');
INSERT INTO `kunjungan` VALUES (507, 'http://localhost/compro/index.php', '::1', '2019-10-11', '2019-10-11 19:47:01', '2019-10-11 19:47:01');
INSERT INTO `kunjungan` VALUES (508, 'http://localhost/compro/kontak', '::1', '2019-10-11', '2019-10-11 19:48:17', '2019-10-11 19:48:17');
INSERT INTO `kunjungan` VALUES (509, 'http://localhost/compro/index.php', '::1', '2019-10-11', '2019-10-11 19:48:23', '2019-10-11 19:48:23');
INSERT INTO `kunjungan` VALUES (510, 'http://localhost/compro/index.php', '::1', '2019-10-11', '2019-10-11 19:48:57', '2019-10-11 19:48:57');
INSERT INTO `kunjungan` VALUES (511, 'http://localhost/compro/index.php', '::1', '2019-10-11', '2019-10-11 20:02:54', '2019-10-11 20:02:54');
INSERT INTO `kunjungan` VALUES (512, 'http://localhost/compro/index.php', '::1', '2019-10-11', '2019-10-11 20:04:44', '2019-10-11 20:04:44');
INSERT INTO `kunjungan` VALUES (513, 'http://localhost/compro/index.php', '::1', '2019-10-11', '2019-10-11 20:56:49', '2019-10-11 20:56:49');
INSERT INTO `kunjungan` VALUES (514, 'http://localhost/compro/berita', '::1', '2019-10-11', '2019-10-11 20:57:16', '2019-10-11 20:57:16');
INSERT INTO `kunjungan` VALUES (515, 'http://localhost/compro/berita/read/integrasi-data-dan-pengetahuan', '::1', '2019-10-11', '2019-10-11 20:57:21', '2019-10-11 20:57:21');
INSERT INTO `kunjungan` VALUES (516, 'http://localhost/compro/berita/profil/profil-pt-nuansa-abadi', '::1', '2019-10-11', '2019-10-11 20:57:28', '2019-10-11 20:57:28');
INSERT INTO `kunjungan` VALUES (517, 'http://localhost/compro/download', '::1', '2019-10-11', '2019-10-11 20:57:35', '2019-10-11 20:57:35');
INSERT INTO `kunjungan` VALUES (518, 'http://localhost/compro/galeri', '::1', '2019-10-11', '2019-10-11 20:57:47', '2019-10-11 20:57:47');
INSERT INTO `kunjungan` VALUES (519, 'http://localhost/compro/index.php', '::1', '2019-10-11', '2019-10-11 20:58:44', '2019-10-11 20:58:44');
INSERT INTO `kunjungan` VALUES (520, 'http://localhost/compro/index.php', '::1', '2019-10-12', '2019-10-12 08:43:56', '2019-10-12 08:43:56');
INSERT INTO `kunjungan` VALUES (521, 'http://localhost/compro/index.php', '::1', '2019-10-12', '2019-10-12 08:44:53', '2019-10-12 08:44:53');
INSERT INTO `kunjungan` VALUES (522, 'http://localhost/compro/index.php', '::1', '2019-10-12', '2019-10-12 08:45:46', '2019-10-12 08:45:46');
INSERT INTO `kunjungan` VALUES (523, 'http://localhost/compro/index.php', '::1', '2019-10-12', '2019-10-12 08:46:06', '2019-10-12 08:46:06');
INSERT INTO `kunjungan` VALUES (524, 'http://localhost/compro/index.php', '::1', '2019-10-12', '2019-10-12 08:48:22', '2019-10-12 08:48:22');
INSERT INTO `kunjungan` VALUES (525, 'http://localhost/compro/index.php', '::1', '2019-10-12', '2019-10-12 08:54:49', '2019-10-12 08:54:49');
INSERT INTO `kunjungan` VALUES (526, 'http://localhost/compro/download', '::1', '2019-10-12', '2019-10-12 09:00:49', '2019-10-12 09:00:49');
INSERT INTO `kunjungan` VALUES (527, 'http://localhost/compro/kontak', '::1', '2019-10-12', '2019-10-12 09:00:54', '2019-10-12 09:00:54');
INSERT INTO `kunjungan` VALUES (528, 'http://localhost/compro/index.php', '::1', '2019-10-12', '2019-10-12 09:07:10', '2019-10-12 09:07:10');
INSERT INTO `kunjungan` VALUES (529, 'http://localhost/compro/index.php', '::1', '2019-10-12', '2019-10-12 09:51:47', '2019-10-12 09:51:47');
INSERT INTO `kunjungan` VALUES (530, 'http://localhost/compro/index.php', '::1', '2019-10-13', '2019-10-13 09:28:41', '2019-10-13 09:28:41');
INSERT INTO `kunjungan` VALUES (531, 'http://localhost/compro/index.php', '::1', '2019-10-15', '2019-10-15 17:16:17', '2019-10-15 17:16:17');
INSERT INTO `kunjungan` VALUES (532, 'http://localhost/compro/index.php', '::1', '2019-10-15', '2019-10-15 17:16:18', '2019-10-15 17:16:18');
INSERT INTO `kunjungan` VALUES (533, 'http://localhost/compro/index.php', '::1', '2019-10-15', '2019-10-15 17:43:20', '2019-10-15 17:43:20');
INSERT INTO `kunjungan` VALUES (534, 'http://localhost/compro/index.php', '::1', '2019-10-15', '2019-10-15 17:43:20', '2019-10-15 17:43:20');
INSERT INTO `kunjungan` VALUES (535, 'http://localhost/compro/index.php', '::1', '2019-10-15', '2019-10-15 17:45:12', '2019-10-15 17:45:12');
INSERT INTO `kunjungan` VALUES (536, 'http://localhost/compro/index.php', '::1', '2019-10-15', '2019-10-15 17:46:45', '2019-10-15 17:46:45');
INSERT INTO `kunjungan` VALUES (537, 'http://localhost/compro/index.php', '::1', '2019-10-15', '2019-10-15 17:57:10', '2019-10-15 17:57:10');
INSERT INTO `kunjungan` VALUES (538, 'http://localhost/compro/index.php', '::1', '2019-10-15', '2019-10-15 17:57:31', '2019-10-15 17:57:31');
INSERT INTO `kunjungan` VALUES (539, 'http://localhost/compro/index.php', '::1', '2019-10-15', '2019-10-15 17:57:59', '2019-10-15 17:57:59');
INSERT INTO `kunjungan` VALUES (540, 'http://localhost/compro/index.php', '::1', '2019-10-15', '2019-10-15 17:58:43', '2019-10-15 17:58:43');
INSERT INTO `kunjungan` VALUES (541, 'http://localhost/compro/index.php', '::1', '2019-10-15', '2019-10-15 17:59:40', '2019-10-15 17:59:40');
INSERT INTO `kunjungan` VALUES (542, 'http://localhost/compro/index.php', '::1', '2019-10-15', '2019-10-15 18:00:01', '2019-10-15 18:00:01');
INSERT INTO `kunjungan` VALUES (543, 'http://localhost/compro/index.php', '::1', '2020-01-04', '2020-01-04 14:50:40', '2020-01-04 14:50:40');
INSERT INTO `kunjungan` VALUES (544, 'http://localhost/compro/index.php', '::1', '2020-01-04', '2020-01-04 15:12:47', '2020-01-04 15:12:47');
INSERT INTO `kunjungan` VALUES (545, 'http://localhost/compro/index.php', '::1', '2020-01-04', '2020-01-04 15:13:46', '2020-01-04 15:13:46');
INSERT INTO `kunjungan` VALUES (546, 'http://localhost/compro/index.php', '::1', '2020-01-04', '2020-01-04 15:14:04', '2020-01-04 15:14:04');
INSERT INTO `kunjungan` VALUES (547, 'http://localhost/compro/index.php', '::1', '2020-01-04', '2020-01-04 15:16:00', '2020-01-04 15:16:00');
INSERT INTO `kunjungan` VALUES (548, 'http://localhost/compro/video', '::1', '2020-01-04', '2020-01-04 15:16:19', '2020-01-04 15:16:19');
INSERT INTO `kunjungan` VALUES (549, 'http://localhost/compro/galeri', '::1', '2020-01-04', '2020-01-04 15:16:36', '2020-01-04 15:16:36');
INSERT INTO `kunjungan` VALUES (550, 'http://localhost/compro/index.php', '::1', '2020-01-04', '2020-01-04 16:07:39', '2020-01-04 16:07:39');
INSERT INTO `kunjungan` VALUES (551, 'http://localhost/compro/index.php', '::1', '2020-01-04', '2020-01-04 16:07:57', '2020-01-04 16:07:57');
INSERT INTO `kunjungan` VALUES (552, 'http://localhost/compro/index.php', '::1', '2020-01-04', '2020-01-04 16:10:48', '2020-01-04 16:10:48');
INSERT INTO `kunjungan` VALUES (553, 'http://localhost/compro/kontak', '::1', '2020-01-04', '2020-01-04 16:10:56', '2020-01-04 16:10:56');
INSERT INTO `kunjungan` VALUES (554, 'http://localhost/compro/index.php', '::1', '2020-01-14', '2020-01-14 10:40:12', '2020-01-14 10:40:12');
INSERT INTO `kunjungan` VALUES (555, 'http://localhost/compro/berita/read/integrasi-data-dan-pengetahuan', '::1', '2020-01-14', '2020-01-14 10:40:20', '2020-01-14 10:40:20');
INSERT INTO `kunjungan` VALUES (556, 'http://localhost/compro/berita/read/integrasi-data-dan-pengetahuan', '::1', '2020-01-14', '2020-01-14 10:41:54', '2020-01-14 10:41:54');
INSERT INTO `kunjungan` VALUES (557, 'http://localhost/compro/index.php', '::1', '2020-02-13', '2020-02-13 07:27:54', '2020-02-13 07:27:54');
INSERT INTO `kunjungan` VALUES (558, 'http://localhost/compro/index.php', '::1', '2020-02-13', '2020-02-13 07:29:39', '2020-02-13 07:29:39');
INSERT INTO `kunjungan` VALUES (559, 'http://localhost/compro/index.php', '::1', '2020-02-13', '2020-02-13 07:34:45', '2020-02-13 07:34:45');
INSERT INTO `kunjungan` VALUES (560, 'http://localhost/compro/index.php', '::1', '2020-02-13', '2020-02-13 07:36:55', '2020-02-13 07:36:55');
INSERT INTO `kunjungan` VALUES (561, 'http://localhost/compro/index.php', '::1', '2020-02-13', '2020-02-13 07:38:36', '2020-02-13 07:38:36');
INSERT INTO `kunjungan` VALUES (562, 'http://localhost/compro/index.php', '::1', '2020-02-13', '2020-02-13 07:40:08', '2020-02-13 07:40:08');
INSERT INTO `kunjungan` VALUES (563, 'http://localhost/compro/index.php', '::1', '2020-02-13', '2020-02-13 07:42:31', '2020-02-13 07:42:31');
INSERT INTO `kunjungan` VALUES (564, 'http://localhost/compro/index.php', '::1', '2020-02-13', '2020-02-13 07:43:19', '2020-02-13 07:43:19');
INSERT INTO `kunjungan` VALUES (565, 'http://localhost/compro/index.php', '::1', '2020-02-13', '2020-02-13 07:45:11', '2020-02-13 07:45:11');
INSERT INTO `kunjungan` VALUES (566, 'http://localhost/compro/galeri', '::1', '2020-02-13', '2020-02-13 07:45:28', '2020-02-13 07:45:28');
INSERT INTO `kunjungan` VALUES (567, 'http://localhost/compro/video', '::1', '2020-02-13', '2020-02-13 07:45:33', '2020-02-13 07:45:33');
INSERT INTO `kunjungan` VALUES (568, 'http://localhost/compro/video', '::1', '2020-02-13', '2020-02-13 07:47:02', '2020-02-13 07:47:02');
INSERT INTO `kunjungan` VALUES (569, 'http://localhost/compro/video', '::1', '2020-02-13', '2020-02-13 07:48:37', '2020-02-13 07:48:37');
INSERT INTO `kunjungan` VALUES (570, 'http://localhost/compro/berita/profil/profil-java-web-media', '::1', '2020-02-13', '2020-02-13 07:48:45', '2020-02-13 07:48:45');
INSERT INTO `kunjungan` VALUES (571, 'http://localhost/compro/download', '::1', '2020-02-13', '2020-02-13 07:48:49', '2020-02-13 07:48:49');
INSERT INTO `kunjungan` VALUES (572, 'http://localhost/compro/download', '::1', '2020-02-13', '2020-02-13 07:51:22', '2020-02-13 07:51:22');
INSERT INTO `kunjungan` VALUES (573, 'http://localhost/compro/galeri', '::1', '2020-02-13', '2020-02-13 07:51:29', '2020-02-13 07:51:29');
INSERT INTO `kunjungan` VALUES (574, 'http://localhost/compro/galeri', '::1', '2020-02-13', '2020-02-13 07:52:22', '2020-02-13 07:52:22');
INSERT INTO `kunjungan` VALUES (575, 'http://localhost/compro/galeri', '::1', '2020-02-13', '2020-02-13 07:53:28', '2020-02-13 07:53:28');
INSERT INTO `kunjungan` VALUES (576, 'http://localhost/compro/galeri', '::1', '2020-02-13', '2020-02-13 07:53:58', '2020-02-13 07:53:58');
INSERT INTO `kunjungan` VALUES (577, 'http://localhost/compro/galeri', '::1', '2020-02-13', '2020-02-13 07:54:31', '2020-02-13 07:54:31');
INSERT INTO `kunjungan` VALUES (578, 'http://localhost/compro/kontak', '::1', '2020-02-13', '2020-02-13 07:54:40', '2020-02-13 07:54:40');
INSERT INTO `kunjungan` VALUES (579, 'http://localhost/compro/kontak', '::1', '2020-02-13', '2020-02-13 07:55:23', '2020-02-13 07:55:23');
INSERT INTO `kunjungan` VALUES (580, 'http://localhost/compro/index.php', '::1', '2020-02-13', '2020-02-13 07:55:36', '2020-02-13 07:55:36');
INSERT INTO `kunjungan` VALUES (581, 'http://localhost/pordasi/index.php', '::1', '2020-03-09', '2020-03-09 19:40:33', '2020-03-09 19:40:33');
INSERT INTO `kunjungan` VALUES (582, 'http://localhost/PORDASI/pordasi/berita/profil/profil-java-web-media', '::1', '2020-03-09', '2020-03-09 19:41:02', '2020-03-09 19:41:02');
INSERT INTO `kunjungan` VALUES (583, 'http://localhost/PORDASI/berita/profil/profil-java-web-media', '::1', '2020-03-09', '2020-03-09 19:41:08', '2020-03-09 19:41:08');
INSERT INTO `kunjungan` VALUES (584, 'http://localhost/PORDASI/index.php', '::1', '2020-03-09', '2020-03-09 19:41:40', '2020-03-09 19:41:40');
INSERT INTO `kunjungan` VALUES (585, 'http://localhost/PORDASI/pordasi/admin/agenda/tambah', '::1', '2020-03-09', '2020-03-09 19:44:34', '2020-03-09 19:44:34');
INSERT INTO `kunjungan` VALUES (586, 'http://localhost/PORDASI/pordasi/admin', '::1', '2020-03-09', '2020-03-09 19:44:42', '2020-03-09 19:44:42');
INSERT INTO `kunjungan` VALUES (587, 'http://localhost/compro/index.php', '::1', '2020-03-09', '2020-03-09 19:59:13', '2020-03-09 19:59:13');
INSERT INTO `kunjungan` VALUES (588, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 20:02:27', '2020-03-09 20:02:27');
INSERT INTO `kunjungan` VALUES (589, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 20:26:54', '2020-03-09 20:26:54');
INSERT INTO `kunjungan` VALUES (590, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 21:17:16', '2020-03-09 21:17:16');
INSERT INTO `kunjungan` VALUES (591, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 21:20:44', '2020-03-09 21:20:44');
INSERT INTO `kunjungan` VALUES (592, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 21:26:55', '2020-03-09 21:26:55');
INSERT INTO `kunjungan` VALUES (593, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 21:27:08', '2020-03-09 21:27:08');
INSERT INTO `kunjungan` VALUES (594, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 21:27:47', '2020-03-09 21:27:47');
INSERT INTO `kunjungan` VALUES (595, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 21:27:59', '2020-03-09 21:27:59');
INSERT INTO `kunjungan` VALUES (596, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 21:28:11', '2020-03-09 21:28:11');
INSERT INTO `kunjungan` VALUES (597, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 21:28:27', '2020-03-09 21:28:27');
INSERT INTO `kunjungan` VALUES (598, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 21:28:45', '2020-03-09 21:28:45');
INSERT INTO `kunjungan` VALUES (599, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 21:29:04', '2020-03-09 21:29:04');
INSERT INTO `kunjungan` VALUES (600, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 21:29:17', '2020-03-09 21:29:17');
INSERT INTO `kunjungan` VALUES (601, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 21:30:37', '2020-03-09 21:30:37');
INSERT INTO `kunjungan` VALUES (602, 'http://localhost/compro-master/kontak', '::1', '2020-03-09', '2020-03-09 21:31:22', '2020-03-09 21:31:22');
INSERT INTO `kunjungan` VALUES (603, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 21:32:02', '2020-03-09 21:32:02');
INSERT INTO `kunjungan` VALUES (604, 'http://localhost/compro-master/berita/layanan/kursus-statistik', '::1', '2020-03-09', '2020-03-09 21:35:27', '2020-03-09 21:35:27');
INSERT INTO `kunjungan` VALUES (605, 'http://localhost/compro-master/galeri', '::1', '2020-03-09', '2020-03-09 21:35:36', '2020-03-09 21:35:36');
INSERT INTO `kunjungan` VALUES (606, 'http://localhost/compro-master/berita/layanan/kursus-statistik', '::1', '2020-03-09', '2020-03-09 21:35:57', '2020-03-09 21:35:57');
INSERT INTO `kunjungan` VALUES (607, 'http://localhost/compro-master/berita/profil/profil-java-web-media', '::1', '2020-03-09', '2020-03-09 21:37:06', '2020-03-09 21:37:06');
INSERT INTO `kunjungan` VALUES (608, 'http://localhost/compro-master/berita/profil/profil-java-web-media', '::1', '2020-03-09', '2020-03-09 21:40:56', '2020-03-09 21:40:56');
INSERT INTO `kunjungan` VALUES (609, 'http://localhost/compro-master/berita/profil/profil-java-web-media', '::1', '2020-03-09', '2020-03-09 21:41:29', '2020-03-09 21:41:29');
INSERT INTO `kunjungan` VALUES (610, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 21:42:49', '2020-03-09 21:42:49');
INSERT INTO `kunjungan` VALUES (611, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:00:26', '2020-03-09 22:00:26');
INSERT INTO `kunjungan` VALUES (612, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:03:09', '2020-03-09 22:03:09');
INSERT INTO `kunjungan` VALUES (613, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:03:18', '2020-03-09 22:03:18');
INSERT INTO `kunjungan` VALUES (614, 'http://localhost/compro-master/berita/kategori/profile', '::1', '2020-03-09', '2020-03-09 22:04:50', '2020-03-09 22:04:50');
INSERT INTO `kunjungan` VALUES (615, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:05:29', '2020-03-09 22:05:29');
INSERT INTO `kunjungan` VALUES (616, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:05:33', '2020-03-09 22:05:33');
INSERT INTO `kunjungan` VALUES (617, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:06:20', '2020-03-09 22:06:20');
INSERT INTO `kunjungan` VALUES (618, 'http://localhost/compro-master/berita/kategori/profile', '::1', '2020-03-09', '2020-03-09 22:06:39', '2020-03-09 22:06:39');
INSERT INTO `kunjungan` VALUES (619, 'http://localhost/compro-master/berita/profil/sejarah', '::1', '2020-03-09', '2020-03-09 22:06:44', '2020-03-09 22:06:44');
INSERT INTO `kunjungan` VALUES (620, 'http://localhost/compro-master/berita/profil/sejarah', '::1', '2020-03-09', '2020-03-09 22:07:44', '2020-03-09 22:07:44');
INSERT INTO `kunjungan` VALUES (621, 'http://localhost/compro-master/berita/profil/visi-misi', '::1', '2020-03-09', '2020-03-09 22:07:49', '2020-03-09 22:07:49');
INSERT INTO `kunjungan` VALUES (622, 'http://localhost/compro-master/berita/profil/visi-misi', '::1', '2020-03-09', '2020-03-09 22:11:43', '2020-03-09 22:11:43');
INSERT INTO `kunjungan` VALUES (623, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:11:48', '2020-03-09 22:11:48');
INSERT INTO `kunjungan` VALUES (624, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:12:05', '2020-03-09 22:12:05');
INSERT INTO `kunjungan` VALUES (625, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:12:32', '2020-03-09 22:12:32');
INSERT INTO `kunjungan` VALUES (626, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:12:56', '2020-03-09 22:12:56');
INSERT INTO `kunjungan` VALUES (627, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:14:03', '2020-03-09 22:14:03');
INSERT INTO `kunjungan` VALUES (628, 'http://localhost/compro-master/berita/profil/visi-misi', '::1', '2020-03-09', '2020-03-09 22:26:01', '2020-03-09 22:26:01');
INSERT INTO `kunjungan` VALUES (629, 'http://localhost/compro-master/berita/profil/sejarah', '::1', '2020-03-09', '2020-03-09 22:26:08', '2020-03-09 22:26:08');
INSERT INTO `kunjungan` VALUES (630, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:26:21', '2020-03-09 22:26:21');
INSERT INTO `kunjungan` VALUES (631, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:28:05', '2020-03-09 22:28:05');
INSERT INTO `kunjungan` VALUES (632, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:29:16', '2020-03-09 22:29:16');
INSERT INTO `kunjungan` VALUES (633, 'http://localhost/compro-master/berita', '::1', '2020-03-09', '2020-03-09 22:29:37', '2020-03-09 22:29:37');
INSERT INTO `kunjungan` VALUES (634, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:34:57', '2020-03-09 22:34:57');
INSERT INTO `kunjungan` VALUES (635, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:40:12', '2020-03-09 22:40:12');
INSERT INTO `kunjungan` VALUES (636, 'http://localhost/compro-master/berita/profil/stukrur-organisasi', '::1', '2020-03-09', '2020-03-09 22:40:16', '2020-03-09 22:40:16');
INSERT INTO `kunjungan` VALUES (637, 'http://localhost/compro-master/berita/profil/stukrur-organisasi', '::1', '2020-03-09', '2020-03-09 22:41:42', '2020-03-09 22:41:42');
INSERT INTO `kunjungan` VALUES (638, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:41:45', '2020-03-09 22:41:45');
INSERT INTO `kunjungan` VALUES (639, 'http://localhost/compro-master/video', '::1', '2020-03-09', '2020-03-09 22:49:29', '2020-03-09 22:49:29');
INSERT INTO `kunjungan` VALUES (640, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:54:49', '2020-03-09 22:54:49');
INSERT INTO `kunjungan` VALUES (641, 'http://localhost/compro-master/agenda', '::1', '2020-03-09', '2020-03-09 22:55:52', '2020-03-09 22:55:52');
INSERT INTO `kunjungan` VALUES (642, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:57:23', '2020-03-09 22:57:23');
INSERT INTO `kunjungan` VALUES (643, 'http://localhost/compro-master/index.php', '::1', '2020-03-09', '2020-03-09 22:59:30', '2020-03-09 22:59:30');
INSERT INTO `kunjungan` VALUES (644, 'http://localhost/compro-master/agenda', '::1', '2020-03-09', '2020-03-09 22:59:34', '2020-03-09 22:59:34');
INSERT INTO `kunjungan` VALUES (645, 'http://localhost/compro-master/agenda/detail/1', '::1', '2020-03-09', '2020-03-09 22:59:55', '2020-03-09 22:59:55');
INSERT INTO `kunjungan` VALUES (646, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:07:15', '2020-03-10 16:07:15');
INSERT INTO `kunjungan` VALUES (647, 'http://localhost/compro-master/agenda', '::1', '2020-03-10', '2020-03-10 16:07:55', '2020-03-10 16:07:55');
INSERT INTO `kunjungan` VALUES (648, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:09:13', '2020-03-10 16:09:13');
INSERT INTO `kunjungan` VALUES (649, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:12:27', '2020-03-10 16:12:27');
INSERT INTO `kunjungan` VALUES (650, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:13:56', '2020-03-10 16:13:56');
INSERT INTO `kunjungan` VALUES (651, 'http://localhost/compro-master/agenda', '::1', '2020-03-10', '2020-03-10 16:14:52', '2020-03-10 16:14:52');
INSERT INTO `kunjungan` VALUES (652, 'http://localhost/compro-master/agenda', '::1', '2020-03-10', '2020-03-10 16:15:26', '2020-03-10 16:15:26');
INSERT INTO `kunjungan` VALUES (653, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:15:46', '2020-03-10 16:15:46');
INSERT INTO `kunjungan` VALUES (654, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:16:12', '2020-03-10 16:16:12');
INSERT INTO `kunjungan` VALUES (655, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:17:15', '2020-03-10 16:17:15');
INSERT INTO `kunjungan` VALUES (656, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:17:36', '2020-03-10 16:17:36');
INSERT INTO `kunjungan` VALUES (657, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:18:05', '2020-03-10 16:18:05');
INSERT INTO `kunjungan` VALUES (658, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:18:14', '2020-03-10 16:18:14');
INSERT INTO `kunjungan` VALUES (659, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:18:32', '2020-03-10 16:18:32');
INSERT INTO `kunjungan` VALUES (660, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:19:07', '2020-03-10 16:19:07');
INSERT INTO `kunjungan` VALUES (661, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:19:29', '2020-03-10 16:19:29');
INSERT INTO `kunjungan` VALUES (662, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:20:36', '2020-03-10 16:20:36');
INSERT INTO `kunjungan` VALUES (663, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:21:22', '2020-03-10 16:21:22');
INSERT INTO `kunjungan` VALUES (664, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:22:13', '2020-03-10 16:22:13');
INSERT INTO `kunjungan` VALUES (665, 'http://localhost/compro-master/agenda/detail/1', '::1', '2020-03-10', '2020-03-10 16:22:22', '2020-03-10 16:22:22');
INSERT INTO `kunjungan` VALUES (666, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:22:28', '2020-03-10 16:22:28');
INSERT INTO `kunjungan` VALUES (667, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:23:57', '2020-03-10 16:23:57');
INSERT INTO `kunjungan` VALUES (668, 'http://localhost/compro-master/berita/read/cabang-archery', '::1', '2020-03-10', '2020-03-10 16:24:09', '2020-03-10 16:24:09');
INSERT INTO `kunjungan` VALUES (669, 'http://localhost/compro-master/berita/read/cabang-archery', '::1', '2020-03-10', '2020-03-10 16:25:15', '2020-03-10 16:25:15');
INSERT INTO `kunjungan` VALUES (670, 'http://localhost/compro-master/berita/read/cabang-archery', '::1', '2020-03-10', '2020-03-10 16:25:17', '2020-03-10 16:25:17');
INSERT INTO `kunjungan` VALUES (671, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:25:19', '2020-03-10 16:25:19');
INSERT INTO `kunjungan` VALUES (672, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:25:22', '2020-03-10 16:25:22');
INSERT INTO `kunjungan` VALUES (673, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:27:11', '2020-03-10 16:27:11');
INSERT INTO `kunjungan` VALUES (674, 'http://localhost/compro-master/berita/layanan/cabang-archery', '::1', '2020-03-10', '2020-03-10 16:27:23', '2020-03-10 16:27:23');
INSERT INTO `kunjungan` VALUES (675, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:27:27', '2020-03-10 16:27:27');
INSERT INTO `kunjungan` VALUES (676, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:28:27', '2020-03-10 16:28:27');
INSERT INTO `kunjungan` VALUES (677, 'http://localhost/compro-master/berita/kategori/kegiatan', '::1', '2020-03-10', '2020-03-10 16:28:59', '2020-03-10 16:28:59');
INSERT INTO `kunjungan` VALUES (678, 'http://localhost/compro-master/berita', '::1', '2020-03-10', '2020-03-10 16:29:06', '2020-03-10 16:29:06');
INSERT INTO `kunjungan` VALUES (679, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:29:11', '2020-03-10 16:29:11');
INSERT INTO `kunjungan` VALUES (680, 'http://localhost/compro-master/agenda', '::1', '2020-03-10', '2020-03-10 16:33:50', '2020-03-10 16:33:50');
INSERT INTO `kunjungan` VALUES (681, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:33:58', '2020-03-10 16:33:58');
INSERT INTO `kunjungan` VALUES (682, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 16:47:35', '2020-03-10 16:47:35');
INSERT INTO `kunjungan` VALUES (683, 'http://localhost/compro-master/agenda', '::1', '2020-03-10', '2020-03-10 16:48:50', '2020-03-10 16:48:50');
INSERT INTO `kunjungan` VALUES (684, 'http://localhost/compro-master/berita/kategori/kegiatan', '::1', '2020-03-10', '2020-03-10 16:48:58', '2020-03-10 16:48:58');
INSERT INTO `kunjungan` VALUES (685, 'http://localhost/compro-master/berita/profil/stukrur-organisasi', '::1', '2020-03-10', '2020-03-10 16:49:06', '2020-03-10 16:49:06');
INSERT INTO `kunjungan` VALUES (686, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 20:33:39', '2020-03-10 20:33:39');
INSERT INTO `kunjungan` VALUES (687, 'http://localhost/compro-master/video', '::1', '2020-03-10', '2020-03-10 20:34:09', '2020-03-10 20:34:09');
INSERT INTO `kunjungan` VALUES (688, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 20:53:16', '2020-03-10 20:53:16');
INSERT INTO `kunjungan` VALUES (689, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 20:53:17', '2020-03-10 20:53:17');
INSERT INTO `kunjungan` VALUES (690, 'http://localhost/compro-master/video', '::1', '2020-03-10', '2020-03-10 20:55:49', '2020-03-10 20:55:49');
INSERT INTO `kunjungan` VALUES (691, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 20:59:57', '2020-03-10 20:59:57');
INSERT INTO `kunjungan` VALUES (692, 'http://localhost/compro-master/index.php', '::1', '2020-03-10', '2020-03-10 21:00:07', '2020-03-10 21:00:07');
INSERT INTO `kunjungan` VALUES (693, 'http://localhost/compro-master/index.php', '::1', '2020-03-11', '2020-03-11 13:59:19', '2020-03-11 13:59:19');
INSERT INTO `kunjungan` VALUES (694, 'http://localhost/compro-master/galeri', '::1', '2020-03-11', '2020-03-11 14:35:09', '2020-03-11 14:35:09');
INSERT INTO `kunjungan` VALUES (695, 'http://localhost/compro-master/alogin', '::1', '2020-03-11', '2020-03-11 14:35:21', '2020-03-11 14:35:21');
INSERT INTO `kunjungan` VALUES (696, 'http://localhost/compro-master/index.php', '::1', '2020-03-11', '2020-03-11 14:37:02', '2020-03-11 14:37:02');
INSERT INTO `kunjungan` VALUES (697, 'http://localhost/compro-master/galeri', '::1', '2020-03-11', '2020-03-11 14:37:07', '2020-03-11 14:37:07');
INSERT INTO `kunjungan` VALUES (698, 'http://localhost/compro-master/index.php', '::1', '2020-03-11', '2020-03-11 14:48:11', '2020-03-11 14:48:11');
INSERT INTO `kunjungan` VALUES (699, 'http://localhost/compro-master/galeri', '::1', '2020-03-11', '2020-03-11 14:48:16', '2020-03-11 14:48:16');
INSERT INTO `kunjungan` VALUES (700, 'http://localhost/compro-master/galeri', '::1', '2020-03-11', '2020-03-11 14:48:44', '2020-03-11 14:48:44');
INSERT INTO `kunjungan` VALUES (701, 'http://localhost/compro-master/index.php', '::1', '2020-03-11', '2020-03-11 16:58:31', '2020-03-11 16:58:31');
INSERT INTO `kunjungan` VALUES (702, 'http://localhost/compro-master/berita', '::1', '2020-03-11', '2020-03-11 16:59:39', '2020-03-11 16:59:39');
INSERT INTO `kunjungan` VALUES (703, 'http://localhost/compro-master/berita/kategori/kegiatan', '::1', '2020-03-11', '2020-03-11 16:59:43', '2020-03-11 16:59:43');
INSERT INTO `kunjungan` VALUES (704, 'http://localhost/compro-master/berita/layanan', '::1', '2020-03-11', '2020-03-11 16:59:57', '2020-03-11 16:59:57');
INSERT INTO `kunjungan` VALUES (705, 'http://localhost/compro-master/berita/layanan/kursus-statistic', '::1', '2020-03-11', '2020-03-11 17:00:14', '2020-03-11 17:00:14');
INSERT INTO `kunjungan` VALUES (706, 'http://localhost/compro-master/berita/layanan/kursus-statistik', '::1', '2020-03-11', '2020-03-11 17:00:54', '2020-03-11 17:00:54');
INSERT INTO `kunjungan` VALUES (707, 'http://localhost:8888/compro/index.php', '127.0.0.1', '2020-03-11', '2020-03-11 17:18:48', '2020-03-11 17:18:48');
INSERT INTO `kunjungan` VALUES (708, 'http://localhost:8888/compro/index.php', '::1', '2020-03-11', '2020-03-11 17:19:49', '2020-03-11 17:19:49');
INSERT INTO `kunjungan` VALUES (709, 'http://localhost:8888/compro/index.php', '::1', '2020-03-11', '2020-03-11 17:21:27', '2020-03-11 17:21:27');
INSERT INTO `kunjungan` VALUES (710, 'http://localhost:8888/compro/index.php', '::1', '2020-03-11', '2020-03-11 17:22:00', '2020-03-11 17:22:00');
INSERT INTO `kunjungan` VALUES (711, 'http://localhost:8888/compro/index.php', '::1', '2020-03-11', '2020-03-11 17:23:42', '2020-03-11 17:23:42');
INSERT INTO `kunjungan` VALUES (712, 'http://localhost:8888/compro/index.php', '::1', '2020-03-11', '2020-03-11 17:38:14', '2020-03-11 17:38:14');
INSERT INTO `kunjungan` VALUES (713, 'http://localhost:8888/compro/index.php', '::1', '2020-03-11', '2020-03-11 17:38:57', '2020-03-11 17:38:57');
INSERT INTO `kunjungan` VALUES (714, 'http://localhost:8888/compro/index.php', '::1', '2020-03-11', '2020-03-11 17:39:00', '2020-03-11 17:39:00');
INSERT INTO `kunjungan` VALUES (715, 'http://localhost:8888/compro/index.php', '::1', '2020-03-11', '2020-03-11 17:39:06', '2020-03-11 17:39:06');
INSERT INTO `kunjungan` VALUES (716, 'http://localhost:8888/compro/index.php', '::1', '2020-03-11', '2020-03-11 17:39:07', '2020-03-11 17:39:07');
INSERT INTO `kunjungan` VALUES (717, 'http://localhost:8888/compro/index.php', '::1', '2020-03-11', '2020-03-11 17:39:17', '2020-03-11 17:39:17');
INSERT INTO `kunjungan` VALUES (718, 'http://localhost:8888/compro/index.php', '::1', '2020-03-11', '2020-03-11 17:55:52', '2020-03-11 17:55:52');
INSERT INTO `kunjungan` VALUES (719, 'http://localhost:8888/compro/index.php', '::1', '2020-03-11', '2020-03-11 17:56:46', '2020-03-11 17:56:46');
INSERT INTO `kunjungan` VALUES (720, 'http://localhost:8888/compro/index.php', '::1', '2020-03-12', '2020-03-12 11:18:52', '2020-03-12 11:18:52');
INSERT INTO `kunjungan` VALUES (721, 'http://localhost:8888/compro/index.php', '::1', '2020-03-12', '2020-03-12 11:20:16', '2020-03-12 11:20:16');
INSERT INTO `kunjungan` VALUES (722, 'http://localhost:8888/compro/galeri', '::1', '2020-03-12', '2020-03-12 11:20:21', '2020-03-12 11:20:21');
INSERT INTO `kunjungan` VALUES (723, 'http://localhost:8888/compro/galeri', '::1', '2020-03-12', '2020-03-12 11:22:36', '2020-03-12 11:22:36');
INSERT INTO `kunjungan` VALUES (724, 'http://localhost:8888/compro/video', '::1', '2020-03-12', '2020-03-12 11:23:06', '2020-03-12 11:23:06');
INSERT INTO `kunjungan` VALUES (725, 'http://localhost:8888/compro/agenda', '::1', '2020-03-12', '2020-03-12 11:23:10', '2020-03-12 11:23:10');
INSERT INTO `kunjungan` VALUES (726, 'http://localhost:8888/compro/berita', '::1', '2020-03-12', '2020-03-12 11:23:19', '2020-03-12 11:23:19');
INSERT INTO `kunjungan` VALUES (727, 'http://localhost:8888/compro/berita/read/perlombaan-cabang-archery', '::1', '2020-03-12', '2020-03-12 11:23:25', '2020-03-12 11:23:25');
INSERT INTO `kunjungan` VALUES (728, 'http://localhost:8888/compro/index.php', '::1', '2020-03-12', '2020-03-12 11:23:36', '2020-03-12 11:23:36');
INSERT INTO `kunjungan` VALUES (729, 'http://localhost:8888/compro/berita/profil/sejarah', '::1', '2020-03-12', '2020-03-12 11:23:54', '2020-03-12 11:23:54');
INSERT INTO `kunjungan` VALUES (730, 'http://localhost:8888/compro/berita/profil/visi-misi', '::1', '2020-03-12', '2020-03-12 11:24:00', '2020-03-12 11:24:00');
INSERT INTO `kunjungan` VALUES (731, 'http://localhost:8888/compro/index.php', '127.0.0.1', '2020-03-12', '2020-03-12 21:23:51', '2020-03-12 21:23:51');
INSERT INTO `kunjungan` VALUES (732, 'http://localhost:8888/compro/berita/profil/sejarah', '::1', '2020-03-12', '2020-03-12 21:24:30', '2020-03-12 21:24:30');
INSERT INTO `kunjungan` VALUES (733, 'http://localhost:8888/compro/berita/profil/visi-misi', '::1', '2020-03-12', '2020-03-12 21:24:34', '2020-03-12 21:24:34');
INSERT INTO `kunjungan` VALUES (734, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-12', '2020-03-12 21:24:38', '2020-03-12 21:24:38');
INSERT INTO `kunjungan` VALUES (735, 'http://localhost:8888/compro/index.php', '::1', '2020-03-12', '2020-03-12 21:24:44', '2020-03-12 21:24:44');
INSERT INTO `kunjungan` VALUES (736, 'http://localhost:8888/compro/berita/profil/sejarah', '::1', '2020-03-12', '2020-03-12 21:25:07', '2020-03-12 21:25:07');
INSERT INTO `kunjungan` VALUES (737, 'http://localhost:8888/compro/galeri', '::1', '2020-03-12', '2020-03-12 21:25:11', '2020-03-12 21:25:11');
INSERT INTO `kunjungan` VALUES (738, 'http://localhost:8888/compro/video', '::1', '2020-03-12', '2020-03-12 21:25:16', '2020-03-12 21:25:16');
INSERT INTO `kunjungan` VALUES (739, 'http://localhost:8888/compro/index.php', '::1', '2020-03-12', '2020-03-12 21:25:25', '2020-03-12 21:25:25');
INSERT INTO `kunjungan` VALUES (740, 'http://localhost:8888/compro/index.php', '::1', '2020-03-12', '2020-03-12 21:26:10', '2020-03-12 21:26:10');
INSERT INTO `kunjungan` VALUES (741, 'http://localhost:8888/compro/galeri', '::1', '2020-03-12', '2020-03-12 21:26:21', '2020-03-12 21:26:21');
INSERT INTO `kunjungan` VALUES (742, 'http://localhost:8888/compro/video', '::1', '2020-03-12', '2020-03-12 21:26:25', '2020-03-12 21:26:25');
INSERT INTO `kunjungan` VALUES (743, 'http://localhost:8888/compro/berita/profil/sejarah', '::1', '2020-03-12', '2020-03-12 21:26:31', '2020-03-12 21:26:31');
INSERT INTO `kunjungan` VALUES (744, 'http://localhost:8888/compro/berita/layanan/cabang-archery', '::1', '2020-03-12', '2020-03-12 21:26:35', '2020-03-12 21:26:35');
INSERT INTO `kunjungan` VALUES (745, 'http://localhost:8888/compro/index.php', '::1', '2020-03-12', '2020-03-12 21:26:40', '2020-03-12 21:26:40');
INSERT INTO `kunjungan` VALUES (746, 'http://localhost:8888/compro/index.php', '::1', '2020-03-12', '2020-03-12 21:26:43', '2020-03-12 21:26:43');
INSERT INTO `kunjungan` VALUES (747, 'http://localhost:8888/compro/berita/layanan/cabang-archery', '::1', '2020-03-12', '2020-03-12 21:27:23', '2020-03-12 21:27:23');
INSERT INTO `kunjungan` VALUES (748, 'http://localhost:8888/compro/index.php', '::1', '2020-03-12', '2020-03-12 21:28:09', '2020-03-12 21:28:09');
INSERT INTO `kunjungan` VALUES (749, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-12', '2020-03-12 21:28:29', '2020-03-12 21:28:29');
INSERT INTO `kunjungan` VALUES (750, 'http://localhost:8888/compro/index.php', '::1', '2020-03-12', '2020-03-12 21:31:51', '2020-03-12 21:31:51');
INSERT INTO `kunjungan` VALUES (751, 'http://localhost:8888/compro/index.php', '::1', '2020-03-12', '2020-03-12 21:32:27', '2020-03-12 21:32:27');
INSERT INTO `kunjungan` VALUES (752, 'http://localhost:8888/compro/galeri', '::1', '2020-03-12', '2020-03-12 21:32:37', '2020-03-12 21:32:37');
INSERT INTO `kunjungan` VALUES (753, 'http://localhost:8888/compro/video', '::1', '2020-03-12', '2020-03-12 21:32:46', '2020-03-12 21:32:46');
INSERT INTO `kunjungan` VALUES (754, 'http://localhost:8888/compro/video/read/5', '::1', '2020-03-12', '2020-03-12 21:32:56', '2020-03-12 21:32:56');
INSERT INTO `kunjungan` VALUES (755, 'http://localhost:8888/compro/index.php', '::1', '2020-03-12', '2020-03-12 21:33:03', '2020-03-12 21:33:03');
INSERT INTO `kunjungan` VALUES (756, 'http://localhost:8888/compro/index.php', '::1', '2020-03-13', '2020-03-13 09:32:03', '2020-03-13 09:32:03');
INSERT INTO `kunjungan` VALUES (757, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-13', '2020-03-13 09:33:42', '2020-03-13 09:33:42');
INSERT INTO `kunjungan` VALUES (758, 'http://localhost:8888/compro/index.php', '::1', '2020-03-13', '2020-03-13 09:33:49', '2020-03-13 09:33:49');
INSERT INTO `kunjungan` VALUES (759, 'http://localhost:8888/compro/kontak', '::1', '2020-03-13', '2020-03-13 09:37:03', '2020-03-13 09:37:03');
INSERT INTO `kunjungan` VALUES (760, 'http://localhost:8888/compro/index.php', '::1', '2020-03-13', '2020-03-13 09:37:11', '2020-03-13 09:37:11');
INSERT INTO `kunjungan` VALUES (761, 'http://localhost:8888/compro/index.php', '::1', '2020-03-13', '2020-03-13 23:49:25', '2020-03-13 23:49:25');
INSERT INTO `kunjungan` VALUES (762, 'http://localhost:8888/compro/index.php', '::1', '2020-03-13', '2020-03-13 23:54:23', '2020-03-13 23:54:23');
INSERT INTO `kunjungan` VALUES (763, 'http://localhost:8888/compro/index.php', '::1', '2020-03-13', '2020-03-13 23:54:23', '2020-03-13 23:54:23');
INSERT INTO `kunjungan` VALUES (764, 'http://localhost:8888/compro/berita/profil/sejarah', '::1', '2020-03-14', '2020-03-14 00:01:41', '2020-03-14 00:01:41');
INSERT INTO `kunjungan` VALUES (765, 'http://localhost:8888/compro/galeri', '::1', '2020-03-14', '2020-03-14 00:02:59', '2020-03-14 00:02:59');
INSERT INTO `kunjungan` VALUES (766, 'http://localhost:8888/compro/galeri', '::1', '2020-03-14', '2020-03-14 00:03:56', '2020-03-14 00:03:56');
INSERT INTO `kunjungan` VALUES (767, 'http://localhost:8888/compro/index.php', '::1', '2020-03-14', '2020-03-14 00:05:05', '2020-03-14 00:05:05');
INSERT INTO `kunjungan` VALUES (768, 'http://localhost:8888/compro/index.php', '::1', '2020-03-14', '2020-03-14 15:06:39', '2020-03-14 15:06:39');
INSERT INTO `kunjungan` VALUES (769, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 12:54:52', '2020-03-15 12:54:52');
INSERT INTO `kunjungan` VALUES (770, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:04:30', '2020-03-15 13:04:30');
INSERT INTO `kunjungan` VALUES (771, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:04:54', '2020-03-15 13:04:54');
INSERT INTO `kunjungan` VALUES (772, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:05:20', '2020-03-15 13:05:20');
INSERT INTO `kunjungan` VALUES (773, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:05:35', '2020-03-15 13:05:35');
INSERT INTO `kunjungan` VALUES (774, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:06:16', '2020-03-15 13:06:16');
INSERT INTO `kunjungan` VALUES (775, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:06:33', '2020-03-15 13:06:33');
INSERT INTO `kunjungan` VALUES (776, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:06:57', '2020-03-15 13:06:57');
INSERT INTO `kunjungan` VALUES (777, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:17:39', '2020-03-15 13:17:39');
INSERT INTO `kunjungan` VALUES (778, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:18:07', '2020-03-15 13:18:07');
INSERT INTO `kunjungan` VALUES (779, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:18:26', '2020-03-15 13:18:26');
INSERT INTO `kunjungan` VALUES (780, 'http://localhost:8888/compro/kontak', '::1', '2020-03-15', '2020-03-15 13:19:00', '2020-03-15 13:19:00');
INSERT INTO `kunjungan` VALUES (781, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:19:11', '2020-03-15 13:19:11');
INSERT INTO `kunjungan` VALUES (782, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:20:57', '2020-03-15 13:20:57');
INSERT INTO `kunjungan` VALUES (783, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:30:02', '2020-03-15 13:30:02');
INSERT INTO `kunjungan` VALUES (784, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:33:30', '2020-03-15 13:33:30');
INSERT INTO `kunjungan` VALUES (785, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:34:44', '2020-03-15 13:34:44');
INSERT INTO `kunjungan` VALUES (786, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:35:03', '2020-03-15 13:35:03');
INSERT INTO `kunjungan` VALUES (787, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:35:11', '2020-03-15 13:35:11');
INSERT INTO `kunjungan` VALUES (788, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:37:02', '2020-03-15 13:37:02');
INSERT INTO `kunjungan` VALUES (789, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:37:24', '2020-03-15 13:37:24');
INSERT INTO `kunjungan` VALUES (790, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:37:51', '2020-03-15 13:37:51');
INSERT INTO `kunjungan` VALUES (791, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:38:16', '2020-03-15 13:38:16');
INSERT INTO `kunjungan` VALUES (792, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:38:30', '2020-03-15 13:38:30');
INSERT INTO `kunjungan` VALUES (793, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:38:49', '2020-03-15 13:38:49');
INSERT INTO `kunjungan` VALUES (794, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:39:54', '2020-03-15 13:39:54');
INSERT INTO `kunjungan` VALUES (795, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:40:12', '2020-03-15 13:40:12');
INSERT INTO `kunjungan` VALUES (796, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:41:09', '2020-03-15 13:41:09');
INSERT INTO `kunjungan` VALUES (797, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:41:27', '2020-03-15 13:41:27');
INSERT INTO `kunjungan` VALUES (798, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:42:40', '2020-03-15 13:42:40');
INSERT INTO `kunjungan` VALUES (799, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:43:47', '2020-03-15 13:43:47');
INSERT INTO `kunjungan` VALUES (800, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:44:01', '2020-03-15 13:44:01');
INSERT INTO `kunjungan` VALUES (801, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:44:21', '2020-03-15 13:44:21');
INSERT INTO `kunjungan` VALUES (802, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:44:33', '2020-03-15 13:44:33');
INSERT INTO `kunjungan` VALUES (803, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:45:54', '2020-03-15 13:45:54');
INSERT INTO `kunjungan` VALUES (804, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:46:26', '2020-03-15 13:46:26');
INSERT INTO `kunjungan` VALUES (805, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:46:39', '2020-03-15 13:46:39');
INSERT INTO `kunjungan` VALUES (806, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:47:12', '2020-03-15 13:47:12');
INSERT INTO `kunjungan` VALUES (807, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:47:33', '2020-03-15 13:47:33');
INSERT INTO `kunjungan` VALUES (808, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:48:09', '2020-03-15 13:48:09');
INSERT INTO `kunjungan` VALUES (809, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:49:28', '2020-03-15 13:49:28');
INSERT INTO `kunjungan` VALUES (810, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:49:56', '2020-03-15 13:49:56');
INSERT INTO `kunjungan` VALUES (811, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:50:52', '2020-03-15 13:50:52');
INSERT INTO `kunjungan` VALUES (812, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:51:34', '2020-03-15 13:51:34');
INSERT INTO `kunjungan` VALUES (813, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:52:04', '2020-03-15 13:52:04');
INSERT INTO `kunjungan` VALUES (814, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:53:43', '2020-03-15 13:53:43');
INSERT INTO `kunjungan` VALUES (815, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:53:54', '2020-03-15 13:53:54');
INSERT INTO `kunjungan` VALUES (816, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:55:15', '2020-03-15 13:55:15');
INSERT INTO `kunjungan` VALUES (817, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:57:00', '2020-03-15 13:57:00');
INSERT INTO `kunjungan` VALUES (818, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 13:57:35', '2020-03-15 13:57:35');
INSERT INTO `kunjungan` VALUES (819, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 14:45:59', '2020-03-15 14:45:59');
INSERT INTO `kunjungan` VALUES (820, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 14:46:27', '2020-03-15 14:46:27');
INSERT INTO `kunjungan` VALUES (821, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 14:47:18', '2020-03-15 14:47:18');
INSERT INTO `kunjungan` VALUES (822, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 14:48:26', '2020-03-15 14:48:26');
INSERT INTO `kunjungan` VALUES (823, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 14:48:46', '2020-03-15 14:48:46');
INSERT INTO `kunjungan` VALUES (824, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 14:50:41', '2020-03-15 14:50:41');
INSERT INTO `kunjungan` VALUES (825, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 14:51:00', '2020-03-15 14:51:00');
INSERT INTO `kunjungan` VALUES (826, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 14:51:14', '2020-03-15 14:51:14');
INSERT INTO `kunjungan` VALUES (827, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 14:52:41', '2020-03-15 14:52:41');
INSERT INTO `kunjungan` VALUES (828, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 14:52:50', '2020-03-15 14:52:50');
INSERT INTO `kunjungan` VALUES (829, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 14:53:28', '2020-03-15 14:53:28');
INSERT INTO `kunjungan` VALUES (830, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 14:53:42', '2020-03-15 14:53:42');
INSERT INTO `kunjungan` VALUES (831, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 14:56:50', '2020-03-15 14:56:50');
INSERT INTO `kunjungan` VALUES (832, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 14:57:17', '2020-03-15 14:57:17');
INSERT INTO `kunjungan` VALUES (833, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 14:57:52', '2020-03-15 14:57:52');
INSERT INTO `kunjungan` VALUES (834, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 14:59:48', '2020-03-15 14:59:48');
INSERT INTO `kunjungan` VALUES (835, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 15:11:54', '2020-03-15 15:11:54');
INSERT INTO `kunjungan` VALUES (836, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 15:12:21', '2020-03-15 15:12:21');
INSERT INTO `kunjungan` VALUES (837, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 15:12:49', '2020-03-15 15:12:49');
INSERT INTO `kunjungan` VALUES (838, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 15:13:49', '2020-03-15 15:13:49');
INSERT INTO `kunjungan` VALUES (839, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 15:14:20', '2020-03-15 15:14:20');
INSERT INTO `kunjungan` VALUES (840, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 15:15:07', '2020-03-15 15:15:07');
INSERT INTO `kunjungan` VALUES (841, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 15:15:49', '2020-03-15 15:15:49');
INSERT INTO `kunjungan` VALUES (842, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 15:21:27', '2020-03-15 15:21:27');
INSERT INTO `kunjungan` VALUES (843, 'http://localhost:8888/compro/berita/profil/asdasd', '::1', '2020-03-15', '2020-03-15 15:21:33', '2020-03-15 15:21:33');
INSERT INTO `kunjungan` VALUES (844, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 15:21:41', '2020-03-15 15:21:41');
INSERT INTO `kunjungan` VALUES (845, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 15:46:08', '2020-03-15 15:46:08');
INSERT INTO `kunjungan` VALUES (846, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 16:36:45', '2020-03-15 16:36:45');
INSERT INTO `kunjungan` VALUES (847, 'http://localhost:8888/compro/galeri', '::1', '2020-03-15', '2020-03-15 16:37:00', '2020-03-15 16:37:00');
INSERT INTO `kunjungan` VALUES (848, 'http://localhost:8888/compro/kontak', '::1', '2020-03-15', '2020-03-15 17:22:51', '2020-03-15 17:22:51');
INSERT INTO `kunjungan` VALUES (849, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 17:24:00', '2020-03-15 17:24:00');
INSERT INTO `kunjungan` VALUES (850, 'http://localhost:8888/compro/kontak', '::1', '2020-03-15', '2020-03-15 17:24:22', '2020-03-15 17:24:22');
INSERT INTO `kunjungan` VALUES (851, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:26:13', '2020-03-15 17:26:13');
INSERT INTO `kunjungan` VALUES (852, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:27:19', '2020-03-15 17:27:19');
INSERT INTO `kunjungan` VALUES (853, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:27:41', '2020-03-15 17:27:41');
INSERT INTO `kunjungan` VALUES (854, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 17:27:46', '2020-03-15 17:27:46');
INSERT INTO `kunjungan` VALUES (855, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 17:28:39', '2020-03-15 17:28:39');
INSERT INTO `kunjungan` VALUES (856, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 17:28:47', '2020-03-15 17:28:47');
INSERT INTO `kunjungan` VALUES (857, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 17:29:15', '2020-03-15 17:29:15');
INSERT INTO `kunjungan` VALUES (858, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:29:19', '2020-03-15 17:29:19');
INSERT INTO `kunjungan` VALUES (859, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 17:30:39', '2020-03-15 17:30:39');
INSERT INTO `kunjungan` VALUES (860, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:31:20', '2020-03-15 17:31:20');
INSERT INTO `kunjungan` VALUES (861, 'http://localhost:8888/compro/kontak', '::1', '2020-03-15', '2020-03-15 17:31:25', '2020-03-15 17:31:25');
INSERT INTO `kunjungan` VALUES (862, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:32:35', '2020-03-15 17:32:35');
INSERT INTO `kunjungan` VALUES (863, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:33:21', '2020-03-15 17:33:21');
INSERT INTO `kunjungan` VALUES (864, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:33:32', '2020-03-15 17:33:32');
INSERT INTO `kunjungan` VALUES (865, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:33:58', '2020-03-15 17:33:58');
INSERT INTO `kunjungan` VALUES (866, 'http://localhost:8888/compro/kontak', '::1', '2020-03-15', '2020-03-15 17:34:17', '2020-03-15 17:34:17');
INSERT INTO `kunjungan` VALUES (867, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:34:20', '2020-03-15 17:34:20');
INSERT INTO `kunjungan` VALUES (868, 'http://localhost:8888/compro/kontak', '::1', '2020-03-15', '2020-03-15 17:34:23', '2020-03-15 17:34:23');
INSERT INTO `kunjungan` VALUES (869, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:34:28', '2020-03-15 17:34:28');
INSERT INTO `kunjungan` VALUES (870, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 17:34:29', '2020-03-15 17:34:29');
INSERT INTO `kunjungan` VALUES (871, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 17:34:38', '2020-03-15 17:34:38');
INSERT INTO `kunjungan` VALUES (872, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:34:40', '2020-03-15 17:34:40');
INSERT INTO `kunjungan` VALUES (873, 'http://localhost:8888/compro/kontak', '::1', '2020-03-15', '2020-03-15 17:34:44', '2020-03-15 17:34:44');
INSERT INTO `kunjungan` VALUES (874, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:34:47', '2020-03-15 17:34:47');
INSERT INTO `kunjungan` VALUES (875, 'http://localhost:8888/compro/berita/profil/stukrur-organisasi', '::1', '2020-03-15', '2020-03-15 17:34:50', '2020-03-15 17:34:50');
INSERT INTO `kunjungan` VALUES (876, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:35:40', '2020-03-15 17:35:40');
INSERT INTO `kunjungan` VALUES (877, 'http://localhost:8888/compro/berita/profil/visi-misi', '::1', '2020-03-15', '2020-03-15 17:36:06', '2020-03-15 17:36:06');
INSERT INTO `kunjungan` VALUES (878, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:36:29', '2020-03-15 17:36:29');
INSERT INTO `kunjungan` VALUES (879, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:37:25', '2020-03-15 17:37:25');
INSERT INTO `kunjungan` VALUES (880, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:37:38', '2020-03-15 17:37:38');
INSERT INTO `kunjungan` VALUES (881, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:37:44', '2020-03-15 17:37:44');
INSERT INTO `kunjungan` VALUES (882, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:37:51', '2020-03-15 17:37:51');
INSERT INTO `kunjungan` VALUES (883, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:38:10', '2020-03-15 17:38:10');
INSERT INTO `kunjungan` VALUES (884, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:38:20', '2020-03-15 17:38:20');
INSERT INTO `kunjungan` VALUES (885, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:38:42', '2020-03-15 17:38:42');
INSERT INTO `kunjungan` VALUES (886, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:38:59', '2020-03-15 17:38:59');
INSERT INTO `kunjungan` VALUES (887, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:39:51', '2020-03-15 17:39:51');
INSERT INTO `kunjungan` VALUES (888, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:40:06', '2020-03-15 17:40:06');
INSERT INTO `kunjungan` VALUES (889, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:40:17', '2020-03-15 17:40:17');
INSERT INTO `kunjungan` VALUES (890, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:40:36', '2020-03-15 17:40:36');
INSERT INTO `kunjungan` VALUES (891, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:40:50', '2020-03-15 17:40:50');
INSERT INTO `kunjungan` VALUES (892, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 17:41:00', '2020-03-15 17:41:00');
INSERT INTO `kunjungan` VALUES (893, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 19:21:15', '2020-03-15 19:21:15');
INSERT INTO `kunjungan` VALUES (894, 'http://localhost:8888/compro/berita/layanan/cabang-archery', '::1', '2020-03-15', '2020-03-15 19:21:23', '2020-03-15 19:21:23');
INSERT INTO `kunjungan` VALUES (895, 'http://localhost:8888/compro/berita/profil/sejarah', '::1', '2020-03-15', '2020-03-15 19:21:27', '2020-03-15 19:21:27');
INSERT INTO `kunjungan` VALUES (896, 'http://localhost:8888/compro/download', '::1', '2020-03-15', '2020-03-15 19:21:30', '2020-03-15 19:21:30');
INSERT INTO `kunjungan` VALUES (897, 'http://localhost:8888/compro/kontak', '::1', '2020-03-15', '2020-03-15 19:21:36', '2020-03-15 19:21:36');
INSERT INTO `kunjungan` VALUES (898, 'http://localhost:8888/compro/download', '::1', '2020-03-15', '2020-03-15 19:21:40', '2020-03-15 19:21:40');
INSERT INTO `kunjungan` VALUES (899, 'http://localhost:8888/compro/kontak', '::1', '2020-03-15', '2020-03-15 19:21:50', '2020-03-15 19:21:50');
INSERT INTO `kunjungan` VALUES (900, 'http://localhost:8888/compro/kontak', '::1', '2020-03-15', '2020-03-15 19:25:38', '2020-03-15 19:25:38');
INSERT INTO `kunjungan` VALUES (901, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:25:47', '2020-03-15 19:25:47');
INSERT INTO `kunjungan` VALUES (902, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:27:01', '2020-03-15 19:27:01');
INSERT INTO `kunjungan` VALUES (903, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:28:15', '2020-03-15 19:28:15');
INSERT INTO `kunjungan` VALUES (904, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 19:28:22', '2020-03-15 19:28:22');
INSERT INTO `kunjungan` VALUES (905, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:29:12', '2020-03-15 19:29:12');
INSERT INTO `kunjungan` VALUES (906, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:29:27', '2020-03-15 19:29:27');
INSERT INTO `kunjungan` VALUES (907, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:29:39', '2020-03-15 19:29:39');
INSERT INTO `kunjungan` VALUES (908, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:29:50', '2020-03-15 19:29:50');
INSERT INTO `kunjungan` VALUES (909, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:29:58', '2020-03-15 19:29:58');
INSERT INTO `kunjungan` VALUES (910, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:30:05', '2020-03-15 19:30:05');
INSERT INTO `kunjungan` VALUES (911, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:37:02', '2020-03-15 19:37:02');
INSERT INTO `kunjungan` VALUES (912, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:39:54', '2020-03-15 19:39:54');
INSERT INTO `kunjungan` VALUES (913, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:40:33', '2020-03-15 19:40:33');
INSERT INTO `kunjungan` VALUES (914, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:41:27', '2020-03-15 19:41:27');
INSERT INTO `kunjungan` VALUES (915, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:41:40', '2020-03-15 19:41:40');
INSERT INTO `kunjungan` VALUES (916, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:42:13', '2020-03-15 19:42:13');
INSERT INTO `kunjungan` VALUES (917, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:42:59', '2020-03-15 19:42:59');
INSERT INTO `kunjungan` VALUES (918, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:43:15', '2020-03-15 19:43:15');
INSERT INTO `kunjungan` VALUES (919, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:43:41', '2020-03-15 19:43:41');
INSERT INTO `kunjungan` VALUES (920, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:43:53', '2020-03-15 19:43:53');
INSERT INTO `kunjungan` VALUES (921, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:44:01', '2020-03-15 19:44:01');
INSERT INTO `kunjungan` VALUES (922, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:45:23', '2020-03-15 19:45:23');
INSERT INTO `kunjungan` VALUES (923, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:45:34', '2020-03-15 19:45:34');
INSERT INTO `kunjungan` VALUES (924, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:45:44', '2020-03-15 19:45:44');
INSERT INTO `kunjungan` VALUES (925, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:46:10', '2020-03-15 19:46:10');
INSERT INTO `kunjungan` VALUES (926, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:46:23', '2020-03-15 19:46:23');
INSERT INTO `kunjungan` VALUES (927, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:46:56', '2020-03-15 19:46:56');
INSERT INTO `kunjungan` VALUES (928, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:47:05', '2020-03-15 19:47:05');
INSERT INTO `kunjungan` VALUES (929, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:47:10', '2020-03-15 19:47:10');
INSERT INTO `kunjungan` VALUES (930, 'http://localhost:8888/compro/kontak', '::1', '2020-03-15', '2020-03-15 19:47:12', '2020-03-15 19:47:12');
INSERT INTO `kunjungan` VALUES (931, 'http://localhost:8888/compro/download', '::1', '2020-03-15', '2020-03-15 19:47:58', '2020-03-15 19:47:58');
INSERT INTO `kunjungan` VALUES (932, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:48:09', '2020-03-15 19:48:09');
INSERT INTO `kunjungan` VALUES (933, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:48:33', '2020-03-15 19:48:33');
INSERT INTO `kunjungan` VALUES (934, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:48:47', '2020-03-15 19:48:47');
INSERT INTO `kunjungan` VALUES (935, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:48:51', '2020-03-15 19:48:51');
INSERT INTO `kunjungan` VALUES (936, 'http://localhost:8888/compro/download', '::1', '2020-03-15', '2020-03-15 19:48:53', '2020-03-15 19:48:53');
INSERT INTO `kunjungan` VALUES (937, 'http://localhost:8888/compro/download', '::1', '2020-03-15', '2020-03-15 19:49:00', '2020-03-15 19:49:00');
INSERT INTO `kunjungan` VALUES (938, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:49:04', '2020-03-15 19:49:04');
INSERT INTO `kunjungan` VALUES (939, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:49:08', '2020-03-15 19:49:08');
INSERT INTO `kunjungan` VALUES (940, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:50:07', '2020-03-15 19:50:07');
INSERT INTO `kunjungan` VALUES (941, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:50:41', '2020-03-15 19:50:41');
INSERT INTO `kunjungan` VALUES (942, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 19:50:49', '2020-03-15 19:50:49');
INSERT INTO `kunjungan` VALUES (943, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 20:01:29', '2020-03-15 20:01:29');
INSERT INTO `kunjungan` VALUES (944, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 20:02:09', '2020-03-15 20:02:09');
INSERT INTO `kunjungan` VALUES (945, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 20:02:19', '2020-03-15 20:02:19');
INSERT INTO `kunjungan` VALUES (946, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 20:02:51', '2020-03-15 20:02:51');
INSERT INTO `kunjungan` VALUES (947, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 20:03:16', '2020-03-15 20:03:16');
INSERT INTO `kunjungan` VALUES (948, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 20:08:46', '2020-03-15 20:08:46');
INSERT INTO `kunjungan` VALUES (949, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 20:13:12', '2020-03-15 20:13:12');
INSERT INTO `kunjungan` VALUES (950, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 20:13:15', '2020-03-15 20:13:15');
INSERT INTO `kunjungan` VALUES (951, 'http://localhost:8888/compro/berita/read/perlombaan-cabang-archery', '::1', '2020-03-15', '2020-03-15 20:13:20', '2020-03-15 20:13:20');
INSERT INTO `kunjungan` VALUES (952, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 20:14:28', '2020-03-15 20:14:28');
INSERT INTO `kunjungan` VALUES (953, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 20:14:29', '2020-03-15 20:14:29');
INSERT INTO `kunjungan` VALUES (954, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 20:14:30', '2020-03-15 20:14:30');
INSERT INTO `kunjungan` VALUES (955, 'http://localhost:8888/compro/asosiasi/read/1', '::1', '2020-03-15', '2020-03-15 20:14:34', '2020-03-15 20:14:34');
INSERT INTO `kunjungan` VALUES (956, 'http://localhost:8888/compro/asosiasi/read/1', '::1', '2020-03-15', '2020-03-15 20:19:40', '2020-03-15 20:19:40');
INSERT INTO `kunjungan` VALUES (957, 'http://localhost:8888/compro/asosiasi/read/1', '::1', '2020-03-15', '2020-03-15 20:20:08', '2020-03-15 20:20:08');
INSERT INTO `kunjungan` VALUES (958, 'http://localhost:8888/compro/asosiasi/read/1', '::1', '2020-03-15', '2020-03-15 20:20:16', '2020-03-15 20:20:16');
INSERT INTO `kunjungan` VALUES (959, 'http://localhost:8888/compro/asosiasi/read/1', '::1', '2020-03-15', '2020-03-15 20:20:31', '2020-03-15 20:20:31');
INSERT INTO `kunjungan` VALUES (960, 'http://localhost:8888/compro/asosiasi/read/1', '::1', '2020-03-15', '2020-03-15 20:25:41', '2020-03-15 20:25:41');
INSERT INTO `kunjungan` VALUES (961, 'http://localhost:8888/compro/asosiasi/read/1', '::1', '2020-03-15', '2020-03-15 20:25:51', '2020-03-15 20:25:51');
INSERT INTO `kunjungan` VALUES (962, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 20:26:05', '2020-03-15 20:26:05');
INSERT INTO `kunjungan` VALUES (963, 'http://localhost:8888/compro/asosiasi/read/2', '::1', '2020-03-15', '2020-03-15 20:26:10', '2020-03-15 20:26:10');
INSERT INTO `kunjungan` VALUES (964, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 20:26:16', '2020-03-15 20:26:16');
INSERT INTO `kunjungan` VALUES (965, 'http://localhost:8888/compro/struktur', '::1', '2020-03-15', '2020-03-15 20:30:44', '2020-03-15 20:30:44');
INSERT INTO `kunjungan` VALUES (966, 'http://localhost:8888/compro/index.php', '::1', '2020-03-15', '2020-03-15 20:31:00', '2020-03-15 20:31:00');
INSERT INTO `kunjungan` VALUES (967, 'http://localhost:8888/compro/berita/read/perlombaan-cabang-archery', '::1', '2020-03-15', '2020-03-15 23:32:39', '2020-03-15 23:32:39');
INSERT INTO `kunjungan` VALUES (968, 'http://localhost:8888/compro/hasil_pertandingan/read/2', '::1', '2020-03-15', '2020-03-15 23:32:46', '2020-03-15 23:32:46');
INSERT INTO `kunjungan` VALUES (969, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 23:34:29', '2020-03-15 23:34:29');
INSERT INTO `kunjungan` VALUES (970, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-15', '2020-03-15 23:34:30', '2020-03-15 23:34:30');
INSERT INTO `kunjungan` VALUES (971, 'http://localhost:8888/compro/asosiasi/read/1', '::1', '2020-03-16', '2020-03-16 07:09:18', '2020-03-16 07:09:18');
INSERT INTO `kunjungan` VALUES (972, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-16', '2020-03-16 07:09:26', '2020-03-16 07:09:26');
INSERT INTO `kunjungan` VALUES (973, 'http://localhost:8888/compro/asosiasi/read/2', '::1', '2020-03-16', '2020-03-16 07:09:29', '2020-03-16 07:09:29');
INSERT INTO `kunjungan` VALUES (974, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-16', '2020-03-16 07:09:32', '2020-03-16 07:09:32');
INSERT INTO `kunjungan` VALUES (975, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-16', '2020-03-16 07:10:02', '2020-03-16 07:10:02');
INSERT INTO `kunjungan` VALUES (976, 'http://localhost:8888/compro/asosiasi/read/1', '::1', '2020-03-16', '2020-03-16 07:10:05', '2020-03-16 07:10:05');
INSERT INTO `kunjungan` VALUES (977, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-16', '2020-03-16 07:10:11', '2020-03-16 07:10:11');
INSERT INTO `kunjungan` VALUES (978, 'http://localhost:8888/compro/asosiasi/read/1', '::1', '2020-03-16', '2020-03-16 09:02:59', '2020-03-16 09:02:59');
INSERT INTO `kunjungan` VALUES (979, 'http://localhost:8888/compro/index.php', '::1', '2020-03-16', '2020-03-16 09:03:07', '2020-03-16 09:03:07');
INSERT INTO `kunjungan` VALUES (980, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 09:03:55', '2020-03-16 09:03:55');
INSERT INTO `kunjungan` VALUES (981, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:16:11', '2020-03-16 11:16:11');
INSERT INTO `kunjungan` VALUES (982, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:24:37', '2020-03-16 11:24:37');
INSERT INTO `kunjungan` VALUES (983, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:25:37', '2020-03-16 11:25:37');
INSERT INTO `kunjungan` VALUES (984, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:26:38', '2020-03-16 11:26:38');
INSERT INTO `kunjungan` VALUES (985, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:28:22', '2020-03-16 11:28:22');
INSERT INTO `kunjungan` VALUES (986, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:32:11', '2020-03-16 11:32:11');
INSERT INTO `kunjungan` VALUES (987, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:32:25', '2020-03-16 11:32:25');
INSERT INTO `kunjungan` VALUES (988, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:32:35', '2020-03-16 11:32:35');
INSERT INTO `kunjungan` VALUES (989, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:34:30', '2020-03-16 11:34:30');
INSERT INTO `kunjungan` VALUES (990, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:35:15', '2020-03-16 11:35:15');
INSERT INTO `kunjungan` VALUES (991, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:35:28', '2020-03-16 11:35:28');
INSERT INTO `kunjungan` VALUES (992, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:35:44', '2020-03-16 11:35:44');
INSERT INTO `kunjungan` VALUES (993, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:35:48', '2020-03-16 11:35:48');
INSERT INTO `kunjungan` VALUES (994, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:36:03', '2020-03-16 11:36:03');
INSERT INTO `kunjungan` VALUES (995, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-16', '2020-03-16 11:36:19', '2020-03-16 11:36:19');
INSERT INTO `kunjungan` VALUES (996, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-16', '2020-03-16 11:36:20', '2020-03-16 11:36:20');
INSERT INTO `kunjungan` VALUES (997, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:36:59', '2020-03-16 11:36:59');
INSERT INTO `kunjungan` VALUES (998, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:37:11', '2020-03-16 11:37:11');
INSERT INTO `kunjungan` VALUES (999, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:54:34', '2020-03-16 11:54:34');
INSERT INTO `kunjungan` VALUES (1000, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:55:22', '2020-03-16 11:55:22');
INSERT INTO `kunjungan` VALUES (1001, 'http://localhost:8888/compro/struktur/read/5', '::1', '2020-03-16', '2020-03-16 11:55:26', '2020-03-16 11:55:26');
INSERT INTO `kunjungan` VALUES (1002, 'http://localhost:8888/compro/struktur/read/5', '::1', '2020-03-16', '2020-03-16 11:55:43', '2020-03-16 11:55:43');
INSERT INTO `kunjungan` VALUES (1003, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 11:55:58', '2020-03-16 11:55:58');
INSERT INTO `kunjungan` VALUES (1004, 'http://localhost:8888/compro/struktur/read/8', '::1', '2020-03-16', '2020-03-16 11:56:02', '2020-03-16 11:56:02');
INSERT INTO `kunjungan` VALUES (1005, 'http://localhost:8888/compro/struktur/read/8', '::1', '2020-03-16', '2020-03-16 11:59:43', '2020-03-16 11:59:43');
INSERT INTO `kunjungan` VALUES (1006, 'http://localhost:8888/compro/struktur/read/8', '::1', '2020-03-16', '2020-03-16 11:59:58', '2020-03-16 11:59:58');
INSERT INTO `kunjungan` VALUES (1007, 'http://localhost:8888/compro/struktur/read/8', '::1', '2020-03-16', '2020-03-16 12:00:18', '2020-03-16 12:00:18');
INSERT INTO `kunjungan` VALUES (1008, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 12:00:49', '2020-03-16 12:00:49');
INSERT INTO `kunjungan` VALUES (1009, 'http://localhost:8888/compro/struktur/read/7', '::1', '2020-03-16', '2020-03-16 12:00:53', '2020-03-16 12:00:53');
INSERT INTO `kunjungan` VALUES (1010, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 12:00:57', '2020-03-16 12:00:57');
INSERT INTO `kunjungan` VALUES (1011, 'http://localhost:8888/compro/struktur/read/6', '::1', '2020-03-16', '2020-03-16 12:01:00', '2020-03-16 12:01:00');
INSERT INTO `kunjungan` VALUES (1012, 'http://localhost:8888/compro/struktur/read/6', '::1', '2020-03-16', '2020-03-16 12:02:47', '2020-03-16 12:02:47');
INSERT INTO `kunjungan` VALUES (1013, 'http://localhost:8888/compro/struktur/read/6', '::1', '2020-03-16', '2020-03-16 12:03:13', '2020-03-16 12:03:13');
INSERT INTO `kunjungan` VALUES (1014, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 12:03:18', '2020-03-16 12:03:18');
INSERT INTO `kunjungan` VALUES (1015, 'http://localhost:8888/compro/struktur/read/8', '::1', '2020-03-16', '2020-03-16 12:03:22', '2020-03-16 12:03:22');
INSERT INTO `kunjungan` VALUES (1016, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 12:03:26', '2020-03-16 12:03:26');
INSERT INTO `kunjungan` VALUES (1017, 'http://localhost:8888/compro/struktur/read/6', '::1', '2020-03-16', '2020-03-16 12:03:29', '2020-03-16 12:03:29');
INSERT INTO `kunjungan` VALUES (1018, 'http://localhost:8888/compro/struktur/read/6', '::1', '2020-03-16', '2020-03-16 12:04:10', '2020-03-16 12:04:10');
INSERT INTO `kunjungan` VALUES (1019, 'http://localhost:8888/compro/struktur/read/6', '::1', '2020-03-16', '2020-03-16 12:04:25', '2020-03-16 12:04:25');
INSERT INTO `kunjungan` VALUES (1020, 'http://localhost:8888/compro/struktur/read/6', '::1', '2020-03-16', '2020-03-16 12:04:40', '2020-03-16 12:04:40');
INSERT INTO `kunjungan` VALUES (1021, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 12:05:00', '2020-03-16 12:05:00');
INSERT INTO `kunjungan` VALUES (1022, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 12:06:02', '2020-03-16 12:06:02');
INSERT INTO `kunjungan` VALUES (1023, 'http://localhost:8888/compro/struktur/read/5', '::1', '2020-03-16', '2020-03-16 12:06:47', '2020-03-16 12:06:47');
INSERT INTO `kunjungan` VALUES (1024, 'http://localhost:8888/compro/struktur/read/5', '::1', '2020-03-16', '2020-03-16 12:07:18', '2020-03-16 12:07:18');
INSERT INTO `kunjungan` VALUES (1025, 'http://localhost:8888/compro/struktur/read/5', '::1', '2020-03-16', '2020-03-16 12:07:31', '2020-03-16 12:07:31');
INSERT INTO `kunjungan` VALUES (1026, 'http://localhost:8888/compro/struktur/read/5', '::1', '2020-03-16', '2020-03-16 12:07:45', '2020-03-16 12:07:45');
INSERT INTO `kunjungan` VALUES (1027, 'http://localhost:8888/compro/struktur/read/5', '::1', '2020-03-16', '2020-03-16 12:08:03', '2020-03-16 12:08:03');
INSERT INTO `kunjungan` VALUES (1028, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 12:08:10', '2020-03-16 12:08:10');
INSERT INTO `kunjungan` VALUES (1029, 'http://localhost:8888/compro/struktur/read/6', '::1', '2020-03-16', '2020-03-16 12:08:13', '2020-03-16 12:08:13');
INSERT INTO `kunjungan` VALUES (1030, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 12:08:18', '2020-03-16 12:08:18');
INSERT INTO `kunjungan` VALUES (1031, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 14:28:44', '2020-03-16 14:28:44');
INSERT INTO `kunjungan` VALUES (1032, 'http://localhost:8888/compro/struktur/read/10', '::1', '2020-03-16', '2020-03-16 14:28:48', '2020-03-16 14:28:48');
INSERT INTO `kunjungan` VALUES (1033, 'http://localhost:8888/compro/struktur/read/ICON.png', '::1', '2020-03-16', '2020-03-16 14:28:48', '2020-03-16 14:28:48');
INSERT INTO `kunjungan` VALUES (1034, 'http://localhost:8888/compro/struktur/read/10', '::1', '2020-03-16', '2020-03-16 14:29:39', '2020-03-16 14:29:39');
INSERT INTO `kunjungan` VALUES (1035, 'http://localhost:8888/compro/struktur/read/10', '::1', '2020-03-16', '2020-03-16 14:29:47', '2020-03-16 14:29:47');
INSERT INTO `kunjungan` VALUES (1036, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 14:45:53', '2020-03-16 14:45:53');
INSERT INTO `kunjungan` VALUES (1037, 'http://localhost:8888/compro/struktur/read/14', '::1', '2020-03-16', '2020-03-16 14:45:57', '2020-03-16 14:45:57');
INSERT INTO `kunjungan` VALUES (1038, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 14:50:54', '2020-03-16 14:50:54');
INSERT INTO `kunjungan` VALUES (1039, 'http://localhost:8888/compro/struktur', '::1', '2020-03-16', '2020-03-16 14:51:00', '2020-03-16 14:51:00');
INSERT INTO `kunjungan` VALUES (1040, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-16', '2020-03-16 14:51:01', '2020-03-16 14:51:01');
INSERT INTO `kunjungan` VALUES (1041, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-16', '2020-03-16 14:51:02', '2020-03-16 14:51:02');
INSERT INTO `kunjungan` VALUES (1042, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-16', '2020-03-16 14:51:51', '2020-03-16 14:51:51');
INSERT INTO `kunjungan` VALUES (1043, 'http://localhost:8888/compro/asosiasi/read/2', '::1', '2020-03-16', '2020-03-16 14:51:57', '2020-03-16 14:51:57');
INSERT INTO `kunjungan` VALUES (1044, 'http://localhost:8888/compro/asosiasi', '::1', '2020-03-16', '2020-03-16 14:52:02', '2020-03-16 14:52:02');
COMMIT;

-- ----------------------------
-- Table structure for pekerjaan
-- ----------------------------
DROP TABLE IF EXISTS `pekerjaan`;
CREATE TABLE `pekerjaan` (
  `id_pekerjaan` int(11) NOT NULL,
  `slug_pekerjaan` varchar(200) NOT NULL,
  `urutan` int(11) NOT NULL,
  `nama_pekerjaan` varchar(200) NOT NULL,
  `keterangan` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pekerjaan
-- ----------------------------
BEGIN;
INSERT INTO `pekerjaan` VALUES (1, 'karyawan-swasta', 1, 'Karyawan Swasta', NULL);
INSERT INTO `pekerjaan` VALUES (2, 'wirausaha', 2, 'Wirausaha', NULL);
INSERT INTO `pekerjaan` VALUES (3, 'pegawa-negeri-sipil-pns', 3, 'Pegawa Negeri Sipil (PNS)', NULL);
INSERT INTO `pekerjaan` VALUES (4, 'tni', 4, 'TNI', NULL);
INSERT INTO `pekerjaan` VALUES (5, 'polri', 5, 'POLRI', NULL);
INSERT INTO `pekerjaan` VALUES (6, 'ibu-rumah-tangga', 6, 'Ibu Rumah Tangga', NULL);
INSERT INTO `pekerjaan` VALUES (7, 'tidak-bekerja', 10, 'Tidak Bekerja', NULL);
INSERT INTO `pekerjaan` VALUES (8, 'guru-swasta', 7, 'Guru Swasta', NULL);
INSERT INTO `pekerjaan` VALUES (9, 'dosen-swasta', 8, 'Dosen Swasta', NULL);
COMMIT;

-- ----------------------------
-- Table structure for provinsi
-- ----------------------------
DROP TABLE IF EXISTS `provinsi`;
CREATE TABLE `provinsi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of provinsi
-- ----------------------------
BEGIN;
INSERT INTO `provinsi` VALUES (1, 'Bali');
INSERT INTO `provinsi` VALUES (2, 'Bangka Belitung');
INSERT INTO `provinsi` VALUES (3, 'Banten');
INSERT INTO `provinsi` VALUES (4, 'Bengkulu');
INSERT INTO `provinsi` VALUES (5, 'DI Yogyakarta');
INSERT INTO `provinsi` VALUES (6, 'DKI Jakarta');
INSERT INTO `provinsi` VALUES (7, 'Gorontalo');
INSERT INTO `provinsi` VALUES (8, 'Jambi');
INSERT INTO `provinsi` VALUES (9, 'Jawa Barat');
INSERT INTO `provinsi` VALUES (10, 'Jawa Tengah');
INSERT INTO `provinsi` VALUES (11, 'Jawa Timur');
INSERT INTO `provinsi` VALUES (12, 'Kalimantan Barat');
INSERT INTO `provinsi` VALUES (13, 'Kalimantan Selatan');
INSERT INTO `provinsi` VALUES (14, 'Kalimantan Tengah');
INSERT INTO `provinsi` VALUES (15, 'Kalimantan Timur');
INSERT INTO `provinsi` VALUES (16, 'Kalimantan Utara');
INSERT INTO `provinsi` VALUES (17, 'Kepulauan Riau');
INSERT INTO `provinsi` VALUES (18, 'Lampung');
INSERT INTO `provinsi` VALUES (19, 'Maluku');
INSERT INTO `provinsi` VALUES (20, 'Maluku Utara');
INSERT INTO `provinsi` VALUES (21, 'Nanggroe Aceh Darussalam (NAD)');
INSERT INTO `provinsi` VALUES (22, 'Nusa Tenggara Barat (NTB)');
INSERT INTO `provinsi` VALUES (23, 'Nusa Tenggara Timur (NTT)');
INSERT INTO `provinsi` VALUES (24, 'Papua');
INSERT INTO `provinsi` VALUES (25, 'Papua Barat');
INSERT INTO `provinsi` VALUES (26, 'Riau');
INSERT INTO `provinsi` VALUES (27, 'Sulawesi Barat');
INSERT INTO `provinsi` VALUES (28, 'Sulawesi Selatan');
INSERT INTO `provinsi` VALUES (29, 'Sulawesi Tengah');
INSERT INTO `provinsi` VALUES (30, 'Sulawesi Tenggara');
INSERT INTO `provinsi` VALUES (31, 'Sulawesi Utara');
INSERT INTO `provinsi` VALUES (32, 'Sumatera Barat');
INSERT INTO `provinsi` VALUES (33, 'Sumatera Selatan');
INSERT INTO `provinsi` VALUES (34, 'Sumatera Utara');
COMMIT;

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id_staff` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_kategori_staff` int(11) DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `password_hint` varchar(64) DEFAULT NULL,
  `isi` text,
  `jabatan` varchar(200) DEFAULT NULL,
  `keahlian` text,
  `gambar` varchar(200) DEFAULT NULL,
  `status_staff` varchar(20) NOT NULL,
  `keywords` varchar(200) DEFAULT NULL,
  `status_baca` enum('Sudah','Belum') NOT NULL,
  `status_tutor` enum('Ya','Tidak') NOT NULL,
  `ip_address` varchar(24) NOT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_staff`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of staff
-- ----------------------------
BEGIN;
INSERT INTO `staff` VALUES (9, 1, NULL, 0, 'Fitra Raudha', '', '0813 8841 0829', '', '', NULL, NULL, NULL, 'Direktur', '', NULL, 'Yes', '', 'Sudah', 'Ya', '', '', '1970-01-01', '2019-07-15 13:31:43');
INSERT INTO `staff` VALUES (10, 1, NULL, 0, 'Sigit Yuwono Wachid', '', '085715100485', '', '', NULL, NULL, NULL, '', '', NULL, 'No', '', 'Sudah', 'Ya', '', '', '1970-01-01', '2019-04-14 11:58:29');
COMMIT;

-- ----------------------------
-- Table structure for sub_menu
-- ----------------------------
DROP TABLE IF EXISTS `sub_menu`;
CREATE TABLE `sub_menu` (
  `id_sub_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) NOT NULL,
  `nama_sub_menu` varchar(100) NOT NULL,
  `link` varchar(255) NOT NULL,
  `target` varchar(20) NOT NULL,
  `urutan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sub_menu`),
  UNIQUE KEY `link` (`link`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sub_menu
-- ----------------------------
BEGIN;
INSERT INTO `sub_menu` VALUES (1, 1, 'Menu 1', 'http://localhost', '', 1);
INSERT INTO `sub_menu` VALUES (3, 1, 'Menu 2', 'http://localhost/1', '', 2);
COMMIT;

-- ----------------------------
-- Table structure for up
-- ----------------------------
DROP TABLE IF EXISTS `up`;
CREATE TABLE `up` (
  `id_up` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_up` varchar(255) NOT NULL,
  `bagian` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_up`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of up
-- ----------------------------
BEGIN;
INSERT INTO `up` VALUES (2, 3, 1, 'Rayyan Andoyo', 'Marketing', 'eflita@gmail.com', '(021) 27534579', 'adada', '2019-04-30 04:26:55');
INSERT INTO `up` VALUES (3, 3, 1, 'Izra', 'Keuangan', 'contact@nuansabaru.co.id', '0813 8841 0829', 'ok', '2019-04-30 04:19:51');
INSERT INTO `up` VALUES (4, 3, 1, 'Ef', 'a', 'surat@javawebmedia.co.id', '', '', '2019-04-30 04:27:09');
COMMIT;

-- ----------------------------
-- Table structure for user_log
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log` (
  `id_user_log` int(11) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `akses_level` varchar(20) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `jenis` varchar(24) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_log
-- ----------------------------
BEGIN;
INSERT INTO `user_log` VALUES (1, '::1', 5, 'andoyo', '', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-16 10:51:54');
INSERT INTO `user_log` VALUES (2, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-16 10:53:55');
INSERT INTO `user_log` VALUES (3, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-16 10:54:13');
INSERT INTO `user_log` VALUES (4, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-16 10:54:20');
INSERT INTO `user_log` VALUES (5, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-16 10:54:25');
INSERT INTO `user_log` VALUES (6, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-16 10:54:40');
INSERT INTO `user_log` VALUES (7, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-16 10:56:54');
INSERT INTO `user_log` VALUES (8, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-16 10:56:54');
INSERT INTO `user_log` VALUES (9, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil', 'Administrator', '2018-05-16 10:57:28');
INSERT INTO `user_log` VALUES (10, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-16 10:58:05');
INSERT INTO `user_log` VALUES (11, '::1', 2, 'andoyo', 'Users', 'http://localhost/dlp/member/profil', 'Member', '2018-05-16 10:58:07');
INSERT INTO `user_log` VALUES (12, '::1', 0, NULL, '', 'http://localhost/dlp/login/lupa', 'Administrator', '2018-05-16 11:17:00');
INSERT INTO `user_log` VALUES (13, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-16 11:17:03');
INSERT INTO `user_log` VALUES (14, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-16 11:17:38');
INSERT INTO `user_log` VALUES (15, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-16 11:17:38');
INSERT INTO `user_log` VALUES (16, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran', 'Administrator', '2018-05-16 11:17:56');
INSERT INTO `user_log` VALUES (17, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/cari', 'Administrator', '2018-05-16 11:18:00');
INSERT INTO `user_log` VALUES (18, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran', 'Administrator', '2018-05-16 11:18:03');
INSERT INTO `user_log` VALUES (19, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor/panduan', 'Administrator', '2018-05-16 11:18:14');
INSERT INTO `user_log` VALUES (20, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor/profil', 'Administrator', '2018-05-16 11:18:16');
INSERT INTO `user_log` VALUES (21, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-16 11:18:21');
INSERT INTO `user_log` VALUES (22, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-16 11:29:37');
INSERT INTO `user_log` VALUES (23, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-16 11:29:41');
INSERT INTO `user_log` VALUES (24, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran', 'Administrator', '2018-05-16 11:30:04');
INSERT INTO `user_log` VALUES (25, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-16 11:30:06');
INSERT INTO `user_log` VALUES (26, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/excel/9', 'Administrator', '2018-05-16 11:30:22');
INSERT INTO `user_log` VALUES (27, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-16 11:30:26');
INSERT INTO `user_log` VALUES (28, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/pdf/9', 'Administrator', '2018-05-16 11:30:28');
INSERT INTO `user_log` VALUES (29, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/member/profil', 'Administrator', '2018-05-16 12:58:49');
INSERT INTO `user_log` VALUES (30, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-16 13:57:19');
INSERT INTO `user_log` VALUES (31, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-25 08:54:17');
INSERT INTO `user_log` VALUES (32, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-25 08:54:26');
INSERT INTO `user_log` VALUES (33, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-25 08:54:26');
INSERT INTO `user_log` VALUES (34, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-25 08:54:30');
INSERT INTO `user_log` VALUES (35, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-25 08:54:31');
INSERT INTO `user_log` VALUES (36, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-25 08:54:36');
INSERT INTO `user_log` VALUES (37, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-25 08:54:37');
INSERT INTO `user_log` VALUES (38, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-25 08:54:44');
INSERT INTO `user_log` VALUES (39, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-25 08:54:44');
INSERT INTO `user_log` VALUES (40, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-25 08:55:25');
INSERT INTO `user_log` VALUES (41, '::1', 2, 'andoyo', 'Users', 'http://localhost/dlp/member/dashboard', 'Member', '2018-05-25 08:55:25');
INSERT INTO `user_log` VALUES (42, '::1', 2, 'andoyo', 'Users', 'http://localhost/dlp/member/profil', 'Member', '2018-05-25 08:55:37');
INSERT INTO `user_log` VALUES (43, '::1', 2, 'andoyo', 'Users', 'http://localhost/dlp/member/profil/edit', 'Member', '2018-05-25 08:55:42');
INSERT INTO `user_log` VALUES (44, '::1', 2, 'andoyo', 'Users', 'http://localhost/dlp/member/login/logout', 'Member', '2018-05-25 08:56:44');
INSERT INTO `user_log` VALUES (45, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-25 08:56:44');
INSERT INTO `user_log` VALUES (46, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 08:56:49');
INSERT INTO `user_log` VALUES (47, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 08:56:54');
INSERT INTO `user_log` VALUES (48, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-25 08:56:54');
INSERT INTO `user_log` VALUES (49, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user', 'Administrator', '2018-05-25 08:57:10');
INSERT INTO `user_log` VALUES (50, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 08:57:24');
INSERT INTO `user_log` VALUES (51, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 08:57:28');
INSERT INTO `user_log` VALUES (52, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 08:57:28');
INSERT INTO `user_log` VALUES (53, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 08:57:40');
INSERT INTO `user_log` VALUES (54, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 08:57:40');
INSERT INTO `user_log` VALUES (55, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran', 'Administrator', '2018-05-25 08:57:45');
INSERT INTO `user_log` VALUES (56, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 08:57:48');
INSERT INTO `user_log` VALUES (57, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 09:00:09');
INSERT INTO `user_log` VALUES (58, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/detail/2', 'Administrator', '2018-05-25 09:00:19');
INSERT INTO `user_log` VALUES (59, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 09:01:02');
INSERT INTO `user_log` VALUES (60, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 09:01:22');
INSERT INTO `user_log` VALUES (61, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 09:02:10');
INSERT INTO `user_log` VALUES (62, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 09:02:25');
INSERT INTO `user_log` VALUES (63, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 09:02:36');
INSERT INTO `user_log` VALUES (64, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/approval', 'Administrator', '2018-05-25 09:02:47');
INSERT INTO `user_log` VALUES (65, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 09:02:48');
INSERT INTO `user_log` VALUES (66, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/akses/2', 'Administrator', '2018-05-25 09:02:55');
INSERT INTO `user_log` VALUES (67, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/cetak/2', 'Administrator', '2018-05-25 09:03:03');
INSERT INTO `user_log` VALUES (68, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/excel/9', 'Administrator', '2018-05-25 09:03:28');
INSERT INTO `user_log` VALUES (69, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 09:03:31');
INSERT INTO `user_log` VALUES (70, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/pdf/9', 'Administrator', '2018-05-25 09:09:27');
INSERT INTO `user_log` VALUES (71, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/pdf/9', 'Administrator', '2018-05-25 09:11:19');
INSERT INTO `user_log` VALUES (72, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/pdf/9', 'Administrator', '2018-05-25 09:12:41');
INSERT INTO `user_log` VALUES (73, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/pdf/9', 'Administrator', '2018-05-25 09:13:56');
INSERT INTO `user_log` VALUES (74, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 09:14:30');
INSERT INTO `user_log` VALUES (75, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 09:14:36');
INSERT INTO `user_log` VALUES (76, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 09:15:25');
INSERT INTO `user_log` VALUES (77, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 09:15:56');
INSERT INTO `user_log` VALUES (78, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 09:15:58');
INSERT INTO `user_log` VALUES (79, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 09:16:59');
INSERT INTO `user_log` VALUES (80, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 09:17:30');
INSERT INTO `user_log` VALUES (81, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 09:17:50');
INSERT INTO `user_log` VALUES (82, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 09:18:27');
INSERT INTO `user_log` VALUES (83, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 09:18:44');
INSERT INTO `user_log` VALUES (84, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 09:18:55');
INSERT INTO `user_log` VALUES (85, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 09:19:54');
INSERT INTO `user_log` VALUES (86, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 09:19:55');
INSERT INTO `user_log` VALUES (87, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 09:20:19');
INSERT INTO `user_log` VALUES (88, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 09:21:43');
INSERT INTO `user_log` VALUES (89, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 09:22:55');
INSERT INTO `user_log` VALUES (90, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 09:30:07');
INSERT INTO `user_log` VALUES (91, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/export_excel/9', 'Administrator', '2018-05-25 09:37:26');
INSERT INTO `user_log` VALUES (92, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/cari', 'Administrator', '2018-05-25 09:39:39');
INSERT INTO `user_log` VALUES (93, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 09:39:57');
INSERT INTO `user_log` VALUES (94, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor/profil', 'Administrator', '2018-05-25 09:40:01');
INSERT INTO `user_log` VALUES (95, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran', 'Administrator', '2018-05-25 09:40:04');
INSERT INTO `user_log` VALUES (96, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran', 'Administrator', '2018-05-25 09:44:28');
INSERT INTO `user_log` VALUES (97, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran', 'Administrator', '2018-05-25 09:44:50');
INSERT INTO `user_log` VALUES (98, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran', 'Administrator', '2018-05-25 09:45:13');
INSERT INTO `user_log` VALUES (99, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran', 'Administrator', '2018-05-25 09:46:41');
INSERT INTO `user_log` VALUES (100, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran', 'Administrator', '2018-05-25 09:47:06');
INSERT INTO `user_log` VALUES (101, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 09:47:40');
INSERT INTO `user_log` VALUES (102, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/approval', 'Administrator', '2018-05-25 09:47:46');
INSERT INTO `user_log` VALUES (103, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 09:47:46');
INSERT INTO `user_log` VALUES (104, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 09:47:49');
INSERT INTO `user_log` VALUES (105, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran', 'Administrator', '2018-05-25 09:47:53');
INSERT INTO `user_log` VALUES (106, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran', 'Administrator', '2018-05-25 09:50:29');
INSERT INTO `user_log` VALUES (107, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 09:52:15');
INSERT INTO `user_log` VALUES (108, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 09:53:09');
INSERT INTO `user_log` VALUES (109, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 09:54:43');
INSERT INTO `user_log` VALUES (110, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 09:54:57');
INSERT INTO `user_log` VALUES (111, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 09:55:19');
INSERT INTO `user_log` VALUES (112, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 09:55:39');
INSERT INTO `user_log` VALUES (113, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 09:56:31');
INSERT INTO `user_log` VALUES (114, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 09:56:45');
INSERT INTO `user_log` VALUES (115, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:01:11');
INSERT INTO `user_log` VALUES (116, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:01:47');
INSERT INTO `user_log` VALUES (117, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:03:44');
INSERT INTO `user_log` VALUES (118, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:04:33');
INSERT INTO `user_log` VALUES (119, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:07:53');
INSERT INTO `user_log` VALUES (120, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:08:28');
INSERT INTO `user_log` VALUES (121, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:09:43');
INSERT INTO `user_log` VALUES (122, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:10:22');
INSERT INTO `user_log` VALUES (123, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:10:55');
INSERT INTO `user_log` VALUES (124, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:20:21');
INSERT INTO `user_log` VALUES (125, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:21:52');
INSERT INTO `user_log` VALUES (126, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:22:10');
INSERT INTO `user_log` VALUES (127, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:23:52');
INSERT INTO `user_log` VALUES (128, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:24:22');
INSERT INTO `user_log` VALUES (129, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:25:22');
INSERT INTO `user_log` VALUES (130, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:26:03');
INSERT INTO `user_log` VALUES (131, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:26:28');
INSERT INTO `user_log` VALUES (132, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:29:01');
INSERT INTO `user_log` VALUES (133, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran', 'Administrator', '2018-05-25 10:29:16');
INSERT INTO `user_log` VALUES (134, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:47:50');
INSERT INTO `user_log` VALUES (135, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:53:17');
INSERT INTO `user_log` VALUES (136, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/cari', 'Administrator', '2018-05-25 10:53:36');
INSERT INTO `user_log` VALUES (137, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 10:54:06');
INSERT INTO `user_log` VALUES (138, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/cari', 'Administrator', '2018-05-25 10:54:37');
INSERT INTO `user_log` VALUES (139, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/cari', 'Administrator', '2018-05-25 10:56:06');
INSERT INTO `user_log` VALUES (140, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/cari', 'Administrator', '2018-05-25 10:59:54');
INSERT INTO `user_log` VALUES (141, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/cari', 'Administrator', '2018-05-25 11:00:15');
INSERT INTO `user_log` VALUES (142, '127.0.0.1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/cari', 'Administrator', '2018-05-25 11:02:18');
INSERT INTO `user_log` VALUES (143, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/cari', 'Administrator', '2018-05-25 11:02:45');
INSERT INTO `user_log` VALUES (144, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 11:06:35');
INSERT INTO `user_log` VALUES (145, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:08:48');
INSERT INTO `user_log` VALUES (146, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/pendaftaran/cari', 'Administrator', '2018-05-25 11:09:05');
INSERT INTO `user_log` VALUES (147, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 11:11:03');
INSERT INTO `user_log` VALUES (148, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 11:11:06');
INSERT INTO `user_log` VALUES (149, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-25 11:11:06');
INSERT INTO `user_log` VALUES (150, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user', 'Administrator', '2018-05-25 11:11:11');
INSERT INTO `user_log` VALUES (151, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user/tambah', 'Administrator', '2018-05-25 11:11:15');
INSERT INTO `user_log` VALUES (152, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user', 'Administrator', '2018-05-25 11:11:23');
INSERT INTO `user_log` VALUES (153, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user/tambah', 'Administrator', '2018-05-25 11:11:29');
INSERT INTO `user_log` VALUES (154, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user/tambah', 'Administrator', '2018-05-25 11:13:28');
INSERT INTO `user_log` VALUES (155, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user', 'Administrator', '2018-05-25 11:13:29');
INSERT INTO `user_log` VALUES (156, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 11:13:32');
INSERT INTO `user_log` VALUES (157, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 11:13:36');
INSERT INTO `user_log` VALUES (158, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-25 11:13:37');
INSERT INTO `user_log` VALUES (159, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-25 11:13:50');
INSERT INTO `user_log` VALUES (160, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 11:14:11');
INSERT INTO `user_log` VALUES (161, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 11:14:12');
INSERT INTO `user_log` VALUES (162, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-25 11:14:13');
INSERT INTO `user_log` VALUES (163, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user', 'Administrator', '2018-05-25 11:14:17');
INSERT INTO `user_log` VALUES (164, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 11:14:37');
INSERT INTO `user_log` VALUES (165, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 11:14:41');
INSERT INTO `user_log` VALUES (166, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/dasbor', 'Administrator', '2018-05-25 11:14:41');
INSERT INTO `user_log` VALUES (167, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-25 11:15:37');
INSERT INTO `user_log` VALUES (168, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-25 11:16:20');
INSERT INTO `user_log` VALUES (169, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/dasbor', 'Administrator', '2018-05-25 11:16:40');
INSERT INTO `user_log` VALUES (170, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/dasbor', 'Administrator', '2018-05-25 11:20:34');
INSERT INTO `user_log` VALUES (171, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/dasbor', 'Administrator', '2018-05-25 11:21:27');
INSERT INTO `user_log` VALUES (172, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:21:30');
INSERT INTO `user_log` VALUES (173, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/dasbor', 'Administrator', '2018-05-25 11:21:36');
INSERT INTO `user_log` VALUES (174, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:21:40');
INSERT INTO `user_log` VALUES (175, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:25:21');
INSERT INTO `user_log` VALUES (176, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran', 'Administrator', '2018-05-25 11:25:24');
INSERT INTO `user_log` VALUES (177, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran', 'Administrator', '2018-05-25 11:25:45');
INSERT INTO `user_log` VALUES (178, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran', 'Administrator', '2018-05-25 11:26:14');
INSERT INTO `user_log` VALUES (179, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran', 'Administrator', '2018-05-25 11:26:47');
INSERT INTO `user_log` VALUES (180, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:26:49');
INSERT INTO `user_log` VALUES (181, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran', 'Administrator', '2018-05-25 11:26:54');
INSERT INTO `user_log` VALUES (182, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:27:09');
INSERT INTO `user_log` VALUES (183, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:27:51');
INSERT INTO `user_log` VALUES (184, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:30:18');
INSERT INTO `user_log` VALUES (185, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:33:34');
INSERT INTO `user_log` VALUES (186, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:34:12');
INSERT INTO `user_log` VALUES (187, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/approval', 'Administrator', '2018-05-25 11:35:02');
INSERT INTO `user_log` VALUES (188, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:35:02');
INSERT INTO `user_log` VALUES (189, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:36:13');
INSERT INTO `user_log` VALUES (190, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/approval', 'Administrator', '2018-05-25 11:36:18');
INSERT INTO `user_log` VALUES (191, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:36:19');
INSERT INTO `user_log` VALUES (192, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 11:36:23');
INSERT INTO `user_log` VALUES (193, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 11:37:41');
INSERT INTO `user_log` VALUES (194, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 11:38:08');
INSERT INTO `user_log` VALUES (195, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 11:38:51');
INSERT INTO `user_log` VALUES (196, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:39:05');
INSERT INTO `user_log` VALUES (197, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 11:39:06');
INSERT INTO `user_log` VALUES (198, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 11:39:45');
INSERT INTO `user_log` VALUES (199, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 11:40:38');
INSERT INTO `user_log` VALUES (200, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:41:56');
INSERT INTO `user_log` VALUES (201, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/export_pdf/9', 'Administrator', '2018-05-25 11:42:05');
INSERT INTO `user_log` VALUES (202, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/export_excel/9', 'Administrator', '2018-05-25 11:43:23');
INSERT INTO `user_log` VALUES (203, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 11:45:10');
INSERT INTO `user_log` VALUES (204, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 11:45:17');
INSERT INTO `user_log` VALUES (205, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 11:45:18');
INSERT INTO `user_log` VALUES (206, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 11:49:34');
INSERT INTO `user_log` VALUES (207, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 11:50:12');
INSERT INTO `user_log` VALUES (208, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-25 11:50:40');
INSERT INTO `user_log` VALUES (209, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 11:52:04');
INSERT INTO `user_log` VALUES (210, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 11:52:14');
INSERT INTO `user_log` VALUES (211, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/dasbor', 'Administrator', '2018-05-25 11:52:14');
INSERT INTO `user_log` VALUES (212, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/kelola/9', 'Administrator', '2018-05-25 11:52:22');
INSERT INTO `user_log` VALUES (213, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/cari', 'Administrator', '2018-05-25 12:58:15');
INSERT INTO `user_log` VALUES (214, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/cari', 'Administrator', '2018-05-25 14:20:54');
INSERT INTO `user_log` VALUES (215, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/cari', 'Administrator', '2018-05-25 14:21:44');
INSERT INTO `user_log` VALUES (216, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/cari', 'Administrator', '2018-05-25 14:26:03');
INSERT INTO `user_log` VALUES (217, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/cari', 'Administrator', '2018-05-25 14:26:05');
INSERT INTO `user_log` VALUES (218, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/cari', 'Administrator', '2018-05-25 14:26:52');
INSERT INTO `user_log` VALUES (219, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/cari', 'Administrator', '2018-05-25 14:27:06');
INSERT INTO `user_log` VALUES (220, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/cari', 'Administrator', '2018-05-25 14:28:18');
INSERT INTO `user_log` VALUES (221, '::1', 13, 'ugadjahmada', 'Universitas', 'http://localhost/dlp/kampus/pendaftaran/cari', 'Administrator', '2018-05-25 14:28:26');
INSERT INTO `user_log` VALUES (222, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 14:30:29');
INSERT INTO `user_log` VALUES (223, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-25 14:30:59');
INSERT INTO `user_log` VALUES (224, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-25 14:31:00');
INSERT INTO `user_log` VALUES (225, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-25 14:31:05');
INSERT INTO `user_log` VALUES (226, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-25 14:40:14');
INSERT INTO `user_log` VALUES (227, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-25 14:40:30');
INSERT INTO `user_log` VALUES (228, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-25 14:41:25');
INSERT INTO `user_log` VALUES (229, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-25 14:42:08');
INSERT INTO `user_log` VALUES (230, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-25 14:45:59');
INSERT INTO `user_log` VALUES (231, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-25 14:47:45');
INSERT INTO `user_log` VALUES (232, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/31/9', 'Administrator', '2018-05-25 14:48:10');
INSERT INTO `user_log` VALUES (233, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/31/9', 'Administrator', '2018-05-25 14:53:22');
INSERT INTO `user_log` VALUES (234, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/31/9', 'Administrator', '2018-05-25 14:53:39');
INSERT INTO `user_log` VALUES (235, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/31/9', 'Administrator', '2018-05-25 14:54:04');
INSERT INTO `user_log` VALUES (236, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/31/9', 'Administrator', '2018-05-25 14:55:20');
INSERT INTO `user_log` VALUES (237, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/31/9', 'Administrator', '2018-05-25 14:57:10');
INSERT INTO `user_log` VALUES (238, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/31/9', 'Administrator', '2018-05-25 15:02:00');
INSERT INTO `user_log` VALUES (239, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-25 15:02:09');
INSERT INTO `user_log` VALUES (240, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-25 15:06:28');
INSERT INTO `user_log` VALUES (241, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-25 15:06:38');
INSERT INTO `user_log` VALUES (242, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-25 15:06:47');
INSERT INTO `user_log` VALUES (243, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-25 15:09:29');
INSERT INTO `user_log` VALUES (244, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-25 15:09:42');
INSERT INTO `user_log` VALUES (245, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-25 15:10:58');
INSERT INTO `user_log` VALUES (246, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/8', 'Administrator', '2018-05-25 15:11:01');
INSERT INTO `user_log` VALUES (247, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-25 15:11:03');
INSERT INTO `user_log` VALUES (248, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-25 15:12:01');
INSERT INTO `user_log` VALUES (249, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-25 15:14:29');
INSERT INTO `user_log` VALUES (250, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang', 'Administrator', '2018-05-25 15:14:55');
INSERT INTO `user_log` VALUES (251, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang/delete/8', 'Administrator', '2018-05-25 15:15:02');
INSERT INTO `user_log` VALUES (252, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang', 'Administrator', '2018-05-25 15:15:02');
INSERT INTO `user_log` VALUES (253, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-25 15:15:05');
INSERT INTO `user_log` VALUES (254, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-29 05:58:59');
INSERT INTO `user_log` VALUES (255, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-29 05:59:04');
INSERT INTO `user_log` VALUES (256, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-29 05:59:04');
INSERT INTO `user_log` VALUES (257, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 05:59:12');
INSERT INTO `user_log` VALUES (258, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-29 05:59:15');
INSERT INTO `user_log` VALUES (259, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/31/9', 'Administrator', '2018-05-29 05:59:20');
INSERT INTO `user_log` VALUES (260, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-29 05:59:25');
INSERT INTO `user_log` VALUES (261, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 05:59:29');
INSERT INTO `user_log` VALUES (262, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:01:54');
INSERT INTO `user_log` VALUES (263, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:02:44');
INSERT INTO `user_log` VALUES (264, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:02:56');
INSERT INTO `user_log` VALUES (265, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:03:11');
INSERT INTO `user_log` VALUES (266, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:03:20');
INSERT INTO `user_log` VALUES (267, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:03:55');
INSERT INTO `user_log` VALUES (268, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:04:27');
INSERT INTO `user_log` VALUES (269, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:04:39');
INSERT INTO `user_log` VALUES (270, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:04:57');
INSERT INTO `user_log` VALUES (271, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:05:35');
INSERT INTO `user_log` VALUES (272, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:07:04');
INSERT INTO `user_log` VALUES (273, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:08:16');
INSERT INTO `user_log` VALUES (274, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:09:21');
INSERT INTO `user_log` VALUES (275, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:09:52');
INSERT INTO `user_log` VALUES (276, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:10:22');
INSERT INTO `user_log` VALUES (277, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-29 06:10:35');
INSERT INTO `user_log` VALUES (278, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:10:39');
INSERT INTO `user_log` VALUES (279, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:11:16');
INSERT INTO `user_log` VALUES (280, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:11:30');
INSERT INTO `user_log` VALUES (281, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-29 06:12:14');
INSERT INTO `user_log` VALUES (282, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:12:20');
INSERT INTO `user_log` VALUES (283, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:12:46');
INSERT INTO `user_log` VALUES (284, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:13:39');
INSERT INTO `user_log` VALUES (285, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:14:18');
INSERT INTO `user_log` VALUES (286, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_excel/9', 'Administrator', '2018-05-29 06:14:30');
INSERT INTO `user_log` VALUES (287, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:14:34');
INSERT INTO `user_log` VALUES (288, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:14:58');
INSERT INTO `user_log` VALUES (289, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:17:29');
INSERT INTO `user_log` VALUES (290, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:18:24');
INSERT INTO `user_log` VALUES (291, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:18:59');
INSERT INTO `user_log` VALUES (292, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:19:15');
INSERT INTO `user_log` VALUES (293, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:19:36');
INSERT INTO `user_log` VALUES (294, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:19:55');
INSERT INTO `user_log` VALUES (295, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:20:06');
INSERT INTO `user_log` VALUES (296, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:21:00');
INSERT INTO `user_log` VALUES (297, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-29 06:51:56');
INSERT INTO `user_log` VALUES (298, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:52:05');
INSERT INTO `user_log` VALUES (299, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-29 06:52:09');
INSERT INTO `user_log` VALUES (300, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:52:15');
INSERT INTO `user_log` VALUES (301, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-29 06:52:24');
INSERT INTO `user_log` VALUES (302, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/31/9', 'Administrator', '2018-05-29 06:52:26');
INSERT INTO `user_log` VALUES (303, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-05-29 06:52:33');
INSERT INTO `user_log` VALUES (304, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/31/9', 'Administrator', '2018-05-29 06:52:36');
INSERT INTO `user_log` VALUES (305, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-29 06:52:43');
INSERT INTO `user_log` VALUES (306, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:53:45');
INSERT INTO `user_log` VALUES (307, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:54:00');
INSERT INTO `user_log` VALUES (308, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-29 06:55:58');
INSERT INTO `user_log` VALUES (309, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:56:03');
INSERT INTO `user_log` VALUES (310, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_excel/9', 'Administrator', '2018-05-29 06:56:09');
INSERT INTO `user_log` VALUES (311, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 06:58:32');
INSERT INTO `user_log` VALUES (312, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_excel/9', 'Administrator', '2018-05-29 06:58:36');
INSERT INTO `user_log` VALUES (313, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_excel/9', 'Administrator', '2018-05-29 07:00:20');
INSERT INTO `user_log` VALUES (314, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_excel/9', 'Administrator', '2018-05-29 07:02:25');
INSERT INTO `user_log` VALUES (315, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_excel/9', 'Administrator', '2018-05-29 07:02:49');
INSERT INTO `user_log` VALUES (316, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_excel/9', 'Administrator', '2018-05-29 07:03:25');
INSERT INTO `user_log` VALUES (317, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 07:06:38');
INSERT INTO `user_log` VALUES (318, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_excel/9', 'Administrator', '2018-05-29 07:06:41');
INSERT INTO `user_log` VALUES (319, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_excel/9', 'Administrator', '2018-05-29 07:08:07');
INSERT INTO `user_log` VALUES (320, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:10:25');
INSERT INTO `user_log` VALUES (321, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:10:44');
INSERT INTO `user_log` VALUES (322, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:12:02');
INSERT INTO `user_log` VALUES (323, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:12:24');
INSERT INTO `user_log` VALUES (324, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:12:26');
INSERT INTO `user_log` VALUES (325, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 07:12:33');
INSERT INTO `user_log` VALUES (326, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:12:39');
INSERT INTO `user_log` VALUES (327, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:12:43');
INSERT INTO `user_log` VALUES (328, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:14:19');
INSERT INTO `user_log` VALUES (329, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:14:21');
INSERT INTO `user_log` VALUES (330, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:14:47');
INSERT INTO `user_log` VALUES (331, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:15:05');
INSERT INTO `user_log` VALUES (332, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:15:08');
INSERT INTO `user_log` VALUES (333, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:15:25');
INSERT INTO `user_log` VALUES (334, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:15:28');
INSERT INTO `user_log` VALUES (335, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/cetak/9', 'Administrator', '2018-05-29 07:16:57');
INSERT INTO `user_log` VALUES (336, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/cetak/9', 'Administrator', '2018-05-29 07:16:59');
INSERT INTO `user_log` VALUES (337, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 07:17:04');
INSERT INTO `user_log` VALUES (338, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/cetak_semua/9', 'Administrator', '2018-05-29 07:17:06');
INSERT INTO `user_log` VALUES (339, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/cetak_semua/9', 'Administrator', '2018-05-29 07:17:15');
INSERT INTO `user_log` VALUES (340, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/cetak_semua/9', 'Administrator', '2018-05-29 07:17:47');
INSERT INTO `user_log` VALUES (341, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:20:58');
INSERT INTO `user_log` VALUES (342, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-29 07:21:03');
INSERT INTO `user_log` VALUES (343, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 07:41:12');
INSERT INTO `user_log` VALUES (344, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 07:42:25');
INSERT INTO `user_log` VALUES (345, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/1', 'Administrator', '2018-05-29 07:42:33');
INSERT INTO `user_log` VALUES (346, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 07:43:46');
INSERT INTO `user_log` VALUES (347, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 07:44:00');
INSERT INTO `user_log` VALUES (348, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-29 07:45:59');
INSERT INTO `user_log` VALUES (349, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-29 07:47:14');
INSERT INTO `user_log` VALUES (350, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-29 21:14:41');
INSERT INTO `user_log` VALUES (351, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-29 21:20:38');
INSERT INTO `user_log` VALUES (352, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-29 21:20:38');
INSERT INTO `user_log` VALUES (353, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 21:21:02');
INSERT INTO `user_log` VALUES (354, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/cetak_semua/9', 'Administrator', '2018-05-29 21:21:06');
INSERT INTO `user_log` VALUES (355, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 21:21:22');
INSERT INTO `user_log` VALUES (356, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:21:33');
INSERT INTO `user_log` VALUES (357, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:22:03');
INSERT INTO `user_log` VALUES (358, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:22:28');
INSERT INTO `user_log` VALUES (359, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:22:49');
INSERT INTO `user_log` VALUES (360, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:23:09');
INSERT INTO `user_log` VALUES (361, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:23:17');
INSERT INTO `user_log` VALUES (362, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/detail/1', 'Administrator', '2018-05-29 21:26:24');
INSERT INTO `user_log` VALUES (363, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/detail/1', 'Administrator', '2018-05-29 21:26:51');
INSERT INTO `user_log` VALUES (364, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:29:01');
INSERT INTO `user_log` VALUES (365, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:30:22');
INSERT INTO `user_log` VALUES (366, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:30:33');
INSERT INTO `user_log` VALUES (367, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:31:49');
INSERT INTO `user_log` VALUES (368, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:32:20');
INSERT INTO `user_log` VALUES (369, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:32:57');
INSERT INTO `user_log` VALUES (370, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:33:15');
INSERT INTO `user_log` VALUES (371, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:33:52');
INSERT INTO `user_log` VALUES (372, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:34:10');
INSERT INTO `user_log` VALUES (373, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:35:26');
INSERT INTO `user_log` VALUES (374, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:35:47');
INSERT INTO `user_log` VALUES (375, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:36:40');
INSERT INTO `user_log` VALUES (376, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:41:45');
INSERT INTO `user_log` VALUES (377, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:42:22');
INSERT INTO `user_log` VALUES (378, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:42:51');
INSERT INTO `user_log` VALUES (379, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:43:11');
INSERT INTO `user_log` VALUES (380, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:43:37');
INSERT INTO `user_log` VALUES (381, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:43:46');
INSERT INTO `user_log` VALUES (382, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:44:23');
INSERT INTO `user_log` VALUES (383, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:45:28');
INSERT INTO `user_log` VALUES (384, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:46:02');
INSERT INTO `user_log` VALUES (385, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:46:12');
INSERT INTO `user_log` VALUES (386, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:49:13');
INSERT INTO `user_log` VALUES (387, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:49:49');
INSERT INTO `user_log` VALUES (388, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/member/akses/2', 'Administrator', '2018-05-29 21:55:23');
INSERT INTO `user_log` VALUES (389, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:55:40');
INSERT INTO `user_log` VALUES (390, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/2', 'Administrator', '2018-05-29 21:55:42');
INSERT INTO `user_log` VALUES (391, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 21:55:43');
INSERT INTO `user_log` VALUES (392, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/1', 'Administrator', '2018-05-29 21:55:49');
INSERT INTO `user_log` VALUES (393, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/1', 'Administrator', '2018-05-29 21:55:51');
INSERT INTO `user_log` VALUES (394, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 21:55:51');
INSERT INTO `user_log` VALUES (395, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/1', 'Administrator', '2018-05-29 21:55:59');
INSERT INTO `user_log` VALUES (396, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/1', 'Administrator', '2018-05-29 21:56:01');
INSERT INTO `user_log` VALUES (397, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/1', 'Administrator', '2018-05-29 21:56:24');
INSERT INTO `user_log` VALUES (398, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/1', 'Administrator', '2018-05-29 21:56:26');
INSERT INTO `user_log` VALUES (399, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 21:56:26');
INSERT INTO `user_log` VALUES (400, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/delete/2', 'Administrator', '2018-05-29 21:56:36');
INSERT INTO `user_log` VALUES (401, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 21:56:39');
INSERT INTO `user_log` VALUES (402, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/1', 'Administrator', '2018-05-29 21:56:46');
INSERT INTO `user_log` VALUES (403, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 21:57:41');
INSERT INTO `user_log` VALUES (404, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-05-29 21:57:55');
INSERT INTO `user_log` VALUES (405, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 21:57:59');
INSERT INTO `user_log` VALUES (406, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:03:04');
INSERT INTO `user_log` VALUES (407, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:03:19');
INSERT INTO `user_log` VALUES (408, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:04:15');
INSERT INTO `user_log` VALUES (409, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 22:04:54');
INSERT INTO `user_log` VALUES (410, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:06:42');
INSERT INTO `user_log` VALUES (411, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:07:24');
INSERT INTO `user_log` VALUES (412, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:07:39');
INSERT INTO `user_log` VALUES (413, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:07:46');
INSERT INTO `user_log` VALUES (414, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:08:55');
INSERT INTO `user_log` VALUES (415, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:14:28');
INSERT INTO `user_log` VALUES (416, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:14:47');
INSERT INTO `user_log` VALUES (417, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:15:05');
INSERT INTO `user_log` VALUES (418, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:16:00');
INSERT INTO `user_log` VALUES (419, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/approval/1', 'Administrator', '2018-05-29 22:16:03');
INSERT INTO `user_log` VALUES (420, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:16:07');
INSERT INTO `user_log` VALUES (421, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:16:22');
INSERT INTO `user_log` VALUES (422, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:16:53');
INSERT INTO `user_log` VALUES (423, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:17:07');
INSERT INTO `user_log` VALUES (424, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:17:54');
INSERT INTO `user_log` VALUES (425, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:18:14');
INSERT INTO `user_log` VALUES (426, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:19:07');
INSERT INTO `user_log` VALUES (427, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:19:47');
INSERT INTO `user_log` VALUES (428, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:20:27');
INSERT INTO `user_log` VALUES (429, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:21:01');
INSERT INTO `user_log` VALUES (430, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:21:15');
INSERT INTO `user_log` VALUES (431, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:21:36');
INSERT INTO `user_log` VALUES (432, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:21:58');
INSERT INTO `user_log` VALUES (433, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:22:10');
INSERT INTO `user_log` VALUES (434, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:22:25');
INSERT INTO `user_log` VALUES (435, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/kategori', 'Administrator', '2018-05-29 22:24:20');
INSERT INTO `user_log` VALUES (436, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:25:40');
INSERT INTO `user_log` VALUES (437, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:26:01');
INSERT INTO `user_log` VALUES (438, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:28:26');
INSERT INTO `user_log` VALUES (439, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:28:47');
INSERT INTO `user_log` VALUES (440, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:29:29');
INSERT INTO `user_log` VALUES (441, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:30:08');
INSERT INTO `user_log` VALUES (442, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:30:53');
INSERT INTO `user_log` VALUES (443, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:31:43');
INSERT INTO `user_log` VALUES (444, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:57:28');
INSERT INTO `user_log` VALUES (445, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/approval/1', 'Administrator', '2018-05-29 22:57:36');
INSERT INTO `user_log` VALUES (446, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:57:36');
INSERT INTO `user_log` VALUES (447, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/approval/1', 'Administrator', '2018-05-29 22:58:30');
INSERT INTO `user_log` VALUES (448, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:58:30');
INSERT INTO `user_log` VALUES (449, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:59:50');
INSERT INTO `user_log` VALUES (450, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/approval/1', 'Administrator', '2018-05-29 22:59:56');
INSERT INTO `user_log` VALUES (451, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 22:59:56');
INSERT INTO `user_log` VALUES (452, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 23:02:22');
INSERT INTO `user_log` VALUES (453, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/approval/2', 'Administrator', '2018-05-29 23:02:31');
INSERT INTO `user_log` VALUES (454, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-05-29 23:02:31');
INSERT INTO `user_log` VALUES (455, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/cetak/2', 'Administrator', '2018-05-29 23:04:41');
INSERT INTO `user_log` VALUES (456, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/cetak/2', 'Administrator', '2018-05-29 23:04:44');
INSERT INTO `user_log` VALUES (457, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-05-29 23:07:13');
INSERT INTO `user_log` VALUES (458, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-05-29 23:07:16');
INSERT INTO `user_log` VALUES (459, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/31/9', 'Administrator', '2018-05-29 23:07:19');
INSERT INTO `user_log` VALUES (460, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/detail/1', 'Administrator', '2018-05-29 23:20:25');
INSERT INTO `user_log` VALUES (461, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-29 23:29:01');
INSERT INTO `user_log` VALUES (462, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-29 23:31:27');
INSERT INTO `user_log` VALUES (463, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-29 23:31:39');
INSERT INTO `user_log` VALUES (464, '::1', 0, '-', '-', 'http://localhost/dlp/admin/dasbor', '-', '2018-05-30 08:06:01');
INSERT INTO `user_log` VALUES (465, '::1', 0, '-', '-', 'http://localhost/dlp/admin/dasbor', '-', '2018-05-30 08:06:41');
INSERT INTO `user_log` VALUES (466, '::1', 0, NULL, '', 'http://localhost/dlp/login/logout', 'Administrator', '2018-05-30 08:07:02');
INSERT INTO `user_log` VALUES (467, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-30 08:07:02');
INSERT INTO `user_log` VALUES (468, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-30 08:07:04');
INSERT INTO `user_log` VALUES (469, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-30 08:07:05');
INSERT INTO `user_log` VALUES (470, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-30 08:07:08');
INSERT INTO `user_log` VALUES (471, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang', 'Administrator', '2018-05-30 08:07:15');
INSERT INTO `user_log` VALUES (472, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang/tambah', 'Administrator', '2018-05-30 08:07:18');
INSERT INTO `user_log` VALUES (473, '::1', 0, '-', '-', 'http://localhost/dlp/admin/dasbor', '-', '2018-05-30 11:13:07');
INSERT INTO `user_log` VALUES (474, '::1', 0, '-', '-', 'http://localhost/dlp/admin/dasbor', '-', '2018-05-30 11:18:47');
INSERT INTO `user_log` VALUES (475, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-30 11:22:44');
INSERT INTO `user_log` VALUES (476, '::1', 0, NULL, '', 'http://localhost/dlp/login/lupa', 'Administrator', '2018-05-30 11:22:48');
INSERT INTO `user_log` VALUES (477, '::1', 0, NULL, '', 'http://localhost/dlp/login/lupa', 'Administrator', '2018-05-30 11:23:23');
INSERT INTO `user_log` VALUES (478, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-30 11:25:21');
INSERT INTO `user_log` VALUES (479, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:25:24');
INSERT INTO `user_log` VALUES (480, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:26:44');
INSERT INTO `user_log` VALUES (481, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:27:03');
INSERT INTO `user_log` VALUES (482, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:27:35');
INSERT INTO `user_log` VALUES (483, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:27:48');
INSERT INTO `user_log` VALUES (484, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:28:01');
INSERT INTO `user_log` VALUES (485, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:28:14');
INSERT INTO `user_log` VALUES (486, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:28:19');
INSERT INTO `user_log` VALUES (487, '::1', 0, NULL, '', 'http://localhost/dlp/login/lupa', 'Administrator', '2018-05-30 11:28:19');
INSERT INTO `user_log` VALUES (488, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:28:40');
INSERT INTO `user_log` VALUES (489, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:28:42');
INSERT INTO `user_log` VALUES (490, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:28:42');
INSERT INTO `user_log` VALUES (491, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:29:05');
INSERT INTO `user_log` VALUES (492, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:29:10');
INSERT INTO `user_log` VALUES (493, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:29:30');
INSERT INTO `user_log` VALUES (494, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:29:32');
INSERT INTO `user_log` VALUES (495, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:30:00');
INSERT INTO `user_log` VALUES (496, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:30:02');
INSERT INTO `user_log` VALUES (497, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:30:47');
INSERT INTO `user_log` VALUES (498, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:30:51');
INSERT INTO `user_log` VALUES (499, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:30:51');
INSERT INTO `user_log` VALUES (500, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:30:56');
INSERT INTO `user_log` VALUES (501, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:31:23');
INSERT INTO `user_log` VALUES (502, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:31:26');
INSERT INTO `user_log` VALUES (503, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:32:51');
INSERT INTO `user_log` VALUES (504, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:32:55');
INSERT INTO `user_log` VALUES (505, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:32:55');
INSERT INTO `user_log` VALUES (506, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:32:59');
INSERT INTO `user_log` VALUES (507, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/lupa', '-', '2018-05-30 11:32:59');
INSERT INTO `user_log` VALUES (508, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/change/acc5d43e0936dbf3f27b906891aaafdf9ede4508/4', '-', '2018-05-30 11:38:39');
INSERT INTO `user_log` VALUES (509, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/change/acc5d43e0936dbf3f27b906891aaafdf9ede4508/4', '-', '2018-05-30 11:39:29');
INSERT INTO `user_log` VALUES (510, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/change/acc5d43e0936dbf3f27b906891aaafdf9ede4508/4', '-', '2018-05-30 11:40:00');
INSERT INTO `user_log` VALUES (511, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/change/acc5d43e0936dbf3f27b906891aaafdf9ede4508/4', '-', '2018-05-30 11:40:23');
INSERT INTO `user_log` VALUES (512, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/change/acc5d43e0936dbf3f27b906891aaafdf9ede4508/4', '-', '2018-05-30 11:40:53');
INSERT INTO `user_log` VALUES (513, '::1', 0, '-', '-', 'http://localhost/dlp/member/login/change/acc5d43e0936dbf3f27b906891aaafdf9ede4508/4', '-', '2018-05-30 11:41:10');
INSERT INTO `user_log` VALUES (514, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-30 11:41:11');
INSERT INTO `user_log` VALUES (515, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-30 11:41:17');
INSERT INTO `user_log` VALUES (516, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-30 11:41:17');
INSERT INTO `user_log` VALUES (517, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-05-30 11:41:23');
INSERT INTO `user_log` VALUES (518, '::1', 2, 'andoyo', 'Users', 'http://localhost/dlp/member/dashboard', 'Member', '2018-05-30 11:41:23');
INSERT INTO `user_log` VALUES (519, '::1', 2, 'andoyo', 'Users', 'http://localhost/dlp/admin/dasbor', 'Member', '2018-05-30 13:18:24');
INSERT INTO `user_log` VALUES (520, '::1', 0, NULL, '', 'http://localhost/dlp/login/logout', 'Administrator', '2018-05-30 13:18:37');
INSERT INTO `user_log` VALUES (521, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-30 13:18:38');
INSERT INTO `user_log` VALUES (522, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-30 13:18:41');
INSERT INTO `user_log` VALUES (523, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-05-30 13:18:41');
INSERT INTO `user_log` VALUES (524, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-30 13:18:50');
INSERT INTO `user_log` VALUES (525, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_pdf/9', 'Administrator', '2018-05-30 13:18:56');
INSERT INTO `user_log` VALUES (526, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/export_excel/9', 'Administrator', '2018-05-30 13:19:28');
INSERT INTO `user_log` VALUES (527, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil', 'Administrator', '2018-05-30 13:26:50');
INSERT INTO `user_log` VALUES (528, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/dashboard', 'Administrator', '2018-05-30 13:26:54');
INSERT INTO `user_log` VALUES (529, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login/logout', 'Administrator', '2018-05-30 13:26:58');
INSERT INTO `user_log` VALUES (530, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-05-30 13:26:59');
INSERT INTO `user_log` VALUES (531, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-05-30 13:27:02');
INSERT INTO `user_log` VALUES (532, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/dashboard', 'Administrator', '2018-05-30 13:27:02');
INSERT INTO `user_log` VALUES (533, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/pekerjaan', 'Administrator', '2018-05-30 13:27:06');
INSERT INTO `user_log` VALUES (534, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/pekerjaan/tambah', 'Administrator', '2018-05-30 13:27:09');
INSERT INTO `user_log` VALUES (535, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/pekerjaan/tambah', 'Administrator', '2018-05-30 13:27:38');
INSERT INTO `user_log` VALUES (536, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/pekerjaan', 'Administrator', '2018-05-30 13:27:38');
INSERT INTO `user_log` VALUES (537, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/dashboard', 'Administrator', '2018-05-30 13:27:58');
INSERT INTO `user_log` VALUES (538, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil', 'Administrator', '2018-05-30 13:28:06');
INSERT INTO `user_log` VALUES (539, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/program', 'Administrator', '2018-05-30 13:28:12');
INSERT INTO `user_log` VALUES (540, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/keluarga', 'Administrator', '2018-05-30 13:28:19');
INSERT INTO `user_log` VALUES (541, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/keluarga/tambah', 'Administrator', '2018-05-30 13:28:21');
INSERT INTO `user_log` VALUES (542, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/keluarga/tambah', 'Administrator', '2018-05-30 13:28:32');
INSERT INTO `user_log` VALUES (543, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/keluarga', 'Administrator', '2018-05-30 13:28:33');
INSERT INTO `user_log` VALUES (544, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/pendidikan', 'Administrator', '2018-05-30 13:28:39');
INSERT INTO `user_log` VALUES (545, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/pendidikan/tambah', 'Administrator', '2018-05-30 13:28:42');
INSERT INTO `user_log` VALUES (546, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/pendidikan/tambah', 'Administrator', '2018-05-30 13:28:59');
INSERT INTO `user_log` VALUES (547, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/pendidikan', 'Administrator', '2018-05-30 13:29:00');
INSERT INTO `user_log` VALUES (548, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/none', 'Administrator', '2018-05-30 13:29:01');
INSERT INTO `user_log` VALUES (549, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/dashboard', 'Administrator', '2018-05-30 13:29:04');
INSERT INTO `user_log` VALUES (550, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/cetak', 'Administrator', '2018-05-30 13:29:16');
INSERT INTO `user_log` VALUES (551, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/cetak/unduh', 'Administrator', '2018-05-30 13:29:19');
INSERT INTO `user_log` VALUES (552, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/cetak/unduh', 'Administrator', '2018-05-30 13:29:22');
INSERT INTO `user_log` VALUES (553, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/dashboard', 'Administrator', '2018-05-30 13:29:50');
INSERT INTO `user_log` VALUES (554, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil', 'Administrator', '2018-05-30 13:29:55');
INSERT INTO `user_log` VALUES (555, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/pekerjaan', 'Administrator', '2018-05-30 13:30:00');
INSERT INTO `user_log` VALUES (556, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/dashboard', 'Administrator', '2018-05-30 13:30:07');
INSERT INTO `user_log` VALUES (557, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/rekomendasi', 'Administrator', '2018-05-30 13:33:49');
INSERT INTO `user_log` VALUES (558, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/rekomendasi/tambah', 'Administrator', '2018-05-30 13:33:56');
INSERT INTO `user_log` VALUES (559, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/program', 'Administrator', '2018-05-30 13:34:10');
INSERT INTO `user_log` VALUES (560, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/program/edit', 'Administrator', '2018-05-30 13:34:20');
INSERT INTO `user_log` VALUES (561, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/program', 'Administrator', '2018-05-30 13:34:42');
INSERT INTO `user_log` VALUES (562, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/rekomendasi', 'Administrator', '2018-05-30 13:35:09');
INSERT INTO `user_log` VALUES (563, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/dashboard', 'Administrator', '2018-05-30 13:36:18');
INSERT INTO `user_log` VALUES (564, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/dashboard', 'Administrator', '2018-05-30 13:37:05');
INSERT INTO `user_log` VALUES (565, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login/logout', 'Administrator', '2018-05-30 13:37:31');
INSERT INTO `user_log` VALUES (566, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-05-30 13:37:32');
INSERT INTO `user_log` VALUES (567, '::1', 5, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-30 13:38:45');
INSERT INTO `user_log` VALUES (568, '::1', 5, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-05-30 13:39:18');
INSERT INTO `user_log` VALUES (569, '::1', 11, 'dkijakarta', 'Provinsi', 'http://localhost/dlp/provinsi/dasbor', 'Administrator', '2018-05-30 13:39:19');
INSERT INTO `user_log` VALUES (570, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-07-04 11:53:50');
INSERT INTO `user_log` VALUES (571, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-07-04 11:53:53');
INSERT INTO `user_log` VALUES (572, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-07-04 11:53:53');
INSERT INTO `user_log` VALUES (573, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-07-04 11:54:16');
INSERT INTO `user_log` VALUES (574, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-07-04 11:54:32');
INSERT INTO `user_log` VALUES (575, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/31/9', 'Administrator', '2018-07-04 11:54:39');
INSERT INTO `user_log` VALUES (576, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user', 'Administrator', '2018-07-04 11:54:50');
INSERT INTO `user_log` VALUES (577, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user/edit/13', 'Administrator', '2018-07-04 11:55:20');
INSERT INTO `user_log` VALUES (578, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user/edit/13', 'Administrator', '2018-07-04 11:55:25');
INSERT INTO `user_log` VALUES (579, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user', 'Administrator', '2018-07-04 11:55:28');
INSERT INTO `user_log` VALUES (580, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user', 'Administrator', '2018-07-04 11:56:19');
INSERT INTO `user_log` VALUES (581, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user/tambah', 'Administrator', '2018-07-04 11:56:26');
INSERT INTO `user_log` VALUES (582, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user/tambah', 'Administrator', '2018-07-04 11:56:34');
INSERT INTO `user_log` VALUES (583, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user', 'Administrator', '2018-07-04 11:56:35');
INSERT INTO `user_log` VALUES (584, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user', 'Administrator', '2018-07-04 11:57:11');
INSERT INTO `user_log` VALUES (585, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user/delete/10', 'Administrator', '2018-07-04 11:57:17');
INSERT INTO `user_log` VALUES (586, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/user', 'Administrator', '2018-07-04 11:57:17');
INSERT INTO `user_log` VALUES (587, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-07-04 11:57:37');
INSERT INTO `user_log` VALUES (588, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-07-04 11:58:08');
INSERT INTO `user_log` VALUES (589, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/31/9', 'Administrator', '2018-07-04 11:58:12');
INSERT INTO `user_log` VALUES (590, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/31/9', 'Administrator', '2018-07-04 11:58:44');
INSERT INTO `user_log` VALUES (591, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-07-04 11:58:45');
INSERT INTO `user_log` VALUES (592, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-07-04 12:00:59');
INSERT INTO `user_log` VALUES (593, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-09-04 10:03:16');
INSERT INTO `user_log` VALUES (594, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-09-04 10:03:19');
INSERT INTO `user_log` VALUES (595, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-09-04 10:03:20');
INSERT INTO `user_log` VALUES (596, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-09-04 10:04:06');
INSERT INTO `user_log` VALUES (597, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-09-04 10:35:40');
INSERT INTO `user_log` VALUES (598, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-09-04 10:35:42');
INSERT INTO `user_log` VALUES (599, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-09-04 10:35:42');
INSERT INTO `user_log` VALUES (600, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-09-04 10:35:45');
INSERT INTO `user_log` VALUES (601, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-09-04 10:35:46');
INSERT INTO `user_log` VALUES (602, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang/tambah', 'Administrator', '2018-09-04 10:37:04');
INSERT INTO `user_log` VALUES (603, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang/tambah', 'Administrator', '2018-09-04 10:38:45');
INSERT INTO `user_log` VALUES (604, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang/tambah', 'Administrator', '2018-09-04 10:39:26');
INSERT INTO `user_log` VALUES (605, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang/tambah', 'Administrator', '2018-09-04 10:40:30');
INSERT INTO `user_log` VALUES (606, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang/tambah', 'Administrator', '2018-09-04 10:43:45');
INSERT INTO `user_log` VALUES (607, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang', 'Administrator', '2018-09-04 10:43:47');
INSERT INTO `user_log` VALUES (608, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang', 'Administrator', '2018-09-04 10:44:46');
INSERT INTO `user_log` VALUES (609, '::1', 5, NULL, '', 'http://localhost/dlp/login/logout', 'Administrator', '2018-09-04 10:50:25');
INSERT INTO `user_log` VALUES (610, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-09-04 10:50:25');
INSERT INTO `user_log` VALUES (611, '::1', 0, '-', '-', 'http://localhost/dlp/admin/gelombang/tambah', '-', '2018-09-04 11:39:35');
INSERT INTO `user_log` VALUES (612, '::1', 0, '-', '-', 'http://localhost/dlp/admin/login/logout', '-', '2018-09-04 11:39:53');
INSERT INTO `user_log` VALUES (613, '::1', 0, NULL, '', 'http://localhost/dlp/login/logout', 'Administrator', '2018-09-04 11:40:04');
INSERT INTO `user_log` VALUES (614, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-09-04 11:40:05');
INSERT INTO `user_log` VALUES (615, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-09-04 11:40:08');
INSERT INTO `user_log` VALUES (616, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-09-04 11:40:09');
INSERT INTO `user_log` VALUES (617, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-09-04 11:40:22');
INSERT INTO `user_log` VALUES (618, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang', 'Administrator', '2018-09-04 11:40:30');
INSERT INTO `user_log` VALUES (619, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang/edit/9', 'Administrator', '2018-09-04 11:40:36');
INSERT INTO `user_log` VALUES (620, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang/edit/9', 'Administrator', '2018-09-04 11:41:07');
INSERT INTO `user_log` VALUES (621, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang/edit/9', 'Administrator', '2018-09-04 11:43:55');
INSERT INTO `user_log` VALUES (622, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang/edit/9', 'Administrator', '2018-09-04 11:47:26');
INSERT INTO `user_log` VALUES (623, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang', 'Administrator', '2018-09-04 11:47:26');
INSERT INTO `user_log` VALUES (624, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang', 'Administrator', '2018-09-04 11:48:02');
INSERT INTO `user_log` VALUES (625, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/gelombang', 'Administrator', '2018-09-04 12:20:19');
INSERT INTO `user_log` VALUES (626, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-09-04 12:40:08');
INSERT INTO `user_log` VALUES (627, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-09-04 12:40:13');
INSERT INTO `user_log` VALUES (628, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-09-04 12:40:28');
INSERT INTO `user_log` VALUES (629, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-09-04 12:40:32');
INSERT INTO `user_log` VALUES (630, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/12/9', 'Administrator', '2018-09-04 12:40:34');
INSERT INTO `user_log` VALUES (631, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-09-04 12:43:36');
INSERT INTO `user_log` VALUES (632, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-09-04 12:43:38');
INSERT INTO `user_log` VALUES (633, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-09-04 12:43:43');
INSERT INTO `user_log` VALUES (634, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-09-04 12:43:46');
INSERT INTO `user_log` VALUES (635, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-09-04 12:43:49');
INSERT INTO `user_log` VALUES (636, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-09-04 12:43:51');
INSERT INTO `user_log` VALUES (637, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-09-04 12:43:55');
INSERT INTO `user_log` VALUES (638, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-09-04 12:43:56');
INSERT INTO `user_log` VALUES (639, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/12/9', 'Administrator', '2018-09-04 12:43:58');
INSERT INTO `user_log` VALUES (640, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-09-04 12:44:02');
INSERT INTO `user_log` VALUES (641, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-09-04 12:45:18');
INSERT INTO `user_log` VALUES (642, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-09-04 12:45:21');
INSERT INTO `user_log` VALUES (643, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/12/9', 'Administrator', '2018-09-04 12:45:23');
INSERT INTO `user_log` VALUES (644, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-09-04 12:45:25');
INSERT INTO `user_log` VALUES (645, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/12/9', 'Administrator', '2018-09-04 12:45:31');
INSERT INTO `user_log` VALUES (646, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-09-04 12:45:34');
INSERT INTO `user_log` VALUES (647, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/12/9', 'Administrator', '2018-09-04 13:33:49');
INSERT INTO `user_log` VALUES (648, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-09-04 13:34:29');
INSERT INTO `user_log` VALUES (649, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-09-04 13:34:31');
INSERT INTO `user_log` VALUES (650, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-09-04 13:35:18');
INSERT INTO `user_log` VALUES (651, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/12/9', 'Administrator', '2018-09-04 13:35:20');
INSERT INTO `user_log` VALUES (652, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/12/9', 'Administrator', '2018-09-04 13:44:04');
INSERT INTO `user_log` VALUES (653, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-09-04 13:44:07');
INSERT INTO `user_log` VALUES (654, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-09-04 13:44:09');
INSERT INTO `user_log` VALUES (655, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/34/9', 'Administrator', '2018-09-04 13:44:11');
INSERT INTO `user_log` VALUES (656, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-09-04 14:05:55');
INSERT INTO `user_log` VALUES (657, '::1', 1, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-09-24 10:59:56');
INSERT INTO `user_log` VALUES (658, '::1', 1, NULL, '', 'http://localhost/dlp/login/logout', 'Administrator', '2018-09-24 11:00:13');
INSERT INTO `user_log` VALUES (659, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-09-24 11:00:13');
INSERT INTO `user_log` VALUES (660, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-09-24 11:00:19');
INSERT INTO `user_log` VALUES (661, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-09-24 11:00:20');
INSERT INTO `user_log` VALUES (662, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-09-24 11:00:26');
INSERT INTO `user_log` VALUES (663, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/delete/1', 'Administrator', '2018-09-24 11:00:34');
INSERT INTO `user_log` VALUES (664, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-09-24 11:02:50');
INSERT INTO `user_log` VALUES (665, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-09-24 11:06:44');
INSERT INTO `user_log` VALUES (666, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-09-24 11:06:53');
INSERT INTO `user_log` VALUES (667, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/34/9', 'Administrator', '2018-09-24 11:06:56');
INSERT INTO `user_log` VALUES (668, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/34/9', 'Administrator', '2018-09-24 11:08:29');
INSERT INTO `user_log` VALUES (669, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/34/9', 'Administrator', '2018-09-24 11:08:36');
INSERT INTO `user_log` VALUES (670, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/34/9', 'Administrator', '2018-09-24 11:14:33');
INSERT INTO `user_log` VALUES (671, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/hapus/1', 'Administrator', '2018-09-24 11:14:37');
INSERT INTO `user_log` VALUES (672, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/34/9', 'Administrator', '2018-09-24 11:16:33');
INSERT INTO `user_log` VALUES (673, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/hapus/1', 'Administrator', '2018-09-24 11:16:40');
INSERT INTO `user_log` VALUES (674, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/34/9', 'Administrator', '2018-09-24 11:16:40');
INSERT INTO `user_log` VALUES (675, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-09-24 13:28:06');
INSERT INTO `user_log` VALUES (676, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-09-24 13:28:12');
INSERT INTO `user_log` VALUES (677, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-09-24 13:28:12');
INSERT INTO `user_log` VALUES (678, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-09-24 13:28:21');
INSERT INTO `user_log` VALUES (679, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-09-24 13:28:21');
INSERT INTO `user_log` VALUES (680, '::1', 5, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-09-24 13:32:30');
INSERT INTO `user_log` VALUES (681, '::1', 5, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-09-24 13:32:38');
INSERT INTO `user_log` VALUES (682, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-09-24 13:32:39');
INSERT INTO `user_log` VALUES (683, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-09-24 13:32:55');
INSERT INTO `user_log` VALUES (684, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/kelola/11', 'Administrator', '2018-09-24 13:33:00');
INSERT INTO `user_log` VALUES (685, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/edit/1', 'Administrator', '2018-09-24 13:33:04');
INSERT INTO `user_log` VALUES (686, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-10-10 10:46:43');
INSERT INTO `user_log` VALUES (687, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-10-10 10:46:52');
INSERT INTO `user_log` VALUES (688, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-10-10 10:46:53');
INSERT INTO `user_log` VALUES (689, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-10-10 10:47:02');
INSERT INTO `user_log` VALUES (690, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-10-10 10:47:02');
INSERT INTO `user_log` VALUES (691, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-10-10 10:47:09');
INSERT INTO `user_log` VALUES (692, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-10-10 10:47:09');
INSERT INTO `user_log` VALUES (693, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-10-10 10:47:15');
INSERT INTO `user_log` VALUES (694, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-10-10 10:47:16');
INSERT INTO `user_log` VALUES (695, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-10-10 10:49:51');
INSERT INTO `user_log` VALUES (696, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-10-10 10:49:55');
INSERT INTO `user_log` VALUES (697, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/dashboard', 'Member', '2018-10-10 10:49:56');
INSERT INTO `user_log` VALUES (698, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/program', 'Member', '2018-10-10 10:50:01');
INSERT INTO `user_log` VALUES (699, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/program/edit', 'Member', '2018-10-10 10:50:22');
INSERT INTO `user_log` VALUES (700, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/profil', 'Member', '2018-10-10 10:50:32');
INSERT INTO `user_log` VALUES (701, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/profil/edit', 'Member', '2018-10-10 10:50:48');
INSERT INTO `user_log` VALUES (702, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/profil/edit', 'Member', '2018-10-10 10:51:39');
INSERT INTO `user_log` VALUES (703, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/profil', 'Member', '2018-10-10 10:51:41');
INSERT INTO `user_log` VALUES (704, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/keluarga', 'Member', '2018-10-10 10:51:58');
INSERT INTO `user_log` VALUES (705, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/keluarga/tambah', 'Member', '2018-10-10 10:52:01');
INSERT INTO `user_log` VALUES (706, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/keluarga/tambah', 'Member', '2018-10-10 10:52:16');
INSERT INTO `user_log` VALUES (707, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/keluarga', 'Member', '2018-10-10 10:52:17');
INSERT INTO `user_log` VALUES (708, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/pendidikan', 'Member', '2018-10-10 10:52:22');
INSERT INTO `user_log` VALUES (709, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/pendidikan/tambah', 'Member', '2018-10-10 10:52:25');
INSERT INTO `user_log` VALUES (710, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/pendidikan/tambah', 'Member', '2018-10-10 10:52:49');
INSERT INTO `user_log` VALUES (711, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/pendidikan', 'Member', '2018-10-10 10:52:50');
INSERT INTO `user_log` VALUES (712, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/none', 'Member', '2018-10-10 10:52:51');
INSERT INTO `user_log` VALUES (713, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/pekerjaan', 'Member', '2018-10-10 10:52:56');
INSERT INTO `user_log` VALUES (714, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/pekerjaan/tambah', 'Member', '2018-10-10 10:52:59');
INSERT INTO `user_log` VALUES (715, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/pekerjaan/tambah', 'Member', '2018-10-10 10:53:37');
INSERT INTO `user_log` VALUES (716, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/pekerjaan', 'Member', '2018-10-10 10:53:38');
INSERT INTO `user_log` VALUES (717, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/dashboard', 'Member', '2018-10-10 10:53:43');
INSERT INTO `user_log` VALUES (718, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/dashboard', 'Member', '2018-10-10 10:55:38');
INSERT INTO `user_log` VALUES (719, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/dashboard', 'Member', '2018-10-10 10:55:48');
INSERT INTO `user_log` VALUES (720, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/dashboard', 'Member', '2018-10-10 10:55:59');
INSERT INTO `user_log` VALUES (721, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/dashboard', 'Member', '2018-10-10 10:56:14');
INSERT INTO `user_log` VALUES (722, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/unduh', 'Member', '2018-10-10 10:56:17');
INSERT INTO `user_log` VALUES (723, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/dashboard', 'Member', '2018-10-10 10:56:38');
INSERT INTO `user_log` VALUES (724, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/cetak', 'Member', '2018-10-10 10:57:16');
INSERT INTO `user_log` VALUES (725, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/cetak', 'Member', '2018-10-10 10:58:37');
INSERT INTO `user_log` VALUES (726, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/dashboard', 'Member', '2018-10-10 10:59:20');
INSERT INTO `user_log` VALUES (727, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/cetak/printer', 'Member', '2018-10-10 10:59:23');
INSERT INTO `user_log` VALUES (728, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/cetak/printer', 'Member', '2018-10-10 11:00:51');
INSERT INTO `user_log` VALUES (729, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/cetak/cetaksaja', 'Member', '2018-10-10 11:00:55');
INSERT INTO `user_log` VALUES (730, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/cetak/cetaksaja', 'Member', '2018-10-10 11:01:17');
INSERT INTO `user_log` VALUES (731, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/cetak/printer', 'Member', '2018-10-10 11:01:37');
INSERT INTO `user_log` VALUES (732, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/cetak/cetaksaja', 'Member', '2018-10-10 11:01:39');
INSERT INTO `user_log` VALUES (733, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/cetak/cetaksaja', 'Member', '2018-10-10 11:03:17');
INSERT INTO `user_log` VALUES (734, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/cetak/cetaksaja', 'Member', '2018-10-10 11:03:23');
INSERT INTO `user_log` VALUES (735, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/login/logout', 'Member', '2018-10-10 11:12:11');
INSERT INTO `user_log` VALUES (736, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-10-10 11:12:12');
INSERT INTO `user_log` VALUES (737, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-10-10 11:12:24');
INSERT INTO `user_log` VALUES (738, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-10-10 11:12:28');
INSERT INTO `user_log` VALUES (739, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-10-10 11:12:28');
INSERT INTO `user_log` VALUES (740, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-10-10 11:12:31');
INSERT INTO `user_log` VALUES (741, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-10-10 11:12:32');
INSERT INTO `user_log` VALUES (742, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-10-10 11:13:15');
INSERT INTO `user_log` VALUES (743, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor/pesan_cetak', 'Administrator', '2018-10-10 11:13:19');
INSERT INTO `user_log` VALUES (744, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor/pesan_cetak', 'Administrator', '2018-10-10 11:13:37');
INSERT INTO `user_log` VALUES (745, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor/pesan_cetak', 'Administrator', '2018-10-10 11:14:24');
INSERT INTO `user_log` VALUES (746, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor/pesan_cetak', 'Administrator', '2018-10-10 11:14:48');
INSERT INTO `user_log` VALUES (747, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor/pesan_cetak', 'Administrator', '2018-10-10 11:14:49');
INSERT INTO `user_log` VALUES (748, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/cetak/printer', 'Administrator', '2018-10-10 11:14:54');
INSERT INTO `user_log` VALUES (749, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-10-10 11:14:59');
INSERT INTO `user_log` VALUES (750, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-10-10 11:15:03');
INSERT INTO `user_log` VALUES (751, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-10-10 11:15:03');
INSERT INTO `user_log` VALUES (752, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-10-10 11:15:08');
INSERT INTO `user_log` VALUES (753, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/dashboard', 'Administrator', '2018-10-10 11:15:08');
INSERT INTO `user_log` VALUES (754, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/cetak/printer', 'Administrator', '2018-10-10 11:15:13');
INSERT INTO `user_log` VALUES (755, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/cetak/cetaksaja', 'Administrator', '2018-10-10 11:15:15');
INSERT INTO `user_log` VALUES (756, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/cetak/cetaksaja', 'Administrator', '2018-10-10 11:17:01');
INSERT INTO `user_log` VALUES (757, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil', 'Administrator', '2018-10-10 11:20:53');
INSERT INTO `user_log` VALUES (758, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil', 'Administrator', '2018-10-10 11:21:38');
INSERT INTO `user_log` VALUES (759, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/password', 'Administrator', '2018-10-10 11:21:43');
INSERT INTO `user_log` VALUES (760, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/password', 'Administrator', '2018-10-10 11:25:38');
INSERT INTO `user_log` VALUES (761, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil', 'Administrator', '2018-10-10 11:25:43');
INSERT INTO `user_log` VALUES (762, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil/password', 'Administrator', '2018-10-10 11:25:48');
INSERT INTO `user_log` VALUES (763, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil/password', 'Administrator', '2018-10-10 11:25:57');
INSERT INTO `user_log` VALUES (764, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil/password', 'Administrator', '2018-10-10 11:26:46');
INSERT INTO `user_log` VALUES (765, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil/password', 'Administrator', '2018-10-10 11:28:29');
INSERT INTO `user_log` VALUES (766, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil/password', 'Administrator', '2018-10-10 11:29:40');
INSERT INTO `user_log` VALUES (767, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil/password', 'Administrator', '2018-10-10 11:29:46');
INSERT INTO `user_log` VALUES (768, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil/password', 'Administrator', '2018-10-10 11:30:30');
INSERT INTO `user_log` VALUES (769, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil/password', 'Administrator', '2018-10-10 11:30:36');
INSERT INTO `user_log` VALUES (770, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil/password', 'Administrator', '2018-10-10 11:30:48');
INSERT INTO `user_log` VALUES (771, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil/password', 'Administrator', '2018-10-10 11:31:00');
INSERT INTO `user_log` VALUES (772, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil/password', 'Administrator', '2018-10-10 11:31:01');
INSERT INTO `user_log` VALUES (773, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil/password', 'Administrator', '2018-10-10 11:31:21');
INSERT INTO `user_log` VALUES (774, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil/password', 'Administrator', '2018-10-10 11:31:21');
INSERT INTO `user_log` VALUES (775, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login/logout', 'Administrator', '2018-10-10 11:31:26');
INSERT INTO `user_log` VALUES (776, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-10-10 11:31:26');
INSERT INTO `user_log` VALUES (777, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-10-10 11:31:32');
INSERT INTO `user_log` VALUES (778, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/dashboard', 'Administrator', '2018-10-10 11:31:33');
INSERT INTO `user_log` VALUES (779, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-10-10 11:31:48');
INSERT INTO `user_log` VALUES (780, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kelola/9', 'Administrator', '2018-10-10 11:31:55');
INSERT INTO `user_log` VALUES (781, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/11/9', 'Administrator', '2018-10-10 11:31:58');
INSERT INTO `user_log` VALUES (782, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/cetak/1', 'Administrator', '2018-10-10 11:32:03');
INSERT INTO `user_log` VALUES (783, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/cetak/1', 'Administrator', '2018-10-10 11:33:44');
INSERT INTO `user_log` VALUES (784, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/detail/1', 'Administrator', '2018-10-10 11:40:01');
INSERT INTO `user_log` VALUES (785, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/11/9', 'Administrator', '2018-10-10 11:57:42');
INSERT INTO `user_log` VALUES (786, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/11/9', 'Administrator', '2018-10-10 11:58:13');
INSERT INTO `user_log` VALUES (787, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/11/9', 'Administrator', '2018-10-10 11:58:40');
INSERT INTO `user_log` VALUES (788, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/11/9', 'Administrator', '2018-10-10 11:59:10');
INSERT INTO `user_log` VALUES (789, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/11/9', 'Administrator', '2018-10-10 11:59:26');
INSERT INTO `user_log` VALUES (790, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/11/9', 'Administrator', '2018-10-10 11:59:54');
INSERT INTO `user_log` VALUES (791, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/11/9', 'Administrator', '2018-10-10 12:00:13');
INSERT INTO `user_log` VALUES (792, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/11/9', 'Administrator', '2018-10-10 12:00:48');
INSERT INTO `user_log` VALUES (793, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/11/9', 'Administrator', '2018-10-10 12:01:47');
INSERT INTO `user_log` VALUES (794, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/provinsi/11/9', 'Administrator', '2018-10-10 12:01:56');
INSERT INTO `user_log` VALUES (795, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/printer/1', 'Administrator', '2018-10-10 12:02:00');
INSERT INTO `user_log` VALUES (796, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/detail/1', 'Administrator', '2018-10-10 12:02:24');
INSERT INTO `user_log` VALUES (797, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-10-10 12:04:45');
INSERT INTO `user_log` VALUES (798, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-10 12:04:53');
INSERT INTO `user_log` VALUES (799, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/detail/1', 'Administrator', '2018-10-10 12:05:15');
INSERT INTO `user_log` VALUES (800, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-10 12:05:18');
INSERT INTO `user_log` VALUES (801, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-10-10 12:07:35');
INSERT INTO `user_log` VALUES (802, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/kampus/9', 'Administrator', '2018-10-10 12:07:48');
INSERT INTO `user_log` VALUES (803, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran', 'Administrator', '2018-10-10 12:07:55');
INSERT INTO `user_log` VALUES (804, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-10 12:08:45');
INSERT INTO `user_log` VALUES (805, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-10 12:08:49');
INSERT INTO `user_log` VALUES (806, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-10 12:09:54');
INSERT INTO `user_log` VALUES (807, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil', 'Administrator', '2018-10-10 13:35:36');
INSERT INTO `user_log` VALUES (808, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/dashboard', 'Administrator', '2018-10-10 13:35:45');
INSERT INTO `user_log` VALUES (809, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/cetak/printer', 'Administrator', '2018-10-10 13:35:53');
INSERT INTO `user_log` VALUES (810, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/cetak/cetaksaja', 'Administrator', '2018-10-10 13:35:57');
INSERT INTO `user_log` VALUES (811, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/cetak/cetaksaja', 'Administrator', '2018-10-10 13:37:52');
INSERT INTO `user_log` VALUES (812, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/cetak/cetaksaja', 'Administrator', '2018-10-10 13:38:21');
INSERT INTO `user_log` VALUES (813, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/cetak/cetaksaja', 'Administrator', '2018-10-10 13:38:55');
INSERT INTO `user_log` VALUES (814, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/cetak/cetaksaja', 'Administrator', '2018-10-10 13:39:50');
INSERT INTO `user_log` VALUES (815, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/cetak/cetaksaja', 'Administrator', '2018-10-10 13:40:17');
INSERT INTO `user_log` VALUES (816, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/cetak/cetaksaja', 'Administrator', '2018-10-10 13:40:52');
INSERT INTO `user_log` VALUES (817, '::1', 0, '-', '-', 'http://localhost/dlp/member/cetak/cetaksaja', '-', '2018-10-10 15:50:32');
INSERT INTO `user_log` VALUES (818, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-10-10 15:50:38');
INSERT INTO `user_log` VALUES (819, '::1', 0, '-', '-', 'http://localhost/dlp/member/login', '-', '2018-10-10 15:50:41');
INSERT INTO `user_log` VALUES (820, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/dashboard', 'Member', '2018-10-10 15:50:42');
INSERT INTO `user_log` VALUES (821, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/cetak/printer', 'Member', '2018-10-10 15:50:45');
INSERT INTO `user_log` VALUES (822, '::1', 1, 'andoyo', 'Users', 'http://localhost/dlp/member/cetak/cetaksaja', 'Member', '2018-10-10 15:50:50');
INSERT INTO `user_log` VALUES (823, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-10-11 04:14:18');
INSERT INTO `user_log` VALUES (824, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-10-11 04:14:22');
INSERT INTO `user_log` VALUES (825, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-10-11 04:14:23');
INSERT INTO `user_log` VALUES (826, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-11 04:14:29');
INSERT INTO `user_log` VALUES (827, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:14:33');
INSERT INTO `user_log` VALUES (828, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:15:41');
INSERT INTO `user_log` VALUES (829, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-11 04:15:43');
INSERT INTO `user_log` VALUES (830, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/printer/1', 'Administrator', '2018-10-11 04:16:50');
INSERT INTO `user_log` VALUES (831, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/detail/1', 'Administrator', '2018-10-11 04:16:56');
INSERT INTO `user_log` VALUES (832, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/detail/1', 'Administrator', '2018-10-11 04:17:05');
INSERT INTO `user_log` VALUES (833, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/detail/1', 'Administrator', '2018-10-11 04:18:00');
INSERT INTO `user_log` VALUES (834, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-11 04:18:06');
INSERT INTO `user_log` VALUES (835, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:18:11');
INSERT INTO `user_log` VALUES (836, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_profile/1', 'Administrator', '2018-10-11 04:18:20');
INSERT INTO `user_log` VALUES (837, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/profil', 'Administrator', '2018-10-11 04:18:20');
INSERT INTO `user_log` VALUES (838, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:24:28');
INSERT INTO `user_log` VALUES (839, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:24:31');
INSERT INTO `user_log` VALUES (840, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_profile/1', 'Administrator', '2018-10-11 04:24:45');
INSERT INTO `user_log` VALUES (841, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:24:45');
INSERT INTO `user_log` VALUES (842, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:25:30');
INSERT INTO `user_log` VALUES (843, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_profile/1', 'Administrator', '2018-10-11 04:25:40');
INSERT INTO `user_log` VALUES (844, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:25:41');
INSERT INTO `user_log` VALUES (845, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-11 04:26:43');
INSERT INTO `user_log` VALUES (846, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:26:47');
INSERT INTO `user_log` VALUES (847, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:27:06');
INSERT INTO `user_log` VALUES (848, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:28:09');
INSERT INTO `user_log` VALUES (849, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:29:39');
INSERT INTO `user_log` VALUES (850, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-11 04:30:36');
INSERT INTO `user_log` VALUES (851, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/printer/1', 'Administrator', '2018-10-11 04:30:43');
INSERT INTO `user_log` VALUES (852, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-11 04:31:52');
INSERT INTO `user_log` VALUES (853, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-11 04:32:19');
INSERT INTO `user_log` VALUES (854, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-11 04:32:39');
INSERT INTO `user_log` VALUES (855, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-11 04:32:49');
INSERT INTO `user_log` VALUES (856, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:32:51');
INSERT INTO `user_log` VALUES (857, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-11 04:32:54');
INSERT INTO `user_log` VALUES (858, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:49:37');
INSERT INTO `user_log` VALUES (859, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/akses/1', 'Administrator', '2018-10-11 04:49:42');
INSERT INTO `user_log` VALUES (860, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-11 04:49:50');
INSERT INTO `user_log` VALUES (861, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-11 04:50:21');
INSERT INTO `user_log` VALUES (862, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:50:28');
INSERT INTO `user_log` VALUES (863, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:51:19');
INSERT INTO `user_log` VALUES (864, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_pengusul/1', 'Administrator', '2018-10-11 04:51:24');
INSERT INTO `user_log` VALUES (865, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:56:05');
INSERT INTO `user_log` VALUES (866, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:56:27');
INSERT INTO `user_log` VALUES (867, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:57:15');
INSERT INTO `user_log` VALUES (868, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 04:57:20');
INSERT INTO `user_log` VALUES (869, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 04:58:32');
INSERT INTO `user_log` VALUES (870, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/login', 'Administrator', '2018-10-11 04:58:33');
INSERT INTO `user_log` VALUES (871, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 04:58:50');
INSERT INTO `user_log` VALUES (872, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 04:58:55');
INSERT INTO `user_log` VALUES (873, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 04:59:46');
INSERT INTO `user_log` VALUES (874, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/semua/9', 'Administrator', '2018-10-11 04:59:51');
INSERT INTO `user_log` VALUES (875, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 05:00:07');
INSERT INTO `user_log` VALUES (876, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:00:16');
INSERT INTO `user_log` VALUES (877, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:00:22');
INSERT INTO `user_log` VALUES (878, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 05:00:48');
INSERT INTO `user_log` VALUES (879, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:00:54');
INSERT INTO `user_log` VALUES (880, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:03:55');
INSERT INTO `user_log` VALUES (881, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:07:16');
INSERT INTO `user_log` VALUES (882, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:07:36');
INSERT INTO `user_log` VALUES (883, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:07:59');
INSERT INTO `user_log` VALUES (884, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:09:07');
INSERT INTO `user_log` VALUES (885, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:10:33');
INSERT INTO `user_log` VALUES (886, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 05:15:51');
INSERT INTO `user_log` VALUES (887, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 05:17:31');
INSERT INTO `user_log` VALUES (888, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_keluarga/8', 'Administrator', '2018-10-11 05:20:23');
INSERT INTO `user_log` VALUES (889, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 05:20:23');
INSERT INTO `user_log` VALUES (890, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:23:58');
INSERT INTO `user_log` VALUES (891, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:26:42');
INSERT INTO `user_log` VALUES (892, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:27:33');
INSERT INTO `user_log` VALUES (893, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:27:57');
INSERT INTO `user_log` VALUES (894, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:28:44');
INSERT INTO `user_log` VALUES (895, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:31:20');
INSERT INTO `user_log` VALUES (896, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:32:32');
INSERT INTO `user_log` VALUES (897, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:33:05');
INSERT INTO `user_log` VALUES (898, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:33:17');
INSERT INTO `user_log` VALUES (899, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:34:12');
INSERT INTO `user_log` VALUES (900, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:36:08');
INSERT INTO `user_log` VALUES (901, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:37:07');
INSERT INTO `user_log` VALUES (902, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:37:51');
INSERT INTO `user_log` VALUES (903, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:38:59');
INSERT INTO `user_log` VALUES (904, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:40:50');
INSERT INTO `user_log` VALUES (905, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:41:05');
INSERT INTO `user_log` VALUES (906, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:42:18');
INSERT INTO `user_log` VALUES (907, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:42:42');
INSERT INTO `user_log` VALUES (908, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:43:26');
INSERT INTO `user_log` VALUES (909, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:45:29');
INSERT INTO `user_log` VALUES (910, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:45:33');
INSERT INTO `user_log` VALUES (911, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:45:57');
INSERT INTO `user_log` VALUES (912, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:46:31');
INSERT INTO `user_log` VALUES (913, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:46:43');
INSERT INTO `user_log` VALUES (914, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:47:41');
INSERT INTO `user_log` VALUES (915, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 05:48:21');
INSERT INTO `user_log` VALUES (916, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 06:51:51');
INSERT INTO `user_log` VALUES (917, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 06:55:31');
INSERT INTO `user_log` VALUES (918, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 06:56:18');
INSERT INTO `user_log` VALUES (919, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 06:57:03');
INSERT INTO `user_log` VALUES (920, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 06:57:16');
INSERT INTO `user_log` VALUES (921, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 06:58:20');
INSERT INTO `user_log` VALUES (922, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 06:59:13');
INSERT INTO `user_log` VALUES (923, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 07:00:18');
INSERT INTO `user_log` VALUES (924, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 07:00:51');
INSERT INTO `user_log` VALUES (925, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 07:02:44');
INSERT INTO `user_log` VALUES (926, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 07:02:59');
INSERT INTO `user_log` VALUES (927, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 07:06:05');
INSERT INTO `user_log` VALUES (928, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 07:07:02');
INSERT INTO `user_log` VALUES (929, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 07:08:16');
INSERT INTO `user_log` VALUES (930, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/member/program', 'Administrator', '2018-10-11 07:08:16');
INSERT INTO `user_log` VALUES (931, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit_program/1', 'Administrator', '2018-10-11 07:08:33');
INSERT INTO `user_log` VALUES (932, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 07:09:05');
INSERT INTO `user_log` VALUES (933, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/pendaftaran/edit/1', 'Administrator', '2018-10-11 07:09:35');
INSERT INTO `user_log` VALUES (934, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-10-12 13:51:58');
INSERT INTO `user_log` VALUES (935, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-10-12 13:52:03');
INSERT INTO `user_log` VALUES (936, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-10-12 13:52:03');
INSERT INTO `user_log` VALUES (937, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 13:52:08');
INSERT INTO `user_log` VALUES (938, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 13:54:23');
INSERT INTO `user_log` VALUES (939, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 13:54:57');
INSERT INTO `user_log` VALUES (940, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/unggah', 'Administrator', '2018-10-12 13:55:32');
INSERT INTO `user_log` VALUES (941, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:01:44');
INSERT INTO `user_log` VALUES (942, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:01:56');
INSERT INTO `user_log` VALUES (943, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:03:20');
INSERT INTO `user_log` VALUES (944, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/unggah', 'Administrator', '2018-10-12 14:03:24');
INSERT INTO `user_log` VALUES (945, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:04:17');
INSERT INTO `user_log` VALUES (946, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:04:18');
INSERT INTO `user_log` VALUES (947, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/unggah', 'Administrator', '2018-10-12 14:06:15');
INSERT INTO `user_log` VALUES (948, '127.0.0.1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:07:16');
INSERT INTO `user_log` VALUES (949, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:09:26');
INSERT INTO `user_log` VALUES (950, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/unggah', 'Administrator', '2018-10-12 14:09:30');
INSERT INTO `user_log` VALUES (951, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:24:41');
INSERT INTO `user_log` VALUES (952, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:27:31');
INSERT INTO `user_log` VALUES (953, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:27:45');
INSERT INTO `user_log` VALUES (954, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:29:38');
INSERT INTO `user_log` VALUES (955, '127.0.0.1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:30:49');
INSERT INTO `user_log` VALUES (956, '127.0.0.1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:30:49');
INSERT INTO `user_log` VALUES (957, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:31:36');
INSERT INTO `user_log` VALUES (958, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:31:52');
INSERT INTO `user_log` VALUES (959, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/kelola/aceh', 'Administrator', '2018-10-12 14:32:13');
INSERT INTO `user_log` VALUES (960, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:32:15');
INSERT INTO `user_log` VALUES (961, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/kelola/aceh', 'Administrator', '2018-10-12 14:34:35');
INSERT INTO `user_log` VALUES (962, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/kelola/aceh', 'Administrator', '2018-10-12 14:35:35');
INSERT INTO `user_log` VALUES (963, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/kelola/aceh', 'Administrator', '2018-10-12 14:35:57');
INSERT INTO `user_log` VALUES (964, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/kelola/aceh', 'Administrator', '2018-10-12 14:36:10');
INSERT INTO `user_log` VALUES (965, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/kelola/aceh', 'Administrator', '2018-10-12 14:36:35');
INSERT INTO `user_log` VALUES (966, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/kelola/aceh', 'Administrator', '2018-10-12 14:37:13');
INSERT INTO `user_log` VALUES (967, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:38:38');
INSERT INTO `user_log` VALUES (968, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/kelola/jawa-barat', 'Administrator', '2018-10-12 14:38:44');
INSERT INTO `user_log` VALUES (969, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/kelola/jawa-barat', 'Administrator', '2018-10-12 14:39:32');
INSERT INTO `user_log` VALUES (970, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/kelola/jawa-barat', 'Administrator', '2018-10-12 14:39:55');
INSERT INTO `user_log` VALUES (971, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/kelola/jawa-barat', 'Administrator', '2018-10-12 14:40:26');
INSERT INTO `user_log` VALUES (972, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:43:18');
INSERT INTO `user_log` VALUES (973, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas/unggah', 'Administrator', '2018-10-12 14:43:22');
INSERT INTO `user_log` VALUES (974, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-10-12 14:50:54');
INSERT INTO `user_log` VALUES (975, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-10-16 12:57:40');
INSERT INTO `user_log` VALUES (976, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-11-05 05:35:17');
INSERT INTO `user_log` VALUES (977, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-11-05 05:35:18');
INSERT INTO `user_log` VALUES (978, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor/konfigurasi', 'Administrator', '2018-11-05 05:35:26');
INSERT INTO `user_log` VALUES (979, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor/konfigurasi', 'Administrator', '2018-11-05 05:36:11');
INSERT INTO `user_log` VALUES (980, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor/konfigurasi', 'Administrator', '2018-11-05 05:36:12');
INSERT INTO `user_log` VALUES (981, '::1', 5, NULL, '', 'http://localhost/dlp/login/logout', 'Administrator', '2018-11-05 05:36:18');
INSERT INTO `user_log` VALUES (982, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-11-05 05:36:18');
INSERT INTO `user_log` VALUES (983, '::1', 0, '-', '-', 'http://localhost/dlp/admin/dasbor/konfigurasi', '-', '2018-11-05 05:37:10');
INSERT INTO `user_log` VALUES (984, '::1', 0, '-', '-', 'http://localhost/dlp/admin/dasbor/konfigurasi', '-', '2018-11-05 05:37:11');
INSERT INTO `user_log` VALUES (985, '::1', 0, '-', '-', 'http://localhost/dlp/admin/dasbor', '-', '2018-11-05 05:37:15');
INSERT INTO `user_log` VALUES (986, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-11-06 03:26:46');
INSERT INTO `user_log` VALUES (987, '::1', 0, NULL, '', 'http://localhost/dlp/login', 'Administrator', '2018-11-06 03:26:51');
INSERT INTO `user_log` VALUES (988, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/dasbor', 'Administrator', '2018-11-06 03:26:51');
INSERT INTO `user_log` VALUES (989, '::1', 5, 'andoyo', 'Admin', 'http://localhost/dlp/admin/puskesmas', 'Administrator', '2018-11-06 03:26:57');
INSERT INTO `user_log` VALUES (990, '::1', 1, 'andoyo', 'Admin', 'http://localhost/ltkl/admin/berita', 'Administrator', '2019-02-19 06:20:00');
INSERT INTO `user_log` VALUES (991, '::1', 1, 'andoyo', '', 'http://localhost/ltkl/admin/berita', '', '2019-02-19 06:21:31');
INSERT INTO `user_log` VALUES (992, '::1', 1, 'andoyo', '', 'http://localhost/ltkl/admin/berita', '', '2019-02-19 06:22:07');
INSERT INTO `user_log` VALUES (993, '::1', 1, 'andoyo', '', 'http://localhost/ltkl/admin/berita', '', '2019-02-19 06:23:19');
INSERT INTO `user_log` VALUES (994, '::1', 1, 'andoyo', '', 'http://localhost/ltkl/admin/berita/tambah', '', '2019-02-19 06:23:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-01 10:54:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-01 10:59:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/proses', '', '2019-03-01 10:59:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/proses', '', '2019-03-01 10:59:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-01 10:59:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/download', '', '2019-03-01 10:59:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/download', '', '2019-03-01 11:01:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-01 11:01:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-01 11:01:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/proses', '', '2019-03-01 11:02:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-01 11:02:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-01 11:02:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/agenda', '', '2019-03-01 11:02:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri', '', '2019-03-01 11:02:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri', '', '2019-03-01 11:03:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/video', '', '2019-03-01 11:03:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/tambah', '', '2019-03-01 11:12:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/tambah', '', '2019-03-01 11:13:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-01 11:13:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/tambah', '', '2019-03-01 11:20:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/tambah', '', '2019-03-01 11:21:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-01 11:21:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/tambah', '', '2019-03-01 11:26:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/tambah', '', '2019-03-01 11:26:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-01 11:26:54');
INSERT INTO `user_log` VALUES (0, '::1', 0, '-', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 14:04:34');
INSERT INTO `user_log` VALUES (0, '::1', 0, '-', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 14:07:24');
INSERT INTO `user_log` VALUES (0, '::1', 0, '-', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 14:07:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 14:08:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 14:09:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/tambah', '', '2019-03-01 14:10:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 14:12:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/proses', '', '2019-03-01 14:12:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 14:12:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/proses', '', '2019-03-01 14:12:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 14:12:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/tambah', '', '2019-03-01 14:12:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/tambah', '', '2019-03-01 14:13:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/tambah', '', '2019-03-01 14:13:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/tambah', '', '2019-03-01 14:14:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/tambah', '', '2019-03-01 14:14:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/tambah', '', '2019-03-01 14:15:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/tambah', '', '2019-03-01 14:15:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/tambah', '', '2019-03-01 14:15:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/tambah', '', '2019-03-01 14:15:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-01 14:15:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 14:16:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 14:16:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/proses', '', '2019-03-01 14:16:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 14:17:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/tambah', '', '2019-03-01 14:17:24');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/tambah', '', '2019-03-01 14:17:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/tambah', '', '2019-03-01 14:18:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/tambah', '', '2019-03-01 14:18:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/tambah', '', '2019-03-01 14:18:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/tambah', '', '2019-03-01 14:19:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 14:19:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 14:19:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/edit/13', '', '2019-03-01 14:20:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/edit/13', '', '2019-03-01 14:20:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 14:20:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/edit/13', '', '2019-03-01 14:20:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi/edit/13', '', '2019-03-01 14:20:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 14:21:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/aplikasi', '', '2019-03-01 15:42:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-02 12:06:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori', '', '2019-03-02 12:06:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori/edit/5', '', '2019-03-02 12:06:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori/edit/5', '', '2019-03-02 12:06:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori', '', '2019-03-02 12:06:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu', '', '2019-03-02 12:23:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu', '', '2019-03-02 12:25:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu', '', '2019-03-02 12:27:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu', '', '2019-03-02 12:27:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu', '', '2019-03-02 12:28:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu/detail/2', '', '2019-03-02 12:28:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu', '', '2019-03-02 12:28:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu', '', '2019-03-02 12:31:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu', '', '2019-03-02 12:31:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu', '', '2019-03-02 12:31:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu/detail/1', '', '2019-03-02 12:31:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu/detail/1', '', '2019-03-02 12:32:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu/detail/1', '', '2019-03-02 12:32:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu/detail/1', '', '2019-03-02 12:32:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu/detail/1', '', '2019-03-02 12:32:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu/detail/1', '', '2019-03-02 12:32:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu/detail/1', '', '2019-03-02 12:32:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu/detail/1', '', '2019-03-02 12:32:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu', '', '2019-03-02 12:32:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu', '', '2019-03-02 12:32:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu', '', '2019-03-02 12:33:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/menu', '', '2019-03-02 12:35:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 12:35:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 12:36:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:02:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:06:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:06:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:08:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:09:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:15:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:15:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:16:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:16:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:16:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:16:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:18:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:19:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:19:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:20:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:20:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:22:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:22:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:22:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:24:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:24:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:24:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:24:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:26:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:26:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-02 13:26:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/tambah', '', '2019-03-02 14:04:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 05:54:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 05:54:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/2', '', '2019-03-04 05:54:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/2', '', '2019-03-04 05:57:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/2', '', '2019-03-04 05:58:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/2', '', '2019-03-04 05:58:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 05:58:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/1', '', '2019-03-04 05:58:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/1', '', '2019-03-04 05:58:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 05:58:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/1', '', '2019-03-04 05:58:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/1', '', '2019-03-04 05:58:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/1', '', '2019-03-04 05:59:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/1', '', '2019-03-04 05:59:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 05:59:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/1', '', '2019-03-04 05:59:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 05:59:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 05:59:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 05:59:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:00:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:01:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:02:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:02:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:02:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:06:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:06:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:07:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:08:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:10:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:11:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:11:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:11:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:11:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:14:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:14:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:14:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/delete_sub_tema/2/2', '', '2019-03-04 06:14:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/delete_sub_tema/2/2', '', '2019-03-04 06:14:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:14:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:14:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:17:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit_sub_tema/1', '', '2019-03-04 06:17:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit_sub_tema/1', '', '2019-03-04 06:17:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 06:17:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:18:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:18:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:18:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:18:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:19:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:20:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:20:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/1', '', '2019-03-04 06:20:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/1', '', '2019-03-04 06:20:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/1', '', '2019-03-04 06:20:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:20:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:21:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:21:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:24:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:25:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:26:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:56:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:56:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 06:57:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/tema/11', '', '2019-03-04 06:58:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/tema/11', '', '2019-03-04 06:59:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/tema/11', '', '2019-03-04 07:00:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/tema/11', '', '2019-03-04 07:00:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/tema/11', '', '2019-03-04 07:00:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/tema/11', '', '2019-03-04 07:01:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/tema/11', '', '2019-03-04 07:01:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/tema/11', '', '2019-03-04 07:02:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/tema/11', '', '2019-03-04 07:02:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/tema/11', '', '2019-03-04 07:02:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/tema/11', '', '2019-03-04 07:03:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 07:03:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/tema/12', '', '2019-03-04 07:03:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 07:03:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-04 08:23:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/edit/1', '', '2019-03-04 08:23:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/edit/1', '', '2019-03-04 08:23:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-04 08:23:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/edit/1', '', '2019-03-04 08:24:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/edit/1', '', '2019-03-04 08:24:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-04 08:24:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/edit/2', '', '2019-03-04 08:24:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/edit/2', '', '2019-03-04 08:24:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-04 08:24:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/tambah', '', '2019-03-04 08:27:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/tambah', '', '2019-03-04 08:28:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-04 08:28:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/tambah', '', '2019-03-04 08:29:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/tambah', '', '2019-03-04 08:29:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-04 08:29:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-04 08:30:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori', '', '2019-03-04 08:30:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori/edit/5', '', '2019-03-04 08:31:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori/edit/5', '', '2019-03-04 08:31:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori', '', '2019-03-04 08:31:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori/delete/1', '', '2019-03-04 08:31:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori/delete/1', '', '2019-03-04 08:31:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori', '', '2019-03-04 08:31:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori/edit/4', '', '2019-03-04 08:31:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori/edit/4', '', '2019-03-04 08:31:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori', '', '2019-03-04 08:31:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori/delete/3', '', '2019-03-04 08:31:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori/delete/3', '', '2019-03-04 08:31:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori', '', '2019-03-04 08:31:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori/delete/2', '', '2019-03-04 08:31:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori/delete/2', '', '2019-03-04 08:31:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori', '', '2019-03-04 08:31:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri', '', '2019-03-04 08:32:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri/edit/5', '', '2019-03-04 08:32:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri/edit/5', '', '2019-03-04 08:33:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri', '', '2019-03-04 08:33:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri/edit/4', '', '2019-03-04 08:33:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri/edit/4', '', '2019-03-04 08:33:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri', '', '2019-03-04 08:33:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri/delete/3', '', '2019-03-04 08:33:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri/delete/3', '', '2019-03-04 08:33:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri', '', '2019-03-04 08:33:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri/delete/2', '', '2019-03-04 08:33:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri/delete/2', '', '2019-03-04 08:33:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri', '', '2019-03-04 08:33:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri/delete/1', '', '2019-03-04 08:33:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri/delete/1', '', '2019-03-04 08:33:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_galeri', '', '2019-03-04 08:33:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori_download', '', '2019-03-04 08:33:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-04 08:35:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/edit/11', '', '2019-03-04 08:35:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/edit/11', '', '2019-03-04 08:35:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-04 08:35:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 09:07:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/3', '', '2019-03-04 09:11:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/3', '', '2019-03-04 09:11:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/3', '', '2019-03-04 09:11:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 09:11:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-04 11:17:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-04 11:18:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-04 11:18:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/video', '', '2019-03-04 11:18:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/video', '', '2019-03-04 11:19:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 12:26:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 12:26:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-04 14:32:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/edit/13', '', '2019-03-04 14:32:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 14:41:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/2', '', '2019-03-04 14:41:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 14:41:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/2', '', '2019-03-04 14:41:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/2', '', '2019-03-04 14:42:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 14:42:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/3', '', '2019-03-04 14:42:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit/3', '', '2019-03-04 14:42:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 14:42:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 15:03:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/tema/11', '', '2019-03-04 15:04:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/delete_sub_tema/3/1', '', '2019-03-04 15:04:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/delete_sub_tema/3/1', '', '2019-03-04 15:04:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/1', '', '2019-03-04 15:04:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 15:04:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/delete/1', '', '2019-03-04 15:04:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/delete/1', '', '2019-03-04 15:04:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 15:04:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit_sub_tema/1', '', '2019-03-04 15:04:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit_sub_tema/1', '', '2019-03-04 15:04:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 15:04:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 15:05:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 15:05:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit_sub_tema/1', '', '2019-03-04 15:05:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit_sub_tema/1', '', '2019-03-04 15:05:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit_sub_tema/1', '', '2019-03-04 15:05:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 15:05:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 15:06:24');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 15:06:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 15:06:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 15:07:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 15:07:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 15:07:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 15:07:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 15:08:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/delete_sub_tema/4/3', '', '2019-03-04 15:08:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/delete_sub_tema/4/3', '', '2019-03-04 15:08:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/3', '', '2019-03-04 15:08:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 15:08:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/delete/3', '', '2019-03-04 15:09:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/delete/3', '', '2019-03-04 15:09:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 15:09:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-04 15:35:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/video', '', '2019-03-04 15:35:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema', '', '2019-03-04 15:36:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit_sub_tema/8', '', '2019-03-04 15:39:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/edit_sub_tema/8', '', '2019-03-04 15:39:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/tema/detail/2', '', '2019-03-04 15:39:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/download', '', '2019-03-04 16:24:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/download/tambah', '', '2019-03-04 16:24:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/download/tambah', '', '2019-03-04 16:26:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 09:46:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 09:47:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 09:47:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 09:48:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 09:49:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 09:49:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 09:53:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 10:21:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 10:30:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 10:31:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 10:32:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 10:32:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 10:32:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 10:32:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 10:32:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 10:33:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 10:33:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/edit/1', '', '2019-03-07 10:33:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/edit/1', '', '2019-03-07 10:33:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/edit/1', '', '2019-03-07 10:33:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 10:33:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/edit/2', '', '2019-03-07 10:33:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/edit/2', '', '2019-03-07 10:34:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 10:34:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/edit/3', '', '2019-03-07 10:34:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/edit/3', '', '2019-03-07 10:34:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 10:34:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 10:34:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 10:34:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 10:35:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 10:35:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 10:56:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 10:57:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 10:58:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 10:59:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 10:59:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 10:59:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:00:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:03:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:03:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:03:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:04:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:45:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:46:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:46:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:50:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/proses', '', '2019-03-07 11:50:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-07 11:50:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:51:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:51:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:52:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:52:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:54:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:55:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:55:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:57:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:58:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:58:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:58:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:58:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:59:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:59:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:59:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 11:59:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 12:00:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 12:00:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 12:01:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/1', '', '2019-03-07 12:01:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 12:02:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 12:04:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 12:05:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/3', '', '2019-03-07 12:05:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/3', '', '2019-03-07 12:06:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/3', '', '2019-03-07 12:06:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 12:06:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 12:06:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/2', '', '2019-03-07 12:22:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 12:22:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/2', '', '2019-03-07 12:22:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-07 21:07:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/kategori', '', '2019-03-10 10:32:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 10:34:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 10:35:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 10:36:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 10:37:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 10:39:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 10:39:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 10:39:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 10:41:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 10:41:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 10:41:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 10:41:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 10:42:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 10:42:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 11:02:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 11:04:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 11:04:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 11:06:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit/1', '', '2019-03-10 11:06:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit/1', '', '2019-03-10 11:08:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit/1', '', '2019-03-10 11:09:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 11:11:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 11:49:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 11:50:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 11:50:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 11:50:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 11:58:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 11:58:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 11:58:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 11:59:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:13:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:14:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:15:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:17:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:18:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:21:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:22:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:23:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:24:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:25:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:27:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:29:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:29:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:29:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:30:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:31:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter', '', '2019-03-10 12:31:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 12:31:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:31:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:31:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter', '', '2019-03-10 12:31:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:31:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:32:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:32:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:33:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:33:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:35:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:35:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:36:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:36:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:37:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:37:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:37:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:38:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit_parameter/1', '', '2019-03-10 12:41:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit_parameter/1', '', '2019-03-10 12:42:24');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit_parameter/1', '', '2019-03-10 12:43:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit_parameter/1', '', '2019-03-10 12:44:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:44:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit_parameter/2', '', '2019-03-10 12:44:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit_parameter/2', '', '2019-03-10 12:44:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:44:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit_parameter/3', '', '2019-03-10 12:44:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit_parameter/3', '', '2019-03-10 12:45:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:45:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit_parameter/4', '', '2019-03-10 12:46:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit_parameter/4', '', '2019-03-10 12:48:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:48:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit_parameter/4', '', '2019-03-10 12:48:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit_parameter/4', '', '2019-03-10 12:49:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:49:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:49:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/edit_parameter/5', '', '2019-03-10 12:49:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 12:49:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:49:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:51:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:51:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/delete_parameter/7/1', '', '2019-03-10 12:51:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/delete_parameter/7/1', '', '2019-03-10 12:51:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 12:51:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 12:53:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 13:09:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 13:10:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 13:10:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 13:14:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 13:15:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 13:15:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 13:15:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 13:15:57');
INSERT INTO `user_log` VALUES (0, '::1', 0, '-', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 21:53:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 21:53:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-10 21:53:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 21:53:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 21:58:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 21:58:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:00:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:00:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:01:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:01:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:02:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:02:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:04:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:06:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:06:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:07:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:08:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:08:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:09:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:09:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:09:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:13:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:13:24');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:14:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:14:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:14:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:15:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:20:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:20:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:20:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:20:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 22:20:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:20:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:25:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 22:25:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 22:25:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 22:26:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:28:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:28:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 22:28:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:28:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-10 22:28:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-10 22:28:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/agenda', '', '2019-03-18 15:47:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-18 16:10:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon/detail/2', '', '2019-03-18 16:11:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-18 16:11:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-18 16:11:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-18 16:11:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-18 16:12:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/rayon', '', '2019-03-18 16:13:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-18 16:40:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/rayon/1', '', '2019-03-18 16:40:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar', '', '2019-03-18 16:40:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/standar/parameter/1', '', '2019-03-18 16:40:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-25 11:16:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/edit/11', '', '2019-03-25 11:16:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/edit/11', '', '2019-03-25 11:16:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-25 11:16:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/tambah', '', '2019-03-25 11:16:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita/tambah', '', '2019-03-25 11:17:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-25 11:17:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-25 15:10:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/edit/2', '', '2019-03-25 15:14:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/edit/2', '', '2019-03-25 15:14:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-25 15:14:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/delete/1', '', '2019-03-25 15:14:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/delete/1', '', '2019-03-25 15:14:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-25 15:14:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/edit/2', '', '2019-03-25 15:15:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/edit/2', '', '2019-03-25 15:15:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-25 15:15:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/edit/2', '', '2019-03-25 15:17:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri/edit/2', '', '2019-03-25 15:17:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/galeri', '', '2019-03-25 15:17:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/bkkbn/admin/berita', '', '2019-03-25 15:18:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-04-13 20:16:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-04-13 20:16:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-04-13 20:17:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/proses', '', '2019-04-13 20:17:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-04-13 20:17:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/kategori_galeri', '', '2019-04-13 20:18:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/kategori_galeri', '', '2019-04-13 20:25:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-04-13 20:25:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-04-13 20:26:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/download', '', '2019-04-13 20:26:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/download/tambah', '', '2019-04-13 20:26:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/download/tambah', '', '2019-04-13 20:28:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/download/tambah', '', '2019-04-13 20:29:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/kategori_galeri', '', '2019-04-14 07:53:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-05-13 15:17:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-05-13 15:17:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/video', '', '2019-05-13 15:17:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/download', '', '2019-05-13 15:17:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-05-13 15:18:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-05-13 15:22:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/agenda', '', '2019-05-13 15:23:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/agenda/tambah', '', '2019-05-13 15:23:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/agenda/tambah', '', '2019-05-13 15:24:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/agenda/tambah', '', '2019-05-13 15:24:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-05-13 15:48:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/edit/2', '', '2019-05-13 15:48:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/edit/2', '', '2019-05-13 15:49:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-05-13 15:49:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/tambah', '', '2019-05-13 15:49:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/tambah', '', '2019-05-13 15:50:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-05-13 15:50:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/edit/2', '', '2019-05-13 15:50:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/edit/2', '', '2019-05-13 15:50:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-05-13 15:50:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-05-13 15:51:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-05-13 15:51:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-05-13 15:51:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-05-13 16:07:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/agenda', '', '2019-05-17 04:03:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/download', '', '2019-05-17 04:03:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/download', '', '2019-05-17 04:04:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-05-17 04:04:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-05-17 04:04:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-05-17 04:05:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-05-17 04:06:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-05-17 04:15:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-05-17 04:15:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/2', '', '2019-05-17 04:15:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/2', '', '2019-05-17 04:15:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-05-17 04:15:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-05-17 04:23:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-05-17 04:28:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-05-17 04:29:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-05-17 04:30:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/2', '', '2019-05-17 04:30:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/2', '', '2019-05-17 04:31:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-05-17 04:31:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/2', '', '2019-05-17 04:31:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/2', '', '2019-05-17 04:32:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-05-17 04:32:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/2', '', '2019-05-17 04:33:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-05-17 04:34:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/2', '', '2019-05-17 04:34:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/2', '', '2019-05-17 04:34:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-05-17 04:34:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-05-17 04:36:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-05-17 04:37:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-05-17 04:37:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/agenda', '', '2019-07-15 13:22:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-07-26 09:30:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/tambah', '', '2019-07-26 09:30:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/tambah', '', '2019-07-26 09:31:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-07-26 09:31:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/delete/2', '', '2019-07-26 09:38:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-07-26 09:38:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/delete/3', '', '2019-07-26 09:38:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-07-26 09:38:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/tambah', '', '2019-07-26 09:39:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/tambah', '', '2019-07-26 09:40:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-07-26 09:40:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-07-26 10:20:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/edit/4', '', '2019-07-26 10:20:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/edit/4', '', '2019-07-26 10:20:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-07-26 10:21:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/edit/5', '', '2019-07-26 10:21:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/edit/5', '', '2019-07-26 10:21:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-07-26 10:21:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/edit/4', '', '2019-07-26 10:28:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/edit/4', '', '2019-07-26 10:28:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-07-26 10:28:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/edit/5', '', '2019-07-26 10:28:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri/edit/5', '', '2019-07-26 10:29:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/galeri', '', '2019-07-26 10:29:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-07-26 10:36:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-07-26 10:38:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-07-26 10:38:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/4', '', '2019-07-26 10:38:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/4', '', '2019-07-26 10:38:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-07-26 10:38:34');
INSERT INTO `user_log` VALUES (0, '::1', 0, '-', '', 'http://localhost/sigit/admin/berita', '', '2019-07-26 10:41:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-07-26 10:41:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-07-26 10:41:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-07-26 10:41:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:41:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-07-26 10:46:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Profil', '', '2019-07-26 10:46:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:47:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:48:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:49:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:50:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:50:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:50:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:51:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:51:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Profil', '', '2019-07-26 10:51:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/3', '', '2019-07-26 10:52:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/3', '', '2019-07-26 10:53:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:53:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/2', '', '2019-07-26 10:53:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/2', '', '2019-07-26 10:53:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:53:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-07-26 10:53:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/tambah', '', '2019-07-26 10:54:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:54:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/5', '', '2019-07-26 10:54:24');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/5', '', '2019-07-26 10:54:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:54:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/5', '', '2019-07-26 10:56:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita', '', '2019-07-26 10:56:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:56:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/3', '', '2019-07-26 10:56:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/3', '', '2019-07-26 10:56:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:56:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/2', '', '2019-07-26 10:56:24');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/2', '', '2019-07-26 10:56:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:56:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/3', '', '2019-07-26 10:56:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/3', '', '2019-07-26 10:56:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:56:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/3', '', '2019-07-26 10:57:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/3', '', '2019-07-26 10:57:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:57:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/2', '', '2019-07-26 10:57:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/edit/2', '', '2019-07-26 10:57:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/sigit/admin/berita/jenis_berita/Layanan', '', '2019-07-26 10:57:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/berita', '', '2019-10-11 19:41:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/download', '', '2019-10-11 19:43:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/kategori_galeri', '', '2019-10-11 19:45:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/kategori', '', '2019-10-11 19:45:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/berita', '', '2019-10-11 19:50:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/agenda', '', '2019-10-11 19:50:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/agenda/tambah', '', '2019-10-11 19:50:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/download', '', '2019-10-11 19:52:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/download/delete/1', '', '2019-10-11 19:52:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/download', '', '2019-10-11 19:52:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/berita', '', '2019-10-11 19:52:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/berita/delete/5', '', '2019-10-11 19:52:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/berita', '', '2019-10-11 19:52:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/berita', '', '2019-10-11 19:53:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/download', '', '2019-10-11 19:54:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/download/tambah', '', '2019-10-11 19:54:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/download/tambah', '', '2019-10-11 19:54:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/download/tambah', '', '2019-10-11 19:54:24');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/download', '', '2019-10-11 19:54:24');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/download/delete/2', '', '2019-10-11 19:54:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/download', '', '2019-10-11 19:54:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/download/tambah', '', '2019-10-11 19:54:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/download/tambah', '', '2019-10-11 19:55:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/download', '', '2019-10-11 19:55:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/download', '', '2019-10-11 19:55:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/galeri', '', '2019-10-11 19:55:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/video', '', '2019-10-11 19:55:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/video', '', '2019-10-11 19:56:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/akun', '', '2019-10-11 19:57:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/akun', '', '2019-10-11 19:57:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/akun', '', '2019-10-11 19:57:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/akun', '', '2019-10-11 19:58:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/akun', '', '2019-10-11 19:58:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/agenda', '', '2019-10-11 19:58:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/agenda', '', '2019-10-11 19:58:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/akun', '', '2019-10-11 20:45:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/akun', '', '2019-10-11 20:45:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'andoyo', '', 'http://localhost/compro/admin/akun', '', '2019-10-11 20:45:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2019-10-12 08:45:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/tambah', '', '2019-10-12 08:45:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/tambah', '', '2019-10-12 08:45:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2019-10-12 08:45:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/6', '', '2019-10-12 08:45:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/6', '', '2019-10-12 08:46:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2019-10-12 08:46:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita', '', '2019-10-12 08:46:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/tambah', '', '2019-10-12 08:46:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2019-10-12 11:56:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita', '', '2019-10-12 15:53:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/kategori', '', '2019-10-12 15:53:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/tambah', '', '2019-10-12 15:53:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/akun', '', '2019-10-12 15:55:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita', '', '2019-10-12 15:55:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/tambah', '', '2019-10-12 15:55:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita', '', '2019-10-12 15:55:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/video', '', '2019-10-12 15:55:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/video/tambah', '', '2019-10-12 15:57:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/agenda', '', '2019-10-12 15:57:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita', '', '2019-10-13 10:38:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita', '', '2019-10-13 14:10:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2019-10-15 17:58:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/5', '', '2019-10-15 17:58:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/5', '', '2019-10-15 17:58:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2019-10-15 17:58:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/4', '', '2019-10-15 17:58:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/4', '', '2019-10-15 17:58:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2019-10-15 17:58:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita', '', '2019-10-15 17:58:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/tambah', '', '2019-10-15 17:59:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita', '', '2019-10-15 18:01:51');
INSERT INTO `user_log` VALUES (0, '::1', 4, NULL, '', 'http://localhost/compro/admin/berita', '', '2019-10-15 18:39:04');
INSERT INTO `user_log` VALUES (0, '::1', 4, NULL, '', 'http://localhost/compro/admin/berita', '', '2019-10-15 18:39:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita', '', '2020-01-04 14:52:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita', '', '2020-01-04 15:13:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2020-01-04 15:13:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/4', '', '2020-01-04 15:13:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/4', '', '2020-01-04 15:14:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2020-01-04 15:14:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita', '', '2020-01-14 10:40:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/1', '', '2020-01-14 10:41:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/1', '', '2020-01-14 10:41:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/jenis_berita/Berita', '', '2020-01-14 10:41:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/akun', '', '2020-02-13 07:29:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2020-02-13 07:32:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/4', '', '2020-02-13 07:32:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/4', '', '2020-02-13 07:33:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2020-02-13 07:33:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/4', '', '2020-02-13 07:33:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/4', '', '2020-02-13 07:33:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2020-02-13 07:33:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/5', '', '2020-02-13 07:33:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/5', '', '2020-02-13 07:34:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2020-02-13 07:34:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/6', '', '2020-02-13 07:34:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/edit/6', '', '2020-02-13 07:34:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2020-02-13 07:34:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita', '', '2020-02-13 07:35:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/4', '', '2020-02-13 07:35:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/4', '', '2020-02-13 07:36:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/jenis_berita/Profil', '', '2020-02-13 07:36:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/4', '', '2020-02-13 07:37:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/4', '', '2020-02-13 07:38:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/jenis_berita/Profil', '', '2020-02-13 07:38:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/4', '', '2020-02-13 07:38:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita', '', '2020-02-13 07:38:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/4', '', '2020-02-13 07:38:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/4', '', '2020-02-13 07:38:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/jenis_berita/Profil', '', '2020-02-13 07:38:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita', '', '2020-02-13 07:38:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/3', '', '2020-02-13 07:39:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/3', '', '2020-02-13 07:39:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/jenis_berita/Layanan', '', '2020-02-13 07:40:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/3', '', '2020-02-13 07:40:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/3', '', '2020-02-13 07:40:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/jenis_berita/Layanan', '', '2020-02-13 07:40:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/2', '', '2020-02-13 07:41:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/2', '', '2020-02-13 07:41:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/jenis_berita/Layanan', '', '2020-02-13 07:41:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/tambah', '', '2020-02-13 07:41:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/tambah', '', '2020-02-13 07:42:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/jenis_berita/Layanan', '', '2020-02-13 07:42:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/6', '', '2020-02-13 07:43:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/jenis_berita/Layanan', '', '2020-02-13 07:43:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/3', '', '2020-02-13 07:43:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/jenis_berita/Layanan', '', '2020-02-13 07:43:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/2', '', '2020-02-13 07:43:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/2', '', '2020-02-13 07:43:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/jenis_berita/Layanan', '', '2020-02-13 07:43:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita', '', '2020-02-13 07:43:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/1', '', '2020-02-13 07:43:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/edit/1', '', '2020-02-13 07:44:24');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/jenis_berita/Berita', '', '2020-02-13 07:44:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/tambah', '', '2020-02-13 07:44:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/tambah', '', '2020-02-13 07:45:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/berita/jenis_berita/Berita', '', '2020-02-13 07:45:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/video', '', '2020-02-13 07:47:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/video/edit/4', '', '2020-02-13 07:47:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/video/edit/4', '', '2020-02-13 07:48:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/video', '', '2020-02-13 07:48:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/video/edit/5', '', '2020-02-13 07:48:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/video/edit/5', '', '2020-02-13 07:48:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/video', '', '2020-02-13 07:48:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/download', '', '2020-02-13 07:48:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/download/edit/3', '', '2020-02-13 07:49:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/download/edit/3', '', '2020-02-13 07:49:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/download', '', '2020-02-13 07:49:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/download/tambah', '', '2020-02-13 07:49:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/download/tambah', '', '2020-02-13 07:50:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/download', '', '2020-02-13 07:50:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/download/edit/3', '', '2020-02-13 07:50:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/download/edit/3', '', '2020-02-13 07:50:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/download', '', '2020-02-13 07:50:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/download/tambah', '', '2020-02-13 07:50:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/download/tambah', '', '2020-02-13 07:50:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/download', '', '2020-02-13 07:50:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/kategori_download', '', '2020-02-13 07:50:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/kategori_download/edit/2', '', '2020-02-13 07:50:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/kategori_download/edit/2', '', '2020-02-13 07:51:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/kategori_download', '', '2020-02-13 07:51:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2020-02-13 07:51:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/tambah', '', '2020-02-13 07:51:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/tambah', '', '2020-02-13 07:52:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2020-02-13 07:52:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/tambah', '', '2020-02-13 07:52:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/tambah', '', '2020-02-13 07:52:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2020-02-13 07:52:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/tambah', '', '2020-02-13 07:53:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/tambah', '', '2020-02-13 07:53:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2020-02-13 07:53:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/tambah', '', '2020-02-13 07:54:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri/tambah', '', '2020-02-13 07:54:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/galeri', '', '2020-02-13 07:54:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/akun', '', '2020-02-13 07:58:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/akun/password', '', '2020-02-13 07:58:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro/admin/akun', '', '2020-02-13 07:58:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/agenda/tambah', '', '2020-03-09 20:02:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 20:24:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/agenda', '', '2020-03-09 20:28:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 21:44:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/delete/4', '', '2020-03-09 21:44:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 21:44:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-09 21:44:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 21:51:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 21:53:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 21:53:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 21:54:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 21:54:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 21:54:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 21:55:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 21:59:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 21:59:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 22:00:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 22:00:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-09 22:01:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 22:01:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 22:01:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 22:01:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 22:02:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-09 22:02:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-09 22:03:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/jenis_berita/Berita', '', '2020-03-09 22:03:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/8', '', '2020-03-09 22:05:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/8', '', '2020-03-09 22:05:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/jenis_berita/Berita', '', '2020-03-09 22:05:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-09 22:05:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 22:06:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/8', '', '2020-03-09 22:06:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/8', '', '2020-03-09 22:06:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/jenis_berita/Profil', '', '2020-03-09 22:06:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-09 22:07:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-09 22:07:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/jenis_berita/Profil', '', '2020-03-09 22:07:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/9', '', '2020-03-09 22:07:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/9', '', '2020-03-09 22:07:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/jenis_berita/Profil', '', '2020-03-09 22:07:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/8', '', '2020-03-09 22:12:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/jenis_berita/Profil', '', '2020-03-09 22:12:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/9', '', '2020-03-09 22:12:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/9', '', '2020-03-09 22:12:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/jenis_berita/Profil', '', '2020-03-09 22:12:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 22:14:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 22:27:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/proses', '', '2020-03-09 22:27:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 22:27:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/galeri', '', '2020-03-09 22:28:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/galeri/edit/4', '', '2020-03-09 22:28:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/galeri/edit/4', '', '2020-03-09 22:29:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/galeri', '', '2020-03-09 22:29:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/galeri/proses', '', '2020-03-09 22:29:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/galeri', '', '2020-03-09 22:29:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 22:29:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-09 22:29:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-09 22:37:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-09 22:38:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-09 22:40:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/jenis_berita/Profil', '', '2020-03-09 22:40:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/8', '', '2020-03-09 22:40:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/8', '', '2020-03-09 22:43:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 22:44:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 22:45:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 22:45:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-09 22:45:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-09 22:46:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-09 22:53:24');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 22:53:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 22:54:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori/delete/5', '', '2020-03-09 22:54:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 22:54:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori/delete/4', '', '2020-03-09 22:54:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 22:54:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 22:54:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 22:54:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/kategori', '', '2020-03-09 22:55:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-09 22:55:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-10 16:07:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/galeri', '', '2020-03-10 16:07:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-10 16:07:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-10 16:22:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-10 16:23:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-10 16:23:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/jenis_berita/Berita', '', '2020-03-10 16:23:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/11', '', '2020-03-10 16:24:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-10 16:24:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/11', '', '2020-03-10 16:24:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-10 16:24:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/delete/11', '', '2020-03-10 16:24:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-10 16:24:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-10 16:24:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-10 16:25:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/jenis_berita/Layanan', '', '2020-03-10 16:25:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/12', '', '2020-03-10 16:25:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/12', '', '2020-03-10 16:26:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/edit/12', '', '2020-03-10 16:27:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/jenis_berita/Layanan', '', '2020-03-10 16:27:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-10 16:27:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/tambah', '', '2020-03-10 16:28:24');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/jenis_berita/Berita', '', '2020-03-10 16:28:24');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita/jenis_berita/Berita', '', '2020-03-10 16:47:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/video', '', '2020-03-10 16:48:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/berita', '', '2020-03-10 16:48:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/galeri', '', '2020-03-11 14:35:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/galeri/tambah', '', '2020-03-11 14:35:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/galeri/tambah', '', '2020-03-11 14:36:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost/compro-master/admin/galeri', '', '2020-03-11 14:36:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita', '', '2020-03-13 23:51:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/tambah', '', '2020-03-13 23:51:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/agenda', '', '2020-03-13 23:51:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/agenda/tambah', '', '2020-03-13 23:52:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/agenda/tambah', '', '2020-03-13 23:52:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/download', '', '2020-03-13 23:52:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/galeri', '', '2020-03-14 00:03:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/galeri/tambah', '', '2020-03-14 00:03:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/galeri/tambah', '', '2020-03-14 00:03:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/galeri', '', '2020-03-14 00:03:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/galeri', '', '2020-03-14 00:04:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/video', '', '2020-03-14 00:04:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/video/edit/4', '', '2020-03-14 00:04:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/video', '', '2020-03-14 00:04:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita', '', '2020-03-15 15:17:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/edit/10', '', '2020-03-15 15:17:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/edit/10', '', '2020-03-15 15:21:24');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/jenis_berita/Profil', '', '2020-03-15 15:21:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita', '', '2020-03-15 15:22:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/edit/10', '', '2020-03-15 15:22:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita', '', '2020-03-15 15:45:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/edit/10', '', '2020-03-15 17:28:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/edit/10', '', '2020-03-15 17:29:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/jenis_berita/Profil', '', '2020-03-15 17:29:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/edit/10', '', '2020-03-15 17:30:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/edit/10', '', '2020-03-15 19:43:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita', '', '2020-03-15 20:31:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/tambah', '', '2020-03-15 20:31:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita', '', '2020-03-15 20:34:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/tambah', '', '2020-03-15 20:34:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/galeri', '', '2020-03-15 20:34:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/galeri/tambah', '', '2020-03-15 20:34:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/galeri', '', '2020-03-15 20:34:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/galeri', '', '2020-03-15 21:08:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 21:09:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 21:09:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 21:09:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/akun', '', '2020-03-15 21:12:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 21:13:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 21:48:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 21:48:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 21:56:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 21:56:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:04:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:07:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:07:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:07:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:08:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:08:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:08:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:08:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:09:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:09:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:09:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:09:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:09:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:10:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:10:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:10:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:10:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/tambah', '', '2020-03-15 22:11:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:11:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:11:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita', '', '2020-03-15 22:11:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/edit/12', '', '2020-03-15 22:12:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita', '', '2020-03-15 22:12:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:12:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:12:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:12:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:12:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:12:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:13:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:13:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:13:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:13:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:13:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:13:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:13:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:13:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:13:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:16:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/delete/5', '', '2020-03-15 22:16:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/delete/5', '', '2020-03-15 22:17:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/delete/5', '', '2020-03-15 22:17:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/delete/5', '', '2020-03-15 22:18:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:18:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:18:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/delete/5', '', '2020-03-15 22:18:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:18:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:18:24');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:18:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:18:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:18:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-15 22:18:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:18:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:19:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:19:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:21:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/proses', '', '2020-03-15 22:21:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita', '', '2020-03-15 22:21:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:21:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:21:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:21:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:21:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/proses', '', '2020-03-15 22:21:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:21:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:29:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/proses', '', '2020-03-15 22:29:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:29:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:29:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/proses', '', '2020-03-15 22:29:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:30:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/proses', '', '2020-03-15 22:30:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:30:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:30:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/proses', '', '2020-03-15 22:30:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 22:30:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 23:13:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/edit/1', '', '2020-03-15 23:26:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/edit/1', '', '2020-03-15 23:27:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/edit/1', '', '2020-03-15 23:27:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/edit/1', '', '2020-03-15 23:27:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/edit/1', '', '2020-03-15 23:28:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 23:29:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/edit/3', '', '2020-03-15 23:29:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/edit/3', '', '2020-03-15 23:29:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/edit/3', '', '2020-03-15 23:32:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 23:32:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita', '', '2020-03-15 23:32:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 23:32:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 23:33:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/edit/1', '', '2020-03-15 23:34:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-15 23:34:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-15 23:56:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-15 23:56:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-15 23:58:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/delete/3', '', '2020-03-15 23:58:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-15 23:58:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/tambah', '', '2020-03-16 00:03:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 00:03:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/tambah', '', '2020-03-16 00:03:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/berita/tambah', '', '2020-03-16 00:06:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 00:06:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 00:07:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 00:07:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 00:07:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan/tambah', '', '2020-03-16 00:14:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 00:14:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 00:14:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 00:14:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 00:14:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 00:15:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 00:16:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 00:17:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 00:17:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 00:17:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 00:17:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 00:17:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/delete/4', '', '2020-03-16 00:17:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 00:17:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:18:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:19:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:21:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:21:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:21:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:22:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:22:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:22:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:23:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:23:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:24:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:24:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:24:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:25:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:25:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:25:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:25:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:26:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:26:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 00:27:18');
INSERT INTO `user_log` VALUES (0, '::1', 0, '-', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 06:59:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 06:59:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 06:59:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 07:00:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 07:01:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 07:01:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 07:01:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 07:01:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/2', '', '2020-03-16 07:01:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 07:01:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:01:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:02:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:02:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 07:02:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/2', '', '2020-03-16 07:02:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 07:02:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:03:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:03:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:04:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:04:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:05:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:05:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 07:05:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:05:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 07:05:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:05:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 07:05:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/2', '', '2020-03-16 07:06:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/2', '', '2020-03-16 07:08:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 07:08:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/2', '', '2020-03-16 07:08:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 07:08:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:08:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:08:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 07:08:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 07:09:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 07:09:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 07:09:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 07:09:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/tambah', '', '2020-03-16 07:09:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 07:09:53');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:09:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:09:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi', '', '2020-03-16 07:09:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/asosiasi/edit/1', '', '2020-03-16 07:10:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:17:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:21:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:21:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:21:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:22:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:22:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:22:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:22:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:23:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:23:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:23:46');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:23:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:24:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:24:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:24:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:25:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:25:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:25:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:25:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:25:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:26:24');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:27:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:27:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:27:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:29:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:30:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:30:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:30:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:30:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:30:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:30:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:30:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:31:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:31:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:31:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:31:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:31:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:31:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:32:08');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:32:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:32:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:32:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:33:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:33:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:34:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:34:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:35:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:35:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:35:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:36:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:36:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:36:52');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:37:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:37:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:37:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:37:39');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:37:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:37:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:38:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:38:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:38:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:38:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:38:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:38:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:38:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:39:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:39:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:39:27');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:39:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:39:58');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:40:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:40:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:40:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:40:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:40:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:40:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:40:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 09:41:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 09:43:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 09:44:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 09:44:38');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 09:45:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 09:46:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 09:47:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 09:48:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 09:49:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 09:49:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 10:20:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/edit/2', '', '2020-03-16 10:20:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/edit/2', '', '2020-03-16 10:22:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 10:23:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/edit/3', '', '2020-03-16 10:23:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 10:23:19');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 10:24:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 10:24:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 10:25:00');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 10:25:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/delete/4', '', '2020-03-16 10:25:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 10:25:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 10:32:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 10:32:10');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 10:33:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 10:34:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 10:34:37');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 10:34:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/tambah', '', '2020-03-16 10:34:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 10:34:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/delete/5', '', '2020-03-16 10:34:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 10:34:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan/delete/6', '', '2020-03-16 10:35:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 10:35:02');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 11:25:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/struktur', '', '2020-03-16 13:45:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 13:51:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 13:51:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 13:52:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 13:52:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 13:52:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 13:52:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 13:52:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 13:53:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 13:53:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 13:54:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 13:54:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 13:54:26');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 13:55:18');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 13:57:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 13:57:42');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 13:58:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 13:58:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:01:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:01:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:02:17');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:02:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:02:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:05:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:14:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:21:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:22:30');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:22:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:22:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:23:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:24:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:28:23');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:28:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:28:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/edit/10', '', '2020-03-16 14:30:05');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:30:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/delete/9', '', '2020-03-16 14:36:36');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:36:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:36:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/delete/10', '', '2020-03-16 14:37:03');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:37:04');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:37:07');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:37:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/edit/8', '', '2020-03-16 14:37:25');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/edit/8', '', '2020-03-16 14:38:50');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/edit/8', '', '2020-03-16 14:39:20');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/edit/8', '', '2020-03-16 14:40:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/edit/8', '', '2020-03-16 14:40:49');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/edit/8', '', '2020-03-16 14:41:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/edit/8', '', '2020-03-16 14:41:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:41:51');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/edit/8', '', '2020-03-16 14:41:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/edit/8', '', '2020-03-16 14:42:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:42:01');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/edit/8', '', '2020-03-16 14:42:09');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/edit/8', '', '2020-03-16 14:42:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:42:16');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:42:21');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:42:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:42:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/proses', '', '2020-03-16 14:42:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:42:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:43:13');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:43:31');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:43:33');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:43:40');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:43:41');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:43:44');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:43:54');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:43:55');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:43:59');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/edit/5', '', '2020-03-16 14:44:06');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/edit/5', '', '2020-03-16 14:44:11');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:44:12');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:44:14');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:44:43');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:44:45');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:45:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:45:29');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:45:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:45:47');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:45:48');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-16 14:47:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-16 14:47:34');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-16 14:47:56');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-16 14:49:15');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-16 14:49:57');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-16 14:50:22');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi', '', '2020-03-16 14:50:28');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/biografi/tambah', '', '2020-03-16 14:50:32');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/jabatan', '', '2020-03-16 14:50:35');
INSERT INTO `user_log` VALUES (0, '::1', 1, 'javawebmedia', '', 'http://localhost:8888/compro/admin/hasil_pertandingan', '', '2020-03-16 14:50:39');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_bagian` int(11) DEFAULT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `password_hint` varchar(64) NOT NULL,
  `akses_level` varchar(20) NOT NULL,
  `kode_rahasia` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `tanggal_post` datetime NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 0, 'Andoyo Cakep', 'andoyoandoyo@gmail.com', 'javawebmedia', 'dc28d4424ece38803650f440d7eb1cb2b3fb6651', 'javawebmedia', 'Admin', NULL, 'team-3.jpg', '', '2019-10-12 15:50:21', '2020-02-13 07:58:36');
INSERT INTO `users` VALUES (2, 0, 'Rayyan', 'andoyoandoyo@gmail.com', 'rayyan', 'acc5d43e0936dbf3f27b906891aaafdf9ede4508', '', 'User', NULL, NULL, '', '2019-04-24 17:21:18', '2019-04-24 17:21:18');
INSERT INTO `users` VALUES (3, 0, 'DITJEN PENYELENGGARAAN HAJI DAN UMRAH KEMENTERIAN ', 'andoyoandoyo@gmail.com', 'diana', '6a90af129eeefc2f6e6a38746a2b33cb04c2c632', '', 'User', NULL, NULL, '<p>adada</p>', '2019-10-12 14:10:05', '2019-10-12 14:10:05');
COMMIT;

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id_video` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `posisi` varchar(20) NOT NULL,
  `keterangan` text,
  `video` text NOT NULL,
  `urutan` int(11) DEFAULT NULL,
  `bahasa` varchar(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of video
-- ----------------------------
BEGIN;
INSERT INTO `video` VALUES (4, 'INSTALASI XAMPP DAN SUBLIME TEXT', 'Homepage', 'INSTALASI XAMPP DAN SUBLIME TEXT', 'A66PiaPuTZs', 1, 'Indonesia', 1, '2020-02-13 07:48:03');
INSERT INTO `video` VALUES (5, 'Sesi 2 Konfigurasi, Halaman Login, Belajar Controller dan View', 'Homepage', 'Sesi 2 Konfigurasi, Halaman Login, Belajar Controller dan View', 'kFfAir_JgIU', 2, 'Indonesia', 1, '2020-02-13 07:48:31');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
