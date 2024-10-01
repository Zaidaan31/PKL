-- Cikarang
CREATE PROCEDURE `GetFilteredDatackr`(
    IN start INT,
    IN `limit` INT,
    IN destination VARCHAR(255),
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
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
    AND (tujuan LIKE CONCAT('%', destination, '%') OR destination = '')
    AND (tr.tanggal BETWEEN startDate AND endDate OR (startDate = '' AND endDate = ''))
    ORDER BY tr.tanggal ASC;
END

-- Bekasi
CREATE PROCEDURE `GetFilteredDatabks`(
    IN start INT,
    IN `limit` INT,
    IN destination VARCHAR(255),
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
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
    AND (tujuan LIKE CONCAT('%', destination, '%') OR destination = '')
    AND (tr.tanggal BETWEEN startDate AND endDate OR (startDate = '' AND endDate = ''))
    ORDER BY tr.tanggal ASC;
END

-- Bogor
CREATE PROCEDURE `GetFilteredDatabgr`(
    IN start INT,
    IN `limit` INT,
    IN destination VARCHAR(255),
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    SELECT
        c.id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
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
    AND (tujuan LIKE CONCAT('%', destination, '%') OR destination = '')
    AND (tr.tanggal BETWEEN startDate AND endDate OR (startDate = '' AND endDate = ''))
    ORDER BY tr.tanggal ASC;
END

-- Depok
CREATE PROCEDURE `GetFilteredDatadpk`(
    IN start INT,
    IN `limit` INT,
    IN destination VARCHAR(255),
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
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
    AND (tujuan LIKE CONCAT('%', destination, '%') OR destination = '')
    AND (tr.tanggal BETWEEN startDate AND endDate OR (startDate = '' AND endDate = ''))
    ORDER BY tr.tanggal ASC;
END

-- Jakarta
CREATE PROCEDURE `GetFilteredDatajkt`(
    IN start INT,
    IN `limit` INT,
    IN destination VARCHAR(255),
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    SELECT
        c.id AS id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
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
    AND (tujuan LIKE CONCAT('%', destination, '%') OR destination = '')
    AND (tr.tanggal BETWEEN startDate AND endDate OR (startDate = '' AND endDate = ''))
    ORDER BY tr.tanggal ASC;
END

-- Tanggerang
CREATE PROCEDURE `GetFilteredDatatgr`(
    IN start INT,
    IN `limit` INT,
    IN destination VARCHAR(255),
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    SELECT
        c.id,
        s.nama AS Service,
        b.origin AS Origin,
        b.code AS Kode,
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
    AND (tujuan LIKE CONCAT('%', destination, '%') OR destination = '')
    AND (tr.tanggal BETWEEN startDate AND endDate OR (startDate = '' AND endDate = ''))
    ORDER BY tr.tanggal ASC;
END