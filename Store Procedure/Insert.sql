-- Insert Cikarang
CREATE PROCEDURE `cost2cost`.`InsertCkr`(
    IN in_tujuan VARCHAR(50),
    IN in_pengirim VARCHAR(255),
    IN in_penerima VARCHAR(255),
    IN in_tlp_pengirim VARCHAR(13),
    IN in_tlp_penerima VARCHAR(13),
    IN in_almt_pengirim TEXT,
    IN in_almt_penerima TEXT,
    IN in_service VARCHAR(50),
    IN in_tipe_barang VARCHAR(50),
    IN in_qty INT,
    IN in_weight INT
)
BEGIN
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
END

-- Insert Bekasi
CREATE PROCEDURE `cost2cost`.`InsertBks`(
    IN in_tujuan VARCHAR(50),
    IN in_pengirim VARCHAR(255),
    IN in_penerima VARCHAR(255),
    IN in_tlp_pengirim VARCHAR(13),
    IN in_tlp_penerima VARCHAR(13),
    IN in_almt_pengirim TEXT,
    IN in_almt_penerima TEXT,
    IN in_service VARCHAR(50),
    IN in_tipe_barang VARCHAR(50),
    IN in_qty INT,
    IN in_weight INT
)
BEGIN
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
END

-- Insert Jakarta
CREATE PROCEDURE `cost2cost`.`InsertJkt`(
    IN in_tujuan VARCHAR(50),
    IN in_pengirim VARCHAR(255),
    IN in_penerima VARCHAR(255),
    IN in_tlp_pengirim VARCHAR(13),
    IN in_tlp_penerima VARCHAR(13),
    IN in_almt_pengirim TEXT,
    IN in_almt_penerima TEXT,
    IN in_service VARCHAR(50),
    IN in_tipe_barang VARCHAR(50),
    IN in_qty INT,
    IN in_weight INT
)
BEGIN
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
END

-- Insert Depok
CREATE PROCEDURE `cost2cost`.`InsertDpk`(
    IN in_tujuan VARCHAR(50),
    IN in_pengirim VARCHAR(255),
    IN in_penerima VARCHAR(255),
    IN in_tlp_pengirim VARCHAR(13),
    IN in_tlp_penerima VARCHAR(13),
    IN in_almt_pengirim TEXT,
    IN in_almt_penerima TEXT,
    IN in_service VARCHAR(50),
    IN in_tipe_barang VARCHAR(50),
    IN in_qty INT,
    IN in_weight INT
)
BEGIN
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
END

-- Insert Bogor
CREATE PROCEDURE `cost2cost`.`InsertBgr`(
    IN in_tujuan VARCHAR(50),
    IN in_pengirim VARCHAR(255),
    IN in_penerima VARCHAR(255),
    IN in_tlp_pengirim VARCHAR(13),
    IN in_tlp_penerima VARCHAR(13),
    IN in_almt_pengirim TEXT,
    IN in_almt_penerima TEXT,
    IN in_service VARCHAR(50),
    IN in_tipe_barang VARCHAR(50),
    IN in_qty INT,
    IN in_weight INT
)
BEGIN
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
END

-- Insert Tanggerang
CREATE PROCEDURE `cost2cost`.`InsertTgr`(
    IN in_tujuan VARCHAR(50),
    IN in_pengirim VARCHAR(255),
    IN in_penerima VARCHAR(255),
    IN in_tlp_pengirim VARCHAR(13),
    IN in_tlp_penerima VARCHAR(13),
    IN in_almt_pengirim TEXT,
    IN in_almt_penerima TEXT,
    IN in_service VARCHAR(50),
    IN in_tipe_barang VARCHAR(50),
    IN in_qty INT,
    IN in_weight INT
)
BEGIN
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
END