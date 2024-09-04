-- DCI Cikarang
BEGIN
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
END

-- DCI Bekasi
BEGIN
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
END

-- DCI Jakarta
BEGIN
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
END

-- DCI Depok
BEGIN
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
END

-- DCI Bogor
BEGIN
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
END

-- DCI Tanggerang
BEGIN
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
END