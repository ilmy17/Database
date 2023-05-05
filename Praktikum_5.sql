
MariaDB [dbtoko1]> desc pelanggan;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode           | varchar(10) | YES  | UNI | NULL    |                |
| nama_pelanggan | varchar(50) | YES  |     | NULL    |                |
| jk             | char(1)     | YES  |     | NULL    |                |
| tmp_lahir      | varchar(30) | YES  |     | NULL    |                |
| tgl_lahir      | date        | YES  |     | NULL    |                |
| email          | varchar(45) | YES  |     | NULL    |                |
| kartu_id       | int(11)     | NO   |     | NULL    |                |
| alamat         | varchar(40) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
9 rows in set (0.014 sec)

-- Buat fungsi inputPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> delimiter $$
MariaDB [dbtoko1]> create procedure inputtpelanggan(kode varchar(10), nama_pelanggan varchar(50), jk char(1), tmp_lahir varchar(30), tgl_lahir date, email varchar(45), kartu_id int(11), alamat varchar(40))
    -> begin
    -> insert into pelanggan (kode, nama_pelanggan,jk, tmp_lahir, tgl_lahir, email, kartu_id, alamat) VALUES (kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, kartu_id, alamat);
    -> END $$
Query OK, 0 rows affected (0.010 sec)

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> call inputtpelanggan('011106','lia','P','Barru','2002-08-09', 'lia@gmail.com', 2,'benteng');
Query OK, 1 row affected (0.007 sec)




-- Buat fungsi showPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> delimiter $$
MariaDB [dbtoko1]> create procedure showpelanggan()
    -> begin
    -> select * from pelanggan;
    -> end $$
Query OK, 0 rows affected (0.010 sec)

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> call showpelanggan;
+----+--------+----------------+------+------------+------------+------------------+----------+-----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email            | kartu_id | alamat    |
+----+--------+----------------+------+------------+------------+------------------+----------+-----------+
|  1 | 011101 | Agung          | L    | BAndung    | 1997-09-06 | agung@gmail.com  |        1 | jl.landak |
|  2 | 011102 | Pandan Wangi   | L    | yogyakarta | 1998-08-07 | pandan@gmail.com |        2 | bila      |
|  3 | 011103 | ilmy           | P    | pinrang    | 1999-09-07 | ilmy@gmail.com   |        1 | landak    |
|  4 | 011104 | nurul          | P    | makassar   | 1999-10-12 | nurul@gmail.com  |        2 | banten    |
|  5 | 011105 | pia            | P    | pinrang    | 2002-02-07 | pia@gmail.com    |        1 | landak    |
|  6 | 011106 | lia            | P    | Barru      | 2002-08-09 | lia@gmail.com    |        2 | benteng   |
+----+--------+----------------+------+------------+------------+------------------+----------+-----------+
6 rows in set (0.000 sec)

Query OK, 0 rows affected (0.008 sec)

-- DESC PRODUK
MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> desc produk;
+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| id              | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode            | varchar(10) | YES  | UNI | NULL    |                |
| nama            | varchar(45) | YES  |     | NULL    |                |
| harga_beli      | double      | YES  |     | NULL    |                |
| harga_jual      | double      | YES  |     | NULL    |                |
| stok            | int(11)     | YES  |     | NULL    |                |
| min_stok        | int(11)     | YES  |     | NULL    |                |
| jenis_produk_id | int(11)     | NO   |     | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+
8 rows in set (0.011 sec)

-- Buat fungsi inputProduk(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> create procedure inputProduk(kode varchar(10), nama varchar(45), harga_beli double, harga_jual double, stok int(11), min_stok int(11), jenis_produk_id int(11))
    -> begin
    -> insert into produk(kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id) VALUES (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id);
    ->
    -> end $$
Query OK, 0 rows affected (0.009 sec)

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> call inputproduk('1117','kursi',2000000,3000000,10,8,2);
Query OK, 1 row affected (0.007 sec)

MariaDB [dbtoko1]> select * from produk;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | 1111 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  3 | 1112 | TV 21 inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | 1113 | kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  5 | 1114 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  6 | 1115 | Taro       |       4000 |       5000 |    4 |        2 |               4 |
|  7 | 1116 | Teh kotak  |       3000 |       4000 |    2 |       10 |               3 |
|  8 | 1117 | kursi      |    2000000 |    3000000 |   10 |        8 |               2 |
+----+------+------------+------------+------------+------+----------+-----------------+
7 rows in set (0.000 sec)


-- Buat fungsi showProduk(), setelah itu panggil fungsinya

MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> create procedure showproduk()
    -> begin
    -> select * from produk;
    -> end $$
Query OK, 0 rows affected (0.009 sec)

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> call showproduk;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | 1111 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  3 | 1112 | TV 21 inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | 1113 | kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  5 | 1114 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  6 | 1115 | Taro       |       4000 |       5000 |    4 |        2 |               4 |
|  7 | 1116 | Teh kotak  |       3000 |       4000 |    2 |       10 |               3 |
|  8 | 1117 | kursi      |    2000000 |    3000000 |   10 |        8 |               2 |
+----+------+------------+------------+------------+------+----------+-----------------+
7 rows in set (0.000 sec)
Query OK, 0 rows affected (0.006 sec)


-- Buat fungsi totalPesanan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> delimiter $$
MariaDB [dbtoko1]> create procedure totallpesanan()
    -> begin
    -> declare total_pesanan decimal (10,2);
    -> select SUM(total) into total_pesanan FROM pesanan;
    -> select total_pesanan;
    -> end $$
Query OK, 0 rows affected (0.009 sec)

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> call totallpesanan();
+---------------+
| total_pesanan |
+---------------+
|     530000.00 |
+---------------+
1 row in set (0.000 sec)
Query OK, 1 row affected (0.001 sec)


-- Tampilkan seluruh pesanan dari semua pelanggan
MariaDB [dbtoko1]> delimiter $$
MariaDB [dbtoko1]>
MariaDB [dbtoko1]> create procedure seluruhpesanan()
    -> begin
    -> select pesanan.tanggal, pelanggan.nama_pelanggan, pesanan.total
    -> from pesanan inner join pelaggan on pesanan.pelanggan_id = pelanggan.id;
    -> end $$
Query OK, 0 rows affected (0.010 sec)

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> call seluruhpesanan();
+---------------+
| total_pesanan |
+---------------+
|     530000.00 |
+---------------+
1 row in set (0.001 sec)
Query OK, 1 row affected (0.003 sec)


-- buatkan query panjang di atas menjadi sebuah view baru: pesanan_produk_vw (menggunakan join dari table pesanan,pelanggan dan produk)
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> select pesanan.id, pesanan.tanggal, pesanan.total, pelanggan.nama_pelanggan, pelanggan.jk, pelanggan.email, produk.nama AS nama_produk, produk.harga_jual
    -> from pesanan
    -> inner join pelanggan ON pesanan.pelanggan_id = pelanggan.id
    -> inner join pesanan_items ON pesanan.id = pesanan_items.pesanan_id
    -> inner join produk ON pesanan_items.produk_id  = produk.id;
    -> end $$
Empty set (0.001 sec)

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> select * from pesanan_produk_vw;
Empty set (0.001 sec)
