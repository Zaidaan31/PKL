-- Cikarang
CREATE PROCEDURE `GetFilteredDCIckr`(
    IN start INT,
    IN `limit` INT,
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
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
        -- Handle the date filter correctly
        AND (startDate IS NULL OR endDate IS NULL OR tr.tanggal BETWEEN startDate AND endDate)
        ORDER BY
        tr.tanggal ASC;
END

-- Bekasi
CREATE PROCEDURE `GetFilteredDCIbks`(
    IN start INT,
    IN `limit` INT,
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
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
    -- Handle the date filter correctly
	AND (startDate IS NULL OR endDate IS NULL OR tr.tanggal BETWEEN startDate AND endDate)
	ORDER BY
	tr.tanggal ASC;
END

-- Bogor
CREATE PROCEDURE `GetFilteredDCIbgr`(
    IN start INT,
    IN `limit` INT,
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
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
	AND (startDate IS NULL OR endDate IS NULL OR tr.tanggal BETWEEN startDate AND endDate)
    ORDER BY tr.tanggal ASC;
END

-- Depok
CREATE PROCEDURE `GetFilteredDCIdpk`(
    IN start INT,
    IN `limit` INT,
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
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
    -- Handle the date filter correctly
	AND (startDate IS NULL OR endDate IS NULL OR tr.tanggal BETWEEN startDate AND endDate)
    ORDER BY tr.tanggal ASC;
END

-- Jakarta
CREATE PROCEDURE `GetFilteredDCIjkt`(
    IN start INT,
    IN `limit` INT,
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
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
    -- Handle the date filter correctly
	AND (startDate IS NULL OR endDate IS NULL OR tr.tanggal BETWEEN startDate AND endDate)
    ORDER BY tr.tanggal ASC;
END

-- Tanggerang
CREATE PROCEDURE `GetFilteredDCItgr`(
    IN start INT,
    IN `limit` INT,
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
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
	AND (startDate IS NULL OR endDate IS NULL OR tr.tanggal BETWEEN startDate AND endDate)
    ORDER BY tr.tanggal ASC;
END