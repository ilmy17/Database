MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE ubah_status_pembayaran(IN id_pesanan INT, IN status_baru Varchar(20))
    -> BEGIN
    -> DECLARE total_bayar DECIMAL(10,2);
    -> DECLARE total_pesanan DECIMAL(10,2);
    ->
    -> SELECT total INTO total_pesanan FROM pesanan WHERE id = id_pesanan;
    -> SELECT SUM(jumlah_bayar) INTO total_bayar FROM pemabayaran WHERE pesanan_iid = id_pesanan;
    -> IF total_bayar >= total_pesanan THEN
    -> UPDATE pemabayaran SET status_pembayaran = 'belumlunas' WHERE pesanan_id = id_pesanan;
    -> END IF;
    -> IF status_baru IS NOT NULL THEN
    -> UPDATE pembayaran SET status_pembayaran = status_baru WHERE pesanan_id = id_pesanan;
    -> END IF;
    -> END
    -> $$
Query OK, 0 rows affected (0.012 sec)

MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE TRIGGER trigger_pesanan_after_insert AFTER INSERT ON pesanan
    -> FOR EACH ROW
    -> BEGIN
    -> DECLARE jumlah_bayar INT
    -> ;
    -> DECLARE jumlah_pemesanan INT;
    -> DECLARE total_pesanan DECIMAL(10,2);
    -> SELECT COUNT(*) INTO jumlah_pesanan FROM pesanan WHERE pelanggan_id = NEW.pelanggan_id AND id <= NEW.id;
    -> SELECT total INTO total_pesanan FROM pesanan WHERE id = NEW.id;
    -> IF total_pesanan = 0 THEN
    -> SET jumlah_bayar = 0;
    -> ELSE
    -> SET jumlah_bayar = NEW.total;
    -> END IF;
    -> INSERT INTO (nokuitasnsi, tanggal, jumlah_bayar, jumlah_pemesanan, pesanan_id, status_pemabayaran)
    -> VALUES (CONCAT ('INV-', new.tanggal, '-', NEW.id, '_', jumlah_pesanan), NEW.tanggal, jumlah_bayar, jumlah_pesanan, NEW.id, 'belum lunas');
    -> CALL ubah_status_pemabayaran(NEW.id, NULL);
    -> END
    -> $$