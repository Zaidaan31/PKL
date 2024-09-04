-- DCO Cikarang
BEGIN
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
END

-- DCO Bekasi
BEGIN
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
END

-- DCO Jakarta
BEGIN
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
END

-- DCO Depok
BEGIN
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
END

-- DCO Bogor
BEGIN
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
END

-- DCO Tanggerang
BEGIN
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
END