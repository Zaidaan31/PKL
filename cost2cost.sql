-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Sep 2024 pada 06.56
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cost2cost`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addTesting` (IN `in_tujuan` VARCHAR(50), IN `in_pengirim` VARCHAR(255), IN `in_penerima` VARCHAR(255), IN `in_tlp_pengirim` VARCHAR(13), IN `in_tlp_penerima` VARCHAR(13), IN `in_almt_pengirim` TEXT, IN `in_almt_penerima` TEXT, IN `in_service` VARCHAR(50), IN `in_tipe_barang` VARCHAR(50), IN `in_qty` INT, IN `in_weight` INT)   BEGIN
    DECLARE last_inserted_id INT;

    -- Insert data into the barang bekasi table
    INSERT INTO cost2cost.barang(type, qty, weight)
    VALUES(in_tipe_barang, in_qty, in_weight);

    -- Get the last inserted id for id_barang
    SET last_inserted_id = LAST_INSERT_ID();

    -- Insert data into the customer bekasi table
    INSERT INTO cost2cost.customer(tujuan, nama_pengirim, nama_penerima, tlp_pengirim, tlp_penerima,
    alamat_pengirim, alamat_penerima, tanggal, id_barang, id_service)
    VALUES( in_tujuan, in_pengirim, in_penerima, in_tlp_pengirim, in_tlp_penerima,
    in_almt_pengirim, in_almt_penerima, NOW(), last_inserted_id, in_service);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCIbgr` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(b.origin, bj.origin, bd.origin, bb.origin, bt.origin) AS Origin,
        COALESCE(b.code, bj.code, bd.code, bb.code, bt.code) AS Kode,
        c.tanggal AS Tanggal,
        C.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(b.QTY, bj.QTY, bd.QTY, bb.QTY, bt.QTY) AS Kuantitas,
        COALESCE(b.weight, bj.weight, bd.weight, bb.weight, bt.weight) AS Berat,
        s.amount AS Amount,
        c.id_barang,
        c.id_barang_bks,
        c.id_barang_jkt,
        c.id_barang_dpk,
        c.id_barang_tgr
    FROM customer c
    LEFT JOIN cost2cost.service s ON c.id_service = s.id
    LEFT JOIN cost2cost.barang b ON c.id_barang = b.id
    LEFT JOIN cost2cost.barang_bks bb ON c.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON c.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON c.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_tgr bt ON c.id_barang_tgr = bt.id
    WHERE c.id_barang_bgr = 0
    AND c.tujuan ="BOGOR"
    AND MONTH(c.tanggal) = MONTH(CURDATE())
    AND YEAR(c.tanggal) = YEAR(CURDATE())
    ORDER BY c.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCIbks` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(b.origin, bj.origin, bd.origin, br.origin, bt.origin) AS Origin,
        COALESCE(b.code, bj.code, bd.code, br.code, bt.code) AS Kode,
        c.tanggal AS Tanggal,
        C.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(b.QTY, bj.QTY, bd.QTY, br.QTY, bt.QTY) AS Kuantitas,
        COALESCE(b.weight, bj.weight, bd.weight, br.weight, bt.weight) AS Berat,
        s.amount AS Amount,
        c.id_barang,
        c.id_barang_bks,
        c.id_barang_jkt,
        c.id_barang_dpk,
        c.id_barang_bgr,
        c.id_barang_tgr
    FROM customer c
    LEFT JOIN cost2cost.service s ON c.id_service = s.id
    LEFT JOIN cost2cost.barang b ON c.id_barang = b.id
    LEFT JOIN cost2cost.barang_bks bb ON c.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON c.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON c.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_bgr br ON c.id_barang_bgr = br.id
    LEFT JOIN cost2cost.barang_tgr bt ON c.id_barang_tgr = bt.id
    WHERE c.id_barang_bks = 0
    AND c.tujuan ="BEKASI"
    AND MONTH(c.tanggal) = MONTH(CURDATE())
    AND YEAR(c.tanggal) = YEAR(CURDATE())
    ORDER BY c.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCIckr` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(bb.origin, bj.origin, bd.origin, br.origin, bt.origin) AS Origin,
        COALESCE(bb.code, bj.code, bd.code, br.code, bt.code) AS Kode,
        c.tanggal AS Tanggal,
        C.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(bb.QTY, bj.QTY, bd.QTY, br.QTY, bt.QTY) AS Kuantitas,
        COALESCE(bb.weight, bj.weight, bd.weight, br.weight, bt.weight) AS Berat,
        s.amount AS Amount,
        c.id_barang,
        c.id_barang_bks,
        c.id_barang_jkt,
        c.id_barang_dpk,
        c.id_barang_bgr,
        c.id_barang_tgr
    FROM customer c
    LEFT JOIN cost2cost.service s ON c.id_service = s.id
    LEFT JOIN cost2cost.barang b ON c.id_barang = b.id
    LEFT JOIN cost2cost.barang_bks bb ON c.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON c.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON c.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_bgr br ON c.id_barang_bgr = br.id
    LEFT JOIN cost2cost.barang_tgr bt ON c.id_barang_tgr = bt.id
    WHERE c.id_barang = 0
    AND c.tujuan ="CIKARANG"
    AND MONTH(c.tanggal) = MONTH(CURDATE())
    AND YEAR(c.tanggal) = YEAR(CURDATE())
    ORDER BY c.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCIdpk` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(bb.origin, bj.origin, b.origin, br.origin, bt.origin) AS Origin,
        COALESCE(bb.code, bj.code, b.code, br.code, bt.code) AS Kode,
        c.tanggal AS Tanggal,
        C.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(bb.QTY, bj.QTY, b.QTY, br.QTY, bt.QTY) AS Kuantitas,
        COALESCE(bb.weight, bj.weight, b.weight, br.weight, bt.weight) AS Berat,
        s.amount AS Amount,
        c.id_barang,
        c.id_barang_bks,
        c.id_barang_jkt,
        c.id_barang_dpk,
        c.id_barang_bgr,
        c.id_barang_tgr
    FROM customer c
    LEFT JOIN cost2cost.service s ON c.id_service = s.id
    LEFT JOIN cost2cost.barang b ON c.id_barang = b.id
    LEFT JOIN cost2cost.barang_bks bb ON c.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON c.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON c.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_bgr br ON c.id_barang_bgr = br.id
    LEFT JOIN cost2cost.barang_tgr bt ON c.id_barang_tgr = bt.id
    WHERE c.id_barang_dpk = 0
    AND c.tujuan ="DEPOK"
    AND MONTH(c.tanggal) = MONTH(CURDATE())
    AND YEAR(c.tanggal) = YEAR(CURDATE())
    ORDER BY c.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCIjkt` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(bb.origin, b.origin, bd.origin, br.origin, bt.origin) AS Origin,
        COALESCE(bb.code, b.code, bd.code, br.code, bt.code) AS Kode,
        c.tanggal AS Tanggal,
        C.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(bb.QTY, b.QTY, bd.QTY, br.QTY, bt.QTY) AS Kuantitas,
        COALESCE(bb.weight, b.weight, bd.weight, br.weight, bt.weight) AS Berat,
        s.amount AS Amount,
        c.id_barang,
        c.id_barang_bks,
        c.id_barang_jkt,
        c.id_barang_dpk,
        c.id_barang_bgr,
        c.id_barang_tgr
    FROM customer c
    LEFT JOIN cost2cost.service s ON c.id_service = s.id
    LEFT JOIN cost2cost.barang b ON c.id_barang = b.id
    LEFT JOIN cost2cost.barang_bks bb ON c.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON c.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON c.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_bgr br ON c.id_barang_bgr = br.id
    LEFT JOIN cost2cost.barang_tgr bt ON c.id_barang_tgr = bt.id
    WHERE c.id_barang_jkt = 0
    AND c.tujuan ="JAKARTA"
    AND MONTH(c.tanggal) = MONTH(CURDATE())
    AND YEAR(c.tanggal) = YEAR(CURDATE())
    ORDER BY c.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCItgr` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(b.origin, bj.origin, bd.origin, bb.origin, br.origin) AS Origin,
        COALESCE(b.code, bj.code, bd.code, bb.code, br.code) AS Kode,
        c.tanggal AS Tanggal,
        C.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(b.QTY, bj.QTY, bd.QTY, bb.QTY, br.QTY) AS Kuantitas,
        COALESCE(b.weight, bj.weight, bd.weight, bb.weight, br.weight) AS Berat,
        s.amount AS Amount,
        c.id_barang,
        c.id_barang_bks,
        c.id_barang_jkt,
        c.id_barang_dpk,
        c.id_barang_tgr,
        c.id_barang_bgr
    FROM customer c
    LEFT JOIN cost2cost.service s ON c.id_service = s.id
    LEFT JOIN cost2cost.barang b ON c.id_barang = b.id
    LEFT JOIN cost2cost.barang_bks bb ON c.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON c.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON c.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_tgr bt ON c.id_barang_tgr = bt.id
    LEFT JOIN cost2cost.barang_bgr br ON c.id_barang_bgr = br.id
    WHERE c.id_barang_tgr = 0
    AND c.tujuan ="TANGGERANG"
    AND MONTH(c.tanggal) = MONTH(CURDATE())
    AND YEAR(c.tanggal) = YEAR(CURDATE())
    ORDER BY c.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCObgr` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        c.id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        c.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        c.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.customer c
    INNER JOIN
        cost2cost.barang_bgr b ON c.id_barang_bgr = b.id
    INNER JOIN
        cost2cost.service s ON c.id_service = s.id
    WHERE c.id_barang_bgr <> 0
    AND MONTH(c.tanggal) = MONTH(CURDATE())
    AND YEAR(c.tanggal) = YEAR(CURDATE())
    ORDER BY c.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCObks` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        c.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        c.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.customer c
    INNER JOIN
        cost2cost.barang_bks b ON c.id_barang_bks = b.id
    INNER JOIN
        cost2cost.service s ON c.id_service = s.id
    WHERE c.id_barang_bks <> 0
    AND MONTH(c.tanggal) = MONTH(CURDATE())
    AND YEAR(c.tanggal) = YEAR(CURDATE())
    ORDER BY c.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCOckr` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        c.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        c.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.customer c
    INNER JOIN
        cost2cost.barang b ON c.id_barang = b.id
    INNER JOIN
        cost2cost.service s ON c.id_service = s.id
    WHERE c.id_barang <> 0
    AND MONTH(c.tanggal) = MONTH(CURDATE())
    AND YEAR(c.tanggal) = YEAR(CURDATE())
    ORDER BY c.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCOdpk` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        c.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        c.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.customer c
    INNER JOIN
        cost2cost.barang_dpk b ON c.id_barang_dpk = b.id
    INNER JOIN
        cost2cost.service s ON c.id_service = s.id
    WHERE c.id_barang_dpk <> 0
    AND MONTH(c.tanggal) = MONTH(CURDATE())
    AND YEAR(c.tanggal) = YEAR(CURDATE())
    ORDER BY c.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCOjkt` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        c.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        c.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.customer c
    INNER JOIN
        cost2cost.barang_jkt b ON c.id_barang_jkt = b.id
    INNER JOIN
        cost2cost.service s ON c.id_service = s.id
    WHERE c.id_barang_jkt <> 0
    AND MONTH(c.tanggal) = MONTH(CURDATE())
    AND YEAR(c.tanggal) = YEAR(CURDATE())
    ORDER BY c.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCOtgr` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        c.id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        c.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        c.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.customer c
    INNER JOIN
        cost2cost.barang_tgr b ON c.id_barang_tgr = b.id
    INNER JOIN
        cost2cost.service s ON c.id_service = s.id
    WHERE c.id_barang_tgr <> 0
    AND MONTH(c.tanggal) = MONTH(CURDATE())
    AND YEAR(c.tanggal) = YEAR(CURDATE())
    ORDER BY c.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertBgr` (IN `in_tujuan` VARCHAR(50), IN `in_pengirim` VARCHAR(255), IN `in_penerima` VARCHAR(255), IN `in_tlp_pengirim` VARCHAR(13), IN `in_tlp_penerima` VARCHAR(13), IN `in_almt_pengirim` TEXT, IN `in_almt_penerima` TEXT, IN `in_service` VARCHAR(50), IN `in_tipe_barang` VARCHAR(50), IN `in_qty` INT, IN `in_weight` INT)   BEGIN
    DECLARE last_inserted_id INT;

    -- Insert data into the barang bogor table
    INSERT INTO cost2cost.barang_bgr(type, qty, weight)
    VALUES(in_tipe_barang, in_qty, in_weight);

    -- Get the last inserted id for id_barang
    SET last_inserted_id = LAST_INSERT_ID();

    -- Insert data into the customer table
    INSERT INTO cost2cost.customer(tujuan, nama_pengirim, nama_penerima, tlp_pengirim, tlp_penerima,
    alamat_pengirim, alamat_penerima, tanggal, id_barang_bgr, id_service)
    VALUES( in_tujuan, in_pengirim, in_penerima, in_tlp_pengirim, in_tlp_penerima,
    in_almt_pengirim, in_almt_penerima, NOW(), last_inserted_id, in_service);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertBks` (IN `in_tujuan` VARCHAR(50), IN `in_pengirim` VARCHAR(255), IN `in_penerima` VARCHAR(255), IN `in_tlp_pengirim` VARCHAR(13), IN `in_tlp_penerima` VARCHAR(13), IN `in_almt_pengirim` TEXT, IN `in_almt_penerima` TEXT, IN `in_service` VARCHAR(50), IN `in_tipe_barang` VARCHAR(50), IN `in_qty` INT, IN `in_weight` INT)   BEGIN
    DECLARE last_inserted_id INT;

    -- Insert data into the barang bekasi table
    INSERT INTO cost2cost.barang_bks(type, qty, weight)
    VALUES(in_tipe_barang, in_qty, in_weight);

    -- Get the last inserted id for id_barang
    SET last_inserted_id = LAST_INSERT_ID();

    -- Insert data into the customer bekasi table
    INSERT INTO cost2cost.customer(tujuan, nama_pengirim, nama_penerima, tlp_pengirim, tlp_penerima,
    alamat_pengirim, alamat_penerima, tanggal, id_barang_bks, id_service)
    VALUES( in_tujuan, in_pengirim, in_penerima, in_tlp_pengirim, in_tlp_penerima,
    in_almt_pengirim, in_almt_penerima, NOW(), last_inserted_id, in_service);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertDpk` (IN `in_tujuan` VARCHAR(50), IN `in_pengirim` VARCHAR(255), IN `in_penerima` VARCHAR(255), IN `in_tlp_pengirim` VARCHAR(13), IN `in_tlp_penerima` VARCHAR(13), IN `in_almt_pengirim` TEXT, IN `in_almt_penerima` TEXT, IN `in_service` VARCHAR(50), IN `in_tipe_barang` VARCHAR(50), IN `in_qty` INT, IN `in_weight` INT)   BEGIN
    DECLARE last_inserted_id INT;

    -- Insert data into the barang depok table
    INSERT INTO cost2cost.barang_dpk(type, qty, weight)
    VALUES(in_tipe_barang, in_qty, in_weight);

    -- Get the last inserted id for id_barang
    SET last_inserted_id = LAST_INSERT_ID();

    -- Insert data into the customer table
    INSERT INTO cost2cost.customer(tujuan, nama_pengirim, nama_penerima, tlp_pengirim, tlp_penerima,
    alamat_pengirim, alamat_penerima, tanggal, id_barang_dpk, id_service)
    VALUES( in_tujuan, in_pengirim, in_penerima, in_tlp_pengirim, in_tlp_penerima,
    in_almt_pengirim, in_almt_penerima, NOW(), last_inserted_id, in_service);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertJkt` (IN `in_tujuan` VARCHAR(50), IN `in_pengirim` VARCHAR(255), IN `in_penerima` VARCHAR(255), IN `in_tlp_pengirim` VARCHAR(13), IN `in_tlp_penerima` VARCHAR(13), IN `in_almt_pengirim` TEXT, IN `in_almt_penerima` TEXT, IN `in_service` VARCHAR(50), IN `in_tipe_barang` VARCHAR(50), IN `in_qty` INT, IN `in_weight` INT)   BEGIN
    DECLARE last_inserted_id INT;

    -- Insert data into the barang jakarta table
    INSERT INTO cost2cost.barang_jkt(type, qty, weight)
    VALUES(in_tipe_barang, in_qty, in_weight);

    -- Get the last inserted id for id_barang
    SET last_inserted_id = LAST_INSERT_ID();

    -- Insert data into the customer jakarta table
    INSERT INTO cost2cost.customer(tujuan, nama_pengirim, nama_penerima, tlp_pengirim, tlp_penerima,
    alamat_pengirim, alamat_penerima, tanggal, id_barang_jkt, id_service)
    VALUES(in_tujuan, in_pengirim, in_penerima, in_tlp_pengirim, in_tlp_penerima,
    in_almt_pengirim, in_almt_penerima, NOW(), last_inserted_id, in_service);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertTgr` (IN `in_tujuan` VARCHAR(50), IN `in_pengirim` VARCHAR(255), IN `in_penerima` VARCHAR(255), IN `in_tlp_pengirim` VARCHAR(13), IN `in_tlp_penerima` VARCHAR(13), IN `in_almt_pengirim` TEXT, IN `in_almt_penerima` TEXT, IN `in_service` VARCHAR(50), IN `in_tipe_barang` VARCHAR(50), IN `in_qty` INT, IN `in_weight` INT)   BEGIN
    DECLARE last_inserted_id INT;

    -- Insert data into the barang tanggerang table
    INSERT INTO cost2cost.barang_tgr(type, qty, weight)
    VALUES(in_tipe_barang, in_qty, in_weight);

    -- Get the last inserted id for id_barang
    SET last_inserted_id = LAST_INSERT_ID();

    -- Insert data into the customer table
    INSERT INTO cost2cost.customer(tujuan, nama_pengirim, nama_penerima, tlp_pengirim, tlp_penerima,
    alamat_pengirim, alamat_penerima, tanggal, id_barang_tgr, id_service)
    VALUES( in_tujuan, in_pengirim, in_penerima, in_tlp_pengirim, in_tlp_penerima,
    in_almt_pengirim, in_almt_penerima, NOW(), last_inserted_id, in_service);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `origin` varchar(50) NOT NULL DEFAULT 'CIKARANG',
  `code` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `origin`, `code`, `type`, `qty`, `weight`) VALUES
(1, 'CIKARANG', 'CKR/OM/00000001', 'DOC', 11, 3),
(2, 'CIKARANG', 'CKR/OM/00000002', 'Makanan', 11, 1),
(3, 'CIKARANG', 'CKR/OM/00000003', 'Pakaian', 2, 3),
(4, 'CIKARANG', 'CKR/OM/00000004', 'Kendaraan', 1, 100);

--
-- Trigger `barang`
--
DELIMITER $$
CREATE TRIGGER `getID` BEFORE INSERT ON `barang` FOR EACH ROW BEGIN
	INSERT INTO `id_value` VALUES (NULL);
    SET NEW.code = CONCAT("CKR/OM/" ,LPAD(LAST_INSERT_ID(), 8, "0"));
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_bgr`
--

CREATE TABLE `barang_bgr` (
  `id` int(11) NOT NULL,
  `origin` varchar(50) NOT NULL DEFAULT 'BOGOR',
  `code` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang_bgr`
--

INSERT INTO `barang_bgr` (`id`, `origin`, `code`, `type`, `qty`, `weight`) VALUES
(1, 'BOGOR', 'BGR/OM/00000001', 'Doc', 5, 2),
(2, 'BOGOR', 'BGR/OM/00000002', 'Doc', 5, 1);

--
-- Trigger `barang_bgr`
--
DELIMITER $$
CREATE TRIGGER `getID_bgr` BEFORE INSERT ON `barang_bgr` FOR EACH ROW BEGIN
	INSERT INTO `id_value_bgr` VALUES (NULL);
    SET NEW.code = CONCAT("BGR/OM/" ,LPAD(LAST_INSERT_ID(), 8, "0"));
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_bks`
--

CREATE TABLE `barang_bks` (
  `id` int(11) NOT NULL,
  `origin` varchar(50) NOT NULL DEFAULT 'BEKASI',
  `code` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang_bks`
--

INSERT INTO `barang_bks` (`id`, `origin`, `code`, `type`, `qty`, `weight`) VALUES
(1, 'BEKASI', 'BKS/OM/00000001', 'Pakaian', 100, 50),
(2, 'BEKASI', 'BKS/OM/00000002', 'Pakaian', 5, 2),
(3, 'BEKASI', 'BKS/OM/00000003', 'asijudwjqe', 11, 50);

--
-- Trigger `barang_bks`
--
DELIMITER $$
CREATE TRIGGER `getID_bks` BEFORE INSERT ON `barang_bks` FOR EACH ROW BEGIN
	INSERT INTO `id_value_bks` VALUES (NULL);
    SET NEW.code = CONCAT("BKS/OM/" ,LPAD(LAST_INSERT_ID(), 8, "0"));
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_dpk`
--

CREATE TABLE `barang_dpk` (
  `id` int(11) NOT NULL,
  `origin` varchar(50) NOT NULL DEFAULT 'DEPOK',
  `code` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang_dpk`
--

INSERT INTO `barang_dpk` (`id`, `origin`, `code`, `type`, `qty`, `weight`) VALUES
(1, 'DEPOK', 'DPK/OM/00000001', 'Doc', 5, 4),
(2, 'DEPOK', 'DPK/OM/00000002', 'Pakaian', 5, 100),
(3, 'DEPOK', 'DPK/OM/00000003', 'Pakaian', 100, 100);

--
-- Trigger `barang_dpk`
--
DELIMITER $$
CREATE TRIGGER `getID_dpk` BEFORE INSERT ON `barang_dpk` FOR EACH ROW BEGIN
	INSERT INTO `id_value_dpk` VALUES (NULL);
    SET NEW.code = CONCAT("DPK/OM/" ,LPAD(LAST_INSERT_ID(), 8, "0"));
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_jkt`
--

CREATE TABLE `barang_jkt` (
  `id` int(11) NOT NULL,
  `origin` varchar(50) NOT NULL DEFAULT 'JAKARTA',
  `code` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang_jkt`
--

INSERT INTO `barang_jkt` (`id`, `origin`, `code`, `type`, `qty`, `weight`) VALUES
(1, 'JAKARTA', 'JKT/OM/00000001', 'Makanan', 100, 3),
(2, 'JAKARTA', 'JKT/OM/00000002', 'Kendaraan', 2, 100),
(3, 'JAKARTA', 'JKT/OM/00000003', 'Makanan', 5, 2),
(4, 'JAKARTA', 'JKT/OM/00000004', 'Doc', 2, 1);

--
-- Trigger `barang_jkt`
--
DELIMITER $$
CREATE TRIGGER `getID_jkt` BEFORE INSERT ON `barang_jkt` FOR EACH ROW BEGIN
	INSERT INTO `id_value_jkt` VALUES (NULL);
    SET NEW.code = CONCAT("JKT/OM/" ,LPAD(LAST_INSERT_ID(), 8, "0"));
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_tgr`
--

CREATE TABLE `barang_tgr` (
  `id` int(11) NOT NULL,
  `origin` varchar(50) NOT NULL DEFAULT 'TANGGERANG',
  `code` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang_tgr`
--

INSERT INTO `barang_tgr` (`id`, `origin`, `code`, `type`, `qty`, `weight`) VALUES
(1, 'TANGGERANG', 'TGR/OM/00000001', 'Kendaraan', 11, 10000);

--
-- Trigger `barang_tgr`
--
DELIMITER $$
CREATE TRIGGER `getID_tgr` BEFORE INSERT ON `barang_tgr` FOR EACH ROW BEGIN
	INSERT INTO `id_value_tgr` VALUES (NULL);
    SET NEW.code = CONCAT("TGR/OM/" ,LPAD(LAST_INSERT_ID(), 8, "0"));
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `nama_pengirim` varchar(255) NOT NULL,
  `nama_penerima` varchar(255) NOT NULL,
  `tlp_pengirim` varchar(13) NOT NULL,
  `tlp_penerima` varchar(13) NOT NULL,
  `alamat_pengirim` text NOT NULL,
  `alamat_penerima` text NOT NULL,
  `Tanggal` date DEFAULT NULL,
  `id_barang` int(11) NOT NULL,
  `id_barang_bks` int(11) NOT NULL,
  `id_barang_jkt` int(11) NOT NULL,
  `id_barang_dpk` int(11) NOT NULL,
  `id_barang_bgr` int(11) NOT NULL,
  `id_barang_tgr` int(11) NOT NULL,
  `id_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `tujuan`, `nama_pengirim`, `nama_penerima`, `tlp_pengirim`, `tlp_penerima`, `alamat_pengirim`, `alamat_penerima`, `Tanggal`, `id_barang`, `id_barang_bks`, `id_barang_jkt`, `id_barang_dpk`, `id_barang_bgr`, `id_barang_tgr`, `id_service`) VALUES
(1, 'BEKASI', 'Zaidaan', 'Nabil', '0812345678', '0898654321', 'cikarang', 'bekasi', '2024-08-29', 1, 0, 0, 0, 0, 0, 3),
(2, 'CIKARANG', 'Nabil', 'Zaidaan', '0823657813', '0898654321', 'bekasi', 'cikarang', '2024-08-29', 0, 1, 0, 0, 0, 0, 1),
(3, 'CIKARANG', 'Jamal', 'Zaidaan', '0823657813', '0898654321', 'jakarta', 'cikarang', '2024-08-29', 0, 0, 1, 0, 0, 0, 2),
(4, 'CIKARANG', 'Amimir', 'Zaidaan', '0823657813', '0898654321', 'jakarta timur', 'cikarang', '2024-08-29', 0, 0, 2, 0, 0, 0, 3),
(5, 'BEKASI', 'Jamal', 'Mamat', '0823657813', '0898654321', 'JAKARTA', 'bekasi', '2024-08-29', 0, 0, 3, 0, 0, 0, 2),
(6, 'JAKARTA', 'Zaidaan', 'Mamat', '0823657813', '0898654321', 'cikarang', 'jakarta', '2024-08-29', 2, 0, 0, 0, 0, 0, 2),
(7, 'JAKARTA', 'Nabil', 'Mamat', '0823657813', '0898654321', 'bekasi', 'jakarta', '2024-08-29', 0, 2, 0, 0, 0, 0, 1),
(8, 'CIKARANG', 'Testing1', 'Zaidaan', '0823657813', '0898654321', 'depok', 'cikarang', '2024-09-02', 0, 0, 0, 1, 0, 0, 1),
(9, 'BEKASI', 'Jamal', 'Mamat', '0823657813', '0898654321', 'depok', 'bekasi', '2024-09-02', 0, 0, 0, 2, 0, 0, 2),
(10, 'DEPOK', 'Jamal', 'Nabil', '0823657813', '0898654321', 'ckr', 'dpk', '2024-09-02', 3, 0, 0, 0, 0, 0, 3),
(11, 'CIKARANG', 'Testing3', 'Mamat', '0823657813', '0898654321', 'bogor', 'cikarang', '2024-09-02', 0, 0, 0, 0, 1, 0, 1),
(12, 'BOGOR', 'Amimir', 'Testing4', '0823657813', '0898654321', 'ckr', 'bgr', '2024-09-02', 4, 0, 0, 0, 0, 0, 2),
(13, 'BOGOR', 'Amimir', 'Testing4', '0823657813', '0898654321', 'tgr', 'bgr', '2024-09-02', 0, 0, 0, 0, 0, 1, 2),
(14, 'TANGGERANG', 'Nabil', 'Testing4', '0823657813', '0898654321', 'bgr', 'tgr', '2024-09-02', 0, 0, 0, 0, 2, 0, 1),
(15, 'TANGGERANG', 'Testing3', 'Mamat', '0823657813', '0898654321', 'bks', 'tgr', '2024-09-02', 0, 3, 0, 0, 0, 0, 3),
(16, 'DEPOK', 'Jamal', 'Mamat', '0823657813', '0898654321', 'jkt', 'dpk', '2024-09-02', 0, 0, 4, 0, 0, 0, 2),
(17, 'JAKARTA', 'Nabil', 'Testing4', '0823657813', '0898654321', 'dpk', 'jkt', '2024-09-02', 0, 0, 0, 3, 0, 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `id_value`
--

CREATE TABLE `id_value` (
  `id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `id_value`
--

INSERT INTO `id_value` (`id`) VALUES
(1),
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `id_value_bgr`
--

CREATE TABLE `id_value_bgr` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `id_value_bgr`
--

INSERT INTO `id_value_bgr` (`id`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `id_value_bks`
--

CREATE TABLE `id_value_bks` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `id_value_bks`
--

INSERT INTO `id_value_bks` (`id`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `id_value_dpk`
--

CREATE TABLE `id_value_dpk` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `id_value_dpk`
--

INSERT INTO `id_value_dpk` (`id`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `id_value_jkt`
--

CREATE TABLE `id_value_jkt` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `id_value_jkt`
--

INSERT INTO `id_value_jkt` (`id`) VALUES
(1),
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `id_value_tgr`
--

CREATE TABLE `id_value_tgr` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `id_value_tgr`
--

INSERT INTO `id_value_tgr` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `nama` varchar(10) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `service`
--

INSERT INTO `service` (`id`, `nama`, `amount`) VALUES
(1, 'OKE23', 1200),
(2, 'REG23', 2400),
(3, 'YES23', 4800);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('admin','finance ckr','finance bks','finance jkt','finance dpk','finance bgr','finance tgr','sales ckr','sales bks','sales jkt','sales dpk','sales bgr','sales tgr') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level`) VALUES
(1, 'superadmin', '$2y$10$MSuf.1Slv0xFDgiW9RyciuBOD1NtPtmQmucI2cMff8p0AlgsEhpgy', 'admin'),
(2, 'superadmin1', '$2y$10$u8YjBVPERmsqTGaHhnmz8.x5x9yNipq6gOsHmGMVopc4RTr1sJPMm', 'admin'),
(3, 'Finance Cikarang', '$2y$10$T6doTp9dQ4MdT2tgWLMZk.C2bgqeG69UG6vhFgIeQIWWErg5iArD2', 'finance ckr'),
(4, 'Sales Counter Cikarang', '$2y$10$XTjPj0EbJm5UyEdDxZCesOzZ0PXkwg3wQGlcxxOKhio4k8Wmp2r0W', 'sales ckr'),
(5, 'Finance Bekasi', '$2y$10$8fFNi4chPBdtRtOeh6sYP.EBaAuf5J7qP0RvuXkyPM0o0SzKxu3lG', 'finance bks'),
(6, 'Sales Counter Bekasi', '$2y$10$2UkWTBO8Z7lxeeNdRqDMjezmx6NnQccvsiWbh9ztlM9QzDmeybYLq', 'sales bks'),
(7, 'Finance Jakarta', '$2y$10$ADOsDwlYT1VpkC7r.lsyee/pSCpAFGMAHQxUAAgoKAsePUny2YuDu', 'finance jkt'),
(8, 'Sales Counter Jakarta', '$2y$10$xpdTL.9MrX7OhYJCmKHQP.AdsbLT6HM0fqLtLj1/CBQiPrqO2WqQK', 'sales jkt'),
(9, 'Finance Depok', '$2y$10$tpBMbjq.iunPgYolEJKHDek9F9TEa19licIUPr4rJGip6XlAq1mLW', 'finance dpk'),
(10, 'Sales Counter Depok', '$2y$10$lRx5KH1z4aX.fF9j6VFKte2VkriDqGJ3sM.mCUPyHKYI01FX4/tRC', 'sales dpk'),
(11, 'Finance Bogor', '$2y$10$NOJsUygGSmc.B4pHPQjkLeWD5075RSOyWKPpG.qWttEhrMV8yqZZq', 'finance bgr'),
(12, 'Sales Counter Bogor', '$2y$10$tPLXPf81r30Emfcir8AGke9hQQXyyUC3JmjrNaNQHjMsorDoWAHDS', 'sales bgr'),
(13, 'Finance Tanggerang', '$2y$10$Vyv3Izf4TVtOJeIRdoHwtu8OieYX/yKXUjRUvR0yY80jsunrOLqRa', 'finance tgr'),
(14, 'Sales Counter Tanggerang', '$2y$10$fXKHgIMxCFcPRADSWMJ.9eSp7I7ociFOza1ClcfdYs5AA9WWNw4nG', 'sales tgr');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indeks untuk tabel `barang_bgr`
--
ALTER TABLE `barang_bgr`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indeks untuk tabel `barang_bks`
--
ALTER TABLE `barang_bks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indeks untuk tabel `barang_dpk`
--
ALTER TABLE `barang_dpk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indeks untuk tabel `barang_jkt`
--
ALTER TABLE `barang_jkt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indeks untuk tabel `barang_tgr`
--
ALTER TABLE `barang_tgr`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `id_value`
--
ALTER TABLE `id_value`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `id_value_bgr`
--
ALTER TABLE `id_value_bgr`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `id_value_bks`
--
ALTER TABLE `id_value_bks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `id_value_dpk`
--
ALTER TABLE `id_value_dpk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `id_value_jkt`
--
ALTER TABLE `id_value_jkt`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `id_value_tgr`
--
ALTER TABLE `id_value_tgr`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `barang_bgr`
--
ALTER TABLE `barang_bgr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `barang_bks`
--
ALTER TABLE `barang_bks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `barang_dpk`
--
ALTER TABLE `barang_dpk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `barang_jkt`
--
ALTER TABLE `barang_jkt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `barang_tgr`
--
ALTER TABLE `barang_tgr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `id_value`
--
ALTER TABLE `id_value`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `id_value_bgr`
--
ALTER TABLE `id_value_bgr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `id_value_bks`
--
ALTER TABLE `id_value_bks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `id_value_dpk`
--
ALTER TABLE `id_value_dpk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `id_value_jkt`
--
ALTER TABLE `id_value_jkt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `id_value_tgr`
--
ALTER TABLE `id_value_tgr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
