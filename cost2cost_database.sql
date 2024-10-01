-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Okt 2024 pada 10.40
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCIbgr` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(b.origin, bj.origin, bd.origin, bb.origin, bt.origin) AS Origin,
        COALESCE(b.code, bj.code, bd.code, bb.code, bt.code) AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        tr.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(b.QTY, bj.QTY, bd.QTY, bb.QTY, bt.QTY) AS Kuantitas,
        COALESCE(b.weight, bj.weight, bd.weight, bb.weight, bt.weight) AS Berat,
        s.amount AS Amount,
        tr.id_barang_ckr,
        tr.id_barang_bks,
        tr.id_barang_jkt,
        tr.id_barang_dpk,
        tr.id_barang_tgr
    FROM trans tr
    LEFT JOIN cost2cost.customer c ON tr.id_cust = c.id
    LEFT JOIN cost2cost.service s ON tr.id_service = s.id
    LEFT JOIN cost2cost.barang b ON tr.id_barang_ckr = b.id
    LEFT JOIN cost2cost.barang_bks bb ON tr.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON tr.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON tr.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_tgr bt ON tr.id_barang_tgr = bt.id
    WHERE tr.id_barang_bgr = 0
    AND tr.tujuan ="BOGOR"
    AND MONTH(tr.tanggal) = MONTH(CURDATE())
    AND YEAR(tr.tanggal) = YEAR(CURDATE())
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCIbks` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(b.origin, bj.origin, bd.origin, br.origin, bt.origin) AS Origin,
        COALESCE(b.code, bj.code, bd.code, br.code, bt.code) AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        tr.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(b.QTY, bj.QTY, bd.QTY, br.QTY, bt.QTY) AS Kuantitas,
        COALESCE(b.weight, bj.weight, bd.weight, br.weight, bt.weight) AS Berat,
        s.amount AS Amount,
        tr.id_barang_ckr,
        tr.id_barang_bks,
        tr.id_barang_jkt,
        tr.id_barang_dpk,
        tr.id_barang_bgr,
        tr.id_barang_tgr
    FROM trans tr
    LEFT JOIN cost2cost.customer c ON tr.id_cust = c.id
    LEFT JOIN cost2cost.service s ON tr.id_service = s.id
    LEFT JOIN cost2cost.barang b ON tr.id_barang_ckr = b.id
    LEFT JOIN cost2cost.barang_bks bb ON tr.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON tr.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON tr.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_bgr br ON tr.id_barang_bgr = br.id
    LEFT JOIN cost2cost.barang_tgr bt ON tr.id_barang_tgr = bt.id
    WHERE tr.id_barang_bks = 0
    AND tr.tujuan ="BEKASI"
    AND MONTH(tr.tanggal) = MONTH(CURDATE())
    AND YEAR(tr.tanggal) = YEAR(CURDATE())
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCIckr` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(bb.origin, bj.origin, bd.origin, br.origin, bt.origin) AS Origin,
        COALESCE(bb.code, bj.code, bd.code, br.code, bt.code) AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        tr.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(bb.QTY, bj.QTY, bd.QTY, br.QTY, bt.QTY) AS Kuantitas,
        COALESCE(bb.weight, bj.weight, bd.weight, br.weight, bt.weight) AS Berat,
        s.amount AS Amount,
        tr.id_barang_ckr,
        tr.id_barang_bks,
        tr.id_barang_jkt,
        tr.id_barang_dpk,
        tr.id_barang_bgr,
        tr.id_barang_tgr
    FROM trans tr
    LEFT JOIN cost2cost.customer c ON tr.id_cust = c.id
    LEFT JOIN cost2cost.service s ON tr.id_service = s.id
    LEFT JOIN cost2cost.barang b ON tr.id_barang_ckr = b.id
    LEFT JOIN cost2cost.barang_bks bb ON tr.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON tr.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON tr.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_bgr br ON tr.id_barang_bgr = br.id
    LEFT JOIN cost2cost.barang_tgr bt ON tr.id_barang_tgr = bt.id
    WHERE tr.id_barang_ckr = 0
    AND tr.tujuan ="CIKARANG"
    AND MONTH(tr.tanggal) = MONTH(CURDATE())
    AND YEAR(tr.tanggal) = YEAR(CURDATE())
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCIdpk` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(bb.origin, bj.origin, b.origin, br.origin, bt.origin) AS Origin,
        COALESCE(bb.code, bj.code, b.code, br.code, bt.code) AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        tr.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(bb.QTY, bj.QTY, b.QTY, br.QTY, bt.QTY) AS Kuantitas,
        COALESCE(bb.weight, bj.weight, b.weight, br.weight, bt.weight) AS Berat,
        s.amount AS Amount,
        tr.id_barang_ckr,
        tr.id_barang_bks,
        tr.id_barang_jkt,
        tr.id_barang_dpk,
        tr.id_barang_bgr,
        tr.id_barang_tgr
    FROM trans tr
    LEFT JOIN cost2cost.customer c ON tr.id_cust = c.id
    LEFT JOIN cost2cost.service s ON tr.id_service = s.id
    LEFT JOIN cost2cost.barang b ON tr.id_barang_ckr = b.id
    LEFT JOIN cost2cost.barang_bks bb ON tr.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON tr.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON tr.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_bgr br ON tr.id_barang_bgr = br.id
    LEFT JOIN cost2cost.barang_tgr bt ON tr.id_barang_tgr = bt.id
    WHERE tr.id_barang_dpk = 0
    AND tr.tujuan ="DEPOK"
    AND MONTH(tr.tanggal) = MONTH(CURDATE())
    AND YEAR(tr.tanggal) = YEAR(CURDATE())
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCIjkt` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(bb.origin, b.origin, bd.origin, br.origin, bt.origin) AS Origin,
        COALESCE(bb.code, b.code, bd.code, br.code, bt.code) AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        tr.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(bb.QTY, b.QTY, bd.QTY, br.QTY, bt.QTY) AS Kuantitas,
        COALESCE(bb.weight, b.weight, bd.weight, br.weight, bt.weight) AS Berat,
        s.amount AS Amount,
        tr.id_barang_ckr,
        tr.id_barang_bks,
        tr.id_barang_jkt,
        tr.id_barang_dpk,
        tr.id_barang_bgr,
        tr.id_barang_tgr
    FROM trans tr
    LEFT JOIN cost2cost.customer c ON tr.id_cust = c.id
    LEFT JOIN cost2cost.service s ON tr.id_service = s.id
    LEFT JOIN cost2cost.barang b ON tr.id_barang_ckr = b.id
    LEFT JOIN cost2cost.barang_bks bb ON tr.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON tr.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON tr.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_bgr br ON tr.id_barang_bgr = br.id
    LEFT JOIN cost2cost.barang_tgr bt ON tr.id_barang_tgr = bt.id
    WHERE tr.id_barang_jkt = 0
    AND tr.tujuan ="JAKARTA"
    AND MONTH(tr.tanggal) = MONTH(CURDATE())
    AND YEAR(tr.tanggal) = YEAR(CURDATE())
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCItgr` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(b.origin, bj.origin, bd.origin, bb.origin, br.origin) AS Origin,
        COALESCE(b.code, bj.code, bd.code, bb.code, br.code) AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        tr.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(b.QTY, bj.QTY, bd.QTY, bb.QTY, br.QTY) AS Kuantitas,
        COALESCE(b.weight, bj.weight, bd.weight, bb.weight, br.weight) AS Berat,
        s.amount AS Amount,
        tr.id_barang_ckr,
        tr.id_barang_bks,
        tr.id_barang_jkt,
        tr.id_barang_dpk,
        tr.id_barang_tgr,
        tr.id_barang_bgr
    FROM trans tr
    LEFT JOIN cost2cost.customer c ON tr.id_cust = c.id
    LEFT JOIN cost2cost.service s ON tr.id_service = s.id
    LEFT JOIN cost2cost.barang b ON tr.id_barang_ckr = b.id
    LEFT JOIN cost2cost.barang_bks bb ON tr.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON tr.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON tr.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_tgr bt ON tr.id_barang_tgr = bt.id
    LEFT JOIN cost2cost.barang_bgr br ON tr.id_barang_bgr = br.id
    WHERE tr.id_barang_tgr = 0
    AND tr.tujuan ="TANGGERANG"
    AND MONTH(tr.tanggal) = MONTH(CURDATE())
    AND YEAR(tr.tanggal) = YEAR(CURDATE())
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCObgr` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        c.id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        tr.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.trans tr
    INNER JOIN 
        cost2cost.customer c ON tr.id_cust = c.id
    INNER JOIN
        cost2cost.barang_bgr b ON tr.id_barang_bgr = b.id
    INNER JOIN
        cost2cost.service s ON tr.id_service = s.id
    WHERE tr.id_barang_bgr <> 0
    AND MONTH(tr.tanggal) = MONTH(CURDATE())
    AND YEAR(tr.tanggal) = YEAR(CURDATE())
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCObks` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        tr.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.trans tr
    INNER JOIN 
        cost2cost.customer c ON tr.id_cust = c.id
    INNER JOIN
        cost2cost.barang_bks b ON tr.id_barang_bks = b.id
    INNER JOIN
        cost2cost.service s ON tr.id_service = s.id
    WHERE tr.id_barang_bks <> 0
    AND MONTH(tr.tanggal) = MONTH(CURDATE())
    AND YEAR(tr.tanggal) = YEAR(CURDATE())
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCOckr` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        tr.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.trans tr
    INNER JOIN 
        cost2cost.customer c ON tr.id_cust = c.id
    INNER JOIN
        cost2cost.barang b ON tr.id_barang_ckr = b.id
    INNER JOIN
        cost2cost.service s ON tr.id_service = s.id
    WHERE tr.id_barang_ckr <> 0
    AND MONTH(tr.tanggal) = MONTH(CURDATE())
    AND YEAR(tr.tanggal) = YEAR(CURDATE())
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCOdpk` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        tr.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.trans tr
    INNER JOIN 
        cost2cost.customer c ON tr.id_cust = c.id
    INNER JOIN
        cost2cost.barang_dpk b ON tr.id_barang_dpk = b.id
    INNER JOIN
        cost2cost.service s ON tr.id_service = s.id
    WHERE tr.id_barang_dpk <> 0
    AND MONTH(tr.tanggal) = MONTH(CURDATE())
    AND YEAR(tr.tanggal) = YEAR(CURDATE())
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCOjkt` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        tr.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.trans tr
    INNER JOIN 
        cost2cost.customer c ON tr.id_cust = c.id
    INNER JOIN
        cost2cost.barang_jkt b ON tr.id_barang_jkt = b.id
    INNER JOIN
        cost2cost.service s ON tr.id_service = s.id
    WHERE tr.id_barang_jkt <> 0
    AND MONTH(tr.tanggal) = MONTH(CURDATE())
    AND YEAR(tr.tanggal) = YEAR(CURDATE())
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDCOtgr` (IN `start` INT, IN `limit` INT)   BEGIN
    SELECT
        c.id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        tr.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.trans tr
    INNER JOIN 
        cost2cost.customer c ON tr.id_cust = c.id
    INNER JOIN
        cost2cost.barang_tgr b ON tr.id_barang_tgr = b.id
    INNER JOIN
        cost2cost.service s ON tr.id_service = s.id
    WHERE tr.id_barang_tgr <> 0
    AND MONTH(tr.tanggal) = MONTH(CURDATE())
    AND YEAR(tr.tanggal) = YEAR(CURDATE())
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFilteredDatabgr` (IN `start` INT, IN `limit` INT, IN `destination` VARCHAR(255), IN `startDate` DATE, IN `endDate` DATE)   BEGIN
    SELECT
        c.id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        tr.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.trans tr
    INNER JOIN
        cost2cost.customer c ON tr.id_cust = c.id
    INNER JOIN
        cost2cost.barang_bgr b ON tr.id_barang_bgr = b.id
    INNER JOIN
        cost2cost.service s ON tr.id_service = s.id
    WHERE tr.id_barang_bgr <> 0
    AND (tujuan LIKE CONCAT('%', destination, '%') OR destination = '')
    AND (tr.tanggal BETWEEN startDate AND endDate OR (startDate = '' AND endDate = ''))
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFilteredDatabks` (IN `start` INT, IN `limit` INT, IN `destination` VARCHAR(255), IN `startDate` DATE, IN `endDate` DATE)   BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        tr.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.trans tr
    INNER JOIN
        cost2cost.customer c ON tr.id_cust = c.id
    INNER JOIN
        cost2cost.barang_bks b ON tr.id_barang_bks = b.id
    INNER JOIN
        cost2cost.service s ON tr.id_service = s.id
    WHERE tr.id_barang_bks <> 0
    AND (tujuan LIKE CONCAT('%', destination, '%') OR destination = '')
    AND (tr.tanggal BETWEEN startDate AND endDate OR (startDate = '' AND endDate = ''))
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFilteredDatackr` (IN `start` INT, IN `limit` INT, IN `destination` VARCHAR(255), IN `startDate` DATE, IN `endDate` DATE)   BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        tr.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.trans tr
    INNER JOIN
        cost2cost.customer c ON tr.id_cust = c.id
    INNER JOIN
        cost2cost.barang b ON tr.id_barang_ckr = b.id
    INNER JOIN
        cost2cost.service s ON tr.id_service = s.id
    WHERE tr.id_barang_ckr <> 0
    AND (tujuan LIKE CONCAT('%', destination, '%') OR destination = '')
    AND (tr.tanggal BETWEEN startDate AND endDate OR (startDate = '' AND endDate = ''))
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFilteredDatadpk` (IN `start` INT, IN `limit` INT, IN `destination` VARCHAR(255), IN `startDate` DATE, IN `endDate` DATE)   BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        tr.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.trans tr
    INNER JOIN
        cost2cost.customer c ON tr.id_cust = c.id
    INNER JOIN
        cost2cost.barang_dpk b ON tr.id_barang_dpk = b.id
    INNER JOIN
        cost2cost.service s ON tr.id_service = s.id
    WHERE tr.id_barang_dpk <> 0
    AND (tujuan LIKE CONCAT('%', destination, '%') OR destination = '')
    AND (tr.tanggal BETWEEN startDate AND endDate OR (startDate = '' AND endDate = ''))
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFilteredDatajkt` (IN `start` INT, IN `limit` INT, IN `destination` VARCHAR(255), IN `startDate` DATE, IN `endDate` DATE)   BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        tr.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.trans tr
    INNER JOIN
        cost2cost.customer c ON tr.id_cust = c.id
    INNER JOIN
        cost2cost.barang_jkt b ON tr.id_barang_jkt = b.id
    INNER JOIN
        cost2cost.service s ON tr.id_service = s.id
    WHERE tr.id_barang_jkt <> 0
    AND (tujuan LIKE CONCAT('%', destination, '%') OR destination = '')
    AND (tr.tanggal BETWEEN startDate AND endDate OR (startDate = '' AND endDate = ''))
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFilteredDatatgr` (IN `start` INT, IN `limit` INT, IN `destination` VARCHAR(255), IN `startDate` DATE, IN `endDate` DATE)   BEGIN
    SELECT
        c.id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        b.qty AS Kuantitas,
        b.weight AS Berat,
        tr.tujuan AS Tujuan,
        s.amount AS Amount
    FROM
        cost2cost.trans tr
    INNER JOIN
        cost2cost.customer c ON tr.id_cust = c.id
    INNER JOIN
        cost2cost.barang_tgr b ON tr.id_barang_tgr = b.id
    INNER JOIN
        cost2cost.service s ON tr.id_service = s.id
    WHERE tr.id_barang_tgr <> 0
    AND (tujuan LIKE CONCAT('%', destination, '%') OR destination = '')
    AND (tr.tanggal BETWEEN startDate AND endDate OR (startDate = '' AND endDate = ''))
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFilteredDCIbgr` (IN `start` INT, IN `limit` INT, IN `startDate` DATE, IN `endDate` DATE)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(b.origin, bj.origin, bd.origin, bb.origin, bt.origin) AS Origin,
        COALESCE(b.code, bj.code, bd.code, bb.code, bt.code) AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        tr.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(b.QTY, bj.QTY, bd.QTY, bb.QTY, bt.QTY) AS Kuantitas,
        COALESCE(b.weight, bj.weight, bd.weight, bb.weight, bt.weight) AS Berat,
        s.amount AS Amount,
        tr.id_barang_ckr,
        tr.id_barang_bks,
        tr.id_barang_jkt,
        tr.id_barang_dpk,
        tr.id_barang_tgr
    FROM trans tr
    LEFT JOIN cost2cost.customer c ON tr.id_cust = c.id
    LEFT JOIN cost2cost.service s ON tr.id_service = s.id
    LEFT JOIN cost2cost.barang b ON tr.id_barang_ckr = b.id
    LEFT JOIN cost2cost.barang_bks bb ON tr.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON tr.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON tr.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_tgr bt ON tr.id_barang_tgr = bt.id
    WHERE tr.id_barang_bgr = 0
    AND tr.tujuan ="BOGOR"
	AND (startDate IS NULL OR endDate IS NULL OR tr.tanggal BETWEEN startDate AND endDate)
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFilteredDCIbks` (IN `start` INT, IN `limit` INT, IN `startDate` DATE, IN `endDate` DATE)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(b.origin, bj.origin, bd.origin, br.origin, bt.origin) AS Origin,
        COALESCE(b.code, bj.code, bd.code, br.code, bt.code) AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        tr.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(b.QTY, bj.QTY, bd.QTY, br.QTY, bt.QTY) AS Kuantitas,
        COALESCE(b.weight, bj.weight, bd.weight, br.weight, bt.weight) AS Berat,
        s.amount AS Amount,
        tr.id_barang_ckr,
        tr.id_barang_bks,
        tr.id_barang_jkt,
        tr.id_barang_dpk,
        tr.id_barang_bgr,
        tr.id_barang_tgr
    FROM trans tr
    LEFT JOIN cost2cost.customer c ON tr.id_cust = c.id
    LEFT JOIN cost2cost.service s ON tr.id_service = s.id
    LEFT JOIN cost2cost.barang b ON tr.id_barang_ckr = b.id
    LEFT JOIN cost2cost.barang_bks bb ON tr.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON tr.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON tr.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_bgr br ON tr.id_barang_bgr = br.id
    LEFT JOIN cost2cost.barang_tgr bt ON tr.id_barang_tgr = bt.id
    WHERE tr.id_barang_bks = 0
    AND tr.tujuan ="BEKASI"
    -- Handle the date filter correctly
	AND (startDate IS NULL OR endDate IS NULL OR tr.tanggal BETWEEN startDate AND endDate)
	ORDER BY
	tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFilteredDCIckr` (IN `start` INT, IN `limit` INT, IN `startDate` DATE, IN `endDate` DATE)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(bb.origin, bj.origin, bd.origin, br.origin, bt.origin) AS Origin,
        COALESCE(bb.code, bj.code, bd.code, br.code, bt.code) AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        tr.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(bb.QTY, bj.QTY, bd.QTY, br.QTY, bt.QTY) AS Kuantitas,
        COALESCE(bb.weight, bj.weight, bd.weight, br.weight, bt.weight) AS Berat,
        s.amount AS Amount,
        tr.id_barang_ckr,
        tr.id_barang_bks,
        tr.id_barang_jkt,
        tr.id_barang_dpk,
        tr.id_barang_bgr,
        tr.id_barang_tgr
    FROM trans tr
    LEFT JOIN cost2cost.customer c ON tr.id_cust = c.id
    LEFT JOIN cost2cost.service s ON tr.id_service = s.id
    LEFT JOIN cost2cost.barang b ON tr.id_barang_ckr = b.id
    LEFT JOIN cost2cost.barang_bks bb ON tr.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON tr.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON tr.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_bgr br ON tr.id_barang_bgr = br.id
    LEFT JOIN cost2cost.barang_tgr bt ON tr.id_barang_tgr = bt.id
    WHERE tr.id_barang_ckr = 0
    AND tr.tujuan ="CIKARANG"
        -- Handle the date filter correctly
        AND (startDate IS NULL OR endDate IS NULL OR tr.tanggal BETWEEN startDate AND endDate)
        ORDER BY
        tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFilteredDCIdpk` (IN `start` INT, IN `limit` INT, IN `startDate` DATE, IN `endDate` DATE)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(bb.origin, bj.origin, b.origin, br.origin, bt.origin) AS Origin,
        COALESCE(bb.code, bj.code, b.code, br.code, bt.code) AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        tr.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(bb.QTY, bj.QTY, b.QTY, br.QTY, bt.QTY) AS Kuantitas,
        COALESCE(bb.weight, bj.weight, b.weight, br.weight, bt.weight) AS Berat,
        s.amount AS Amount,
        tr.id_barang_ckr,
        tr.id_barang_bks,
        tr.id_barang_jkt,
        tr.id_barang_dpk,
        tr.id_barang_bgr,
        tr.id_barang_tgr
    FROM trans tr
    LEFT JOIN cost2cost.customer c ON tr.id_cust = c.id
    LEFT JOIN cost2cost.service s ON tr.id_service = s.id
    LEFT JOIN cost2cost.barang b ON tr.id_barang_ckr = b.id
    LEFT JOIN cost2cost.barang_bks bb ON tr.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON tr.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON tr.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_bgr br ON tr.id_barang_bgr = br.id
    LEFT JOIN cost2cost.barang_tgr bt ON tr.id_barang_tgr = bt.id
    WHERE tr.id_barang_dpk = 0
    AND tr.tujuan ="DEPOK"
    -- Handle the date filter correctly
	AND (startDate IS NULL OR endDate IS NULL OR tr.tanggal BETWEEN startDate AND endDate)
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFilteredDCIjkt` (IN `start` INT, IN `limit` INT, IN `startDate` DATE, IN `endDate` DATE)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(bb.origin, b.origin, bd.origin, br.origin, bt.origin) AS Origin,
        COALESCE(bb.code, b.code, bd.code, br.code, bt.code) AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        tr.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(bb.QTY, b.QTY, bd.QTY, br.QTY, bt.QTY) AS Kuantitas,
        COALESCE(bb.weight, b.weight, bd.weight, br.weight, bt.weight) AS Berat,
        s.amount AS Amount,
        tr.id_barang_ckr,
        tr.id_barang_bks,
        tr.id_barang_jkt,
        tr.id_barang_dpk,
        tr.id_barang_bgr,
        tr.id_barang_tgr
    FROM trans tr
    LEFT JOIN cost2cost.customer c ON tr.id_cust = c.id
    LEFT JOIN cost2cost.service s ON tr.id_service = s.id
    LEFT JOIN cost2cost.barang b ON tr.id_barang_ckr = b.id
    LEFT JOIN cost2cost.barang_bks bb ON tr.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON tr.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON tr.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_bgr br ON tr.id_barang_bgr = br.id
    LEFT JOIN cost2cost.barang_tgr bt ON tr.id_barang_tgr = bt.id
    WHERE tr.id_barang_jkt = 0
    AND tr.tujuan ="JAKARTA"
    -- Handle the date filter correctly
	AND (startDate IS NULL OR endDate IS NULL OR tr.tanggal BETWEEN startDate AND endDate)
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFilteredDCItgr` (IN `start` INT, IN `limit` INT, IN `startDate` DATE, IN `endDate` DATE)   BEGIN
    SELECT
        s.nama AS Service,
        COALESCE(b.origin, bj.origin, bd.origin, bb.origin, br.origin) AS Origin,
        COALESCE(b.code, bj.code, bd.code, bb.code, br.code) AS Kode,
        tr.kode_trans,
        tr.tanggal AS Tanggal,
        tr.tujuan AS Tujuan,
        c.nama_pengirim AS Pengirim,
        c.nama_penerima AS Penerima,
        COALESCE(b.QTY, bj.QTY, bd.QTY, bb.QTY, br.QTY) AS Kuantitas,
        COALESCE(b.weight, bj.weight, bd.weight, bb.weight, br.weight) AS Berat,
        s.amount AS Amount,
        tr.id_barang_ckr,
        tr.id_barang_bks,
        tr.id_barang_jkt,
        tr.id_barang_dpk,
        tr.id_barang_tgr,
        tr.id_barang_bgr
    FROM trans tr
    LEFT JOIN cost2cost.customer c ON tr.id_cust = c.id
    LEFT JOIN cost2cost.service s ON tr.id_service = s.id
    LEFT JOIN cost2cost.barang b ON tr.id_barang_ckr = b.id
    LEFT JOIN cost2cost.barang_bks bb ON tr.id_barang_bks = bb.id
    LEFT JOIN cost2cost.barang_jkt bj ON tr.id_barang_jkt = bj.id
    LEFT JOIN cost2cost.barang_dpk bd ON tr.id_barang_dpk = bd.id
    LEFT JOIN cost2cost.barang_tgr bt ON tr.id_barang_tgr = bt.id
    LEFT JOIN cost2cost.barang_bgr br ON tr.id_barang_bgr = br.id
    WHERE tr.id_barang_tgr = 0
    AND tr.tujuan ="TANGGERANG"
	AND (startDate IS NULL OR endDate IS NULL OR tr.tanggal BETWEEN startDate AND endDate)
    ORDER BY tr.tanggal ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertBgr` (IN `in_tujuan` VARCHAR(50), IN `in_pengirim` VARCHAR(255), IN `in_penerima` VARCHAR(255), IN `in_tlp_pengirim` VARCHAR(13), IN `in_tlp_penerima` VARCHAR(13), IN `in_almt_pengirim` TEXT, IN `in_almt_penerima` TEXT, IN `in_service` VARCHAR(50), IN `in_tipe_barang` VARCHAR(50), IN `in_qty` INT, IN `in_weight` INT)   BEGIN
    DECLARE last_inserted_id INT;
    DECLARE last_cust_id INT;

    -- Insert data into the barang bogor table
    INSERT INTO cost2cost.barang_bgr(type, qty, weight)
    VALUES(in_tipe_barang, in_qty, in_weight);

    -- Get the last inserted id for id_barang
    SET last_inserted_id = LAST_INSERT_ID();

    -- Insert data into the customer table
    INSERT INTO cost2cost.customer(nama_pengirim, nama_penerima, tlp_pengirim, tlp_penerima,
    alamat_pengirim, alamat_penerima)
    VALUES( in_pengirim, in_penerima, in_tlp_pengirim, in_tlp_penerima,
    in_almt_pengirim, in_almt_penerima);

    -- Get the last inserted customer id
    SET last_cust_id = LAST_INSERT_ID();

    -- Insert data into trans table
    INSERT INTO cost2cost.trans(tujuan, tanggal, id_cust, id_barang_bgr, id_service)
    VALUES(in_tujuan, NOW(), last_cust_id, last_inserted_id, in_service);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertBks` (IN `in_tujuan` VARCHAR(50), IN `in_pengirim` VARCHAR(255), IN `in_penerima` VARCHAR(255), IN `in_tlp_pengirim` VARCHAR(13), IN `in_tlp_penerima` VARCHAR(13), IN `in_almt_pengirim` TEXT, IN `in_almt_penerima` TEXT, IN `in_service` VARCHAR(50), IN `in_tipe_barang` VARCHAR(50), IN `in_qty` INT, IN `in_weight` INT)   BEGIN
    DECLARE last_inserted_id INT;
    DECLARE last_cust_id INT;

    -- Insert data into the barang bekasi table
    INSERT INTO cost2cost.barang_bks(type, qty, weight)
    VALUES(in_tipe_barang, in_qty, in_weight);

    -- Get the last inserted id for id_barang
    SET last_inserted_id = LAST_INSERT_ID();

    -- Insert data into the customer table
    INSERT INTO cost2cost.customer(nama_pengirim, nama_penerima, tlp_pengirim, tlp_penerima,
    alamat_pengirim, alamat_penerima)
    VALUES( in_pengirim, in_penerima, in_tlp_pengirim, in_tlp_penerima,
    in_almt_pengirim, in_almt_penerima);

    -- Get the last inserted customer id
    SET last_cust_id = LAST_INSERT_ID();

    -- Insert data into trans table
    INSERT INTO cost2cost.trans(tujuan, tanggal, id_cust, id_barang_bks, id_service)
    VALUES(in_tujuan, NOW(), last_cust_id, last_inserted_id, in_service);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCkr` (IN `in_tujuan` VARCHAR(50), IN `in_pengirim` VARCHAR(255), IN `in_penerima` VARCHAR(255), IN `in_tlp_pengirim` VARCHAR(13), IN `in_tlp_penerima` VARCHAR(13), IN `in_almt_pengirim` TEXT, IN `in_almt_penerima` TEXT, IN `in_service` VARCHAR(50), IN `in_tipe_barang` VARCHAR(50), IN `in_qty` INT, IN `in_weight` INT)   BEGIN
    DECLARE last_inserted_id INT;
    DECLARE last_cust_id INT;

    -- Insert data into the barang cikarang table
    INSERT INTO cost2cost.barang(type, qty, weight)
    VALUES(in_tipe_barang, in_qty, in_weight);

    -- Get the last inserted id for id_barang
    SET last_inserted_id = LAST_INSERT_ID();

    -- Insert data into the customer table
    INSERT INTO cost2cost.customer(nama_pengirim, nama_penerima, tlp_pengirim, tlp_penerima,
    alamat_pengirim, alamat_penerima)
    VALUES( in_pengirim, in_penerima, in_tlp_pengirim, in_tlp_penerima,
    in_almt_pengirim, in_almt_penerima);

    -- Get the last inserted customer id
    SET last_cust_id = LAST_INSERT_ID();

    -- Insert data into trans table
    INSERT INTO cost2cost.trans(tujuan, tanggal, id_cust, id_barang_ckr, id_service)
    VALUES(in_tujuan, NOW(), last_cust_id, last_inserted_id, in_service);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertDpk` (IN `in_tujuan` VARCHAR(50), IN `in_pengirim` VARCHAR(255), IN `in_penerima` VARCHAR(255), IN `in_tlp_pengirim` VARCHAR(13), IN `in_tlp_penerima` VARCHAR(13), IN `in_almt_pengirim` TEXT, IN `in_almt_penerima` TEXT, IN `in_service` VARCHAR(50), IN `in_tipe_barang` VARCHAR(50), IN `in_qty` INT, IN `in_weight` INT)   BEGIN
    DECLARE last_inserted_id INT;
    DECLARE last_cust_id INT;

    -- Insert data into the barang depok table
    INSERT INTO cost2cost.barang_dpk(type, qty, weight)
    VALUES(in_tipe_barang, in_qty, in_weight);

    -- Get the last inserted id for id_barang
    SET last_inserted_id = LAST_INSERT_ID();

    -- Insert data into the customer table
    INSERT INTO cost2cost.customer(nama_pengirim, nama_penerima, tlp_pengirim, tlp_penerima,
    alamat_pengirim, alamat_penerima)
    VALUES( in_pengirim, in_penerima, in_tlp_pengirim, in_tlp_penerima,
    in_almt_pengirim, in_almt_penerima);

    -- Get the last inserted customer id
    SET last_cust_id = LAST_INSERT_ID();

    -- Insert data into trans table
    INSERT INTO cost2cost.trans(tujuan, tanggal, id_cust, id_barang_dpk, id_service)
    VALUES(in_tujuan, NOW(), last_cust_id, last_inserted_id, in_service);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertJkt` (IN `in_tujuan` VARCHAR(50), IN `in_pengirim` VARCHAR(255), IN `in_penerima` VARCHAR(255), IN `in_tlp_pengirim` VARCHAR(13), IN `in_tlp_penerima` VARCHAR(13), IN `in_almt_pengirim` TEXT, IN `in_almt_penerima` TEXT, IN `in_service` VARCHAR(50), IN `in_tipe_barang` VARCHAR(50), IN `in_qty` INT, IN `in_weight` INT)   BEGIN
    DECLARE last_inserted_id INT;
    DECLARE last_cust_id INT;

    -- Insert data into the barang jakarta table
    INSERT INTO cost2cost.barang_jkt(type, qty, weight)
    VALUES(in_tipe_barang, in_qty, in_weight);

    -- Get the last inserted id for id_barang
    SET last_inserted_id = LAST_INSERT_ID();

    -- Insert data into the customer table
    INSERT INTO cost2cost.customer(nama_pengirim, nama_penerima, tlp_pengirim, tlp_penerima,
    alamat_pengirim, alamat_penerima)
    VALUES( in_pengirim, in_penerima, in_tlp_pengirim, in_tlp_penerima,
    in_almt_pengirim, in_almt_penerima);

    -- Get the last inserted customer id
    SET last_cust_id = LAST_INSERT_ID();

    -- Insert data into trans table
    INSERT INTO cost2cost.trans(tujuan, tanggal, id_cust, id_barang_jkt, id_service)
    VALUES(in_tujuan, NOW(), last_cust_id, last_inserted_id, in_service);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertTgr` (IN `in_tujuan` VARCHAR(50), IN `in_pengirim` VARCHAR(255), IN `in_penerima` VARCHAR(255), IN `in_tlp_pengirim` VARCHAR(13), IN `in_tlp_penerima` VARCHAR(13), IN `in_almt_pengirim` TEXT, IN `in_almt_penerima` TEXT, IN `in_service` VARCHAR(50), IN `in_tipe_barang` VARCHAR(50), IN `in_qty` INT, IN `in_weight` INT)   BEGIN
    DECLARE last_inserted_id INT;
    DECLARE last_cust_id INT;

    -- Insert data into the barang tanggerang table
    INSERT INTO cost2cost.barang_tgr(type, qty, weight)
    VALUES(in_tipe_barang, in_qty, in_weight);

    -- Get the last inserted id for id_barang
    SET last_inserted_id = LAST_INSERT_ID();

    -- Insert data into the customer table
    INSERT INTO cost2cost.customer(nama_pengirim, nama_penerima, tlp_pengirim, tlp_penerima,
    alamat_pengirim, alamat_penerima)
    VALUES( in_pengirim, in_penerima, in_tlp_pengirim, in_tlp_penerima,
    in_almt_pengirim, in_almt_penerima);

    -- Get the last inserted customer id
    SET last_cust_id = LAST_INSERT_ID();

    -- Insert data into trans table
    INSERT INTO cost2cost.trans(tujuan, tanggal, id_cust, id_barang_tgr, id_service)
    VALUES(in_tujuan, NOW(), last_cust_id, last_inserted_id, in_service);
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
(1, 'CIKARANG', 'CKR/OM/00000001', 'Makanan', 11, 2),
(2, 'CIKARANG', 'CKR/OM/00000002', 'Pakaian', 1, 1);

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
(1, 'BOGOR', 'BGR/OM/00000001', 'Makanan', 11, 2),
(2, 'BOGOR', 'BGR/OM/00000002', 'Makanan', 5, 2);

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
(1, 'BEKASI', 'BKS/OM/00000001', 'Makanan', 11, 2),
(2, 'BEKASI', 'BKS/OM/00000002', 'Doc', 2, 1);

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
(1, 'DEPOK', 'DPK/OM/00000001', 'Makanan', 1, 1),
(2, 'DEPOK', 'DPK/OM/00000002', 'Pakaian', 5, 2);

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
(1, 'JAKARTA', 'JKT/OM/00000001', 'Makanan', 11, 2),
(2, 'JAKARTA', 'JKT/OM/00000002', 'Kendaraan', 1, 100);

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
(1, 'TANGGERANG', 'TGR/OM/00000001', 'Makanan', 11, 2),
(2, 'TANGGERANG', 'TGR/OM/00000002', 'Doc', 11, 2);

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
  `nama_pengirim` varchar(255) NOT NULL,
  `nama_penerima` varchar(255) NOT NULL,
  `tlp_pengirim` varchar(13) NOT NULL,
  `tlp_penerima` varchar(13) NOT NULL,
  `alamat_pengirim` text NOT NULL,
  `alamat_penerima` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `nama_pengirim`, `nama_penerima`, `tlp_pengirim`, `tlp_penerima`, `alamat_pengirim`, `alamat_penerima`) VALUES
(1, 'Septi', 'Samsudin', '0987651232', '1092876521', 'Wakanda', 'Jakarta'),
(2, 'Amimir', 'Gufron', '0812356768', '1092876521', 'Wakanda', 'Bogor'),
(3, 'Udin', 'Jamal', '0987651232', '1092876521', 'Wakanda', 'Jakarta'),
(4, 'Septi', 'Samsudin', '0987651232', '1092876521', 'Wakanda', 'Bogor'),
(5, 'Udin', 'Gufron', '0987651232', '1092876521', 'Wakanda', 'Bekasi'),
(6, 'Septi', 'Udin', '0987651232', '1092876521', 'Wakanda', 'Cikarang'),
(7, 'Testing1q', 'Testing2', '0823657813', '0898654321', 'dhbakdjl; c', 'wl,kmcdjnvh jbnm'),
(8, 'Zaidaan', 'Mamat', '0823657813', '0898654321', 'dwfedvsfaw', 'egrfdghbghb jnk'),
(9, 'Amimir', 'Nabil', '0823657813', '0898654321', 'dwjbdhgklibh', 'dunsyvayvuabfuwv'),
(10, 'Testing3', 'Udin', '0823657813', '0898654321', 'uygstayvduvid', 'yadbuobaibdwih'),
(11, 'Jamal', 'Testing2', '0823657813', '0898654321', 'kiadnoanoan', 'jbdauyvbaeuevbwaui'),
(12, 'Nabil', 'Mamat', '0823657813', '0898654321', ',dkmjisuahcs', 'danicbasicbaivcai');

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
(2);

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
(2);

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
(2);

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
(2);

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
(1),
(2);

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
-- Struktur dari tabel `trans`
--

CREATE TABLE `trans` (
  `id` int(11) NOT NULL,
  `kode_trans` varchar(10) NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `id_cust` int(11) NOT NULL,
  `id_barang_ckr` int(11) NOT NULL,
  `id_barang_bks` int(11) NOT NULL,
  `id_barang_jkt` int(11) NOT NULL,
  `id_barang_dpk` int(11) NOT NULL,
  `id_barang_bgr` int(11) NOT NULL,
  `id_barang_tgr` int(11) NOT NULL,
  `id_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `trans`
--

INSERT INTO `trans` (`id`, `kode_trans`, `tujuan`, `tanggal`, `id_cust`, `id_barang_ckr`, `id_barang_bks`, `id_barang_jkt`, `id_barang_dpk`, `id_barang_bgr`, `id_barang_tgr`, `id_service`) VALUES
(1, '4BBCFF5B50', 'JAKARTA', '2024-09-30', 1, 1, 0, 0, 0, 0, 0, 1),
(2, 'FE7685B890', 'DEPOK', '2024-09-30', 2, 0, 0, 0, 0, 1, 0, 2),
(3, '7B84CFCDC6', 'JAKARTA', '2024-09-30', 3, 0, 1, 0, 0, 0, 0, 3),
(4, '8A3DA7246C', 'BOGOR', '2024-09-30', 4, 0, 0, 0, 1, 0, 0, 2),
(5, '70FBF779C3', 'BEKASI', '2024-09-30', 5, 0, 0, 1, 0, 0, 0, 1),
(6, '25F5BA48B7', 'CIKARANG', '2024-09-30', 6, 0, 0, 0, 0, 0, 1, 3),
(7, 'BD01E2D1EE', 'BEKASI', '2024-10-01', 7, 2, 0, 0, 0, 0, 0, 1),
(8, 'BBD777DD73', 'CIKARANG', '2024-10-01', 8, 0, 2, 0, 0, 0, 0, 2),
(9, 'FB2AFE47A1', 'DEPOK', '2024-10-01', 9, 0, 0, 2, 0, 0, 0, 2),
(10, 'B7819EF4E6', 'JAKARTA', '2024-10-01', 10, 0, 0, 0, 2, 0, 0, 3),
(11, 'AE851ECB03', 'TANGGERANG', '2024-10-01', 11, 0, 0, 0, 0, 2, 0, 1),
(12, '6391BDF8D4', 'BOGOR', '2024-10-01', 12, 0, 0, 0, 0, 0, 2, 3);

--
-- Trigger `trans`
--
DELIMITER $$
CREATE TRIGGER `before_insert_trans` BEFORE INSERT ON `trans` FOR EACH ROW BEGIN
    DECLARE new_kode_trans VARCHAR(10);
    DECLARE duplicate_check INT DEFAULT 1;

    WHILE duplicate_check > 0 DO
        -- Generate a unique 10-character alphanumeric code in uppercase
        SET new_kode_trans = UPPER(LEFT(MD5(CONCAT(RAND(), NOW())), 10));

        -- Check if the generated code already exists in the table
        SELECT COUNT(*) INTO duplicate_check
        FROM trans
        WHERE kode_trans = new_kode_trans;
    END WHILE;

    -- Set the new unique kode_trans
    SET NEW.kode_trans = new_kode_trans;
END
$$
DELIMITER ;

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
-- Indeks untuk tabel `trans`
--
ALTER TABLE `trans`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `barang_bgr`
--
ALTER TABLE `barang_bgr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `barang_bks`
--
ALTER TABLE `barang_bks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `barang_dpk`
--
ALTER TABLE `barang_dpk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `barang_jkt`
--
ALTER TABLE `barang_jkt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `barang_tgr`
--
ALTER TABLE `barang_tgr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `id_value`
--
ALTER TABLE `id_value`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `id_value_bgr`
--
ALTER TABLE `id_value_bgr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `id_value_bks`
--
ALTER TABLE `id_value_bks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `id_value_dpk`
--
ALTER TABLE `id_value_dpk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `id_value_jkt`
--
ALTER TABLE `id_value_jkt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `id_value_tgr`
--
ALTER TABLE `id_value_tgr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `trans`
--
ALTER TABLE `trans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
