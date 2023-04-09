// masuk kedalam madiadb dengaan command prompt xampp
C:\Users\ASU TUF>cd \xampp\mysql\bin

//untuk melihat seluruh database
MariaDB [(none)]> show databases;

//membuat database baru
MariaDB [(none)]> CREATE DATABASE dbtoko;

//Menggunaka database
MariaDB [(none)]> USE dbtoko;

//Membuat Table
MariaDB [dbtoko]> CREATE TABLE kartu(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    ->
    -> nama varchar(30) NOT NULL,
    -> diskon double default 0,
    -> iuran double default 0);

MariaDB [dbtoko]> desc kartu;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| id     | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode   | varchar(10) | YES  | UNI | NULL    |                |
| nama   | varchar(30) | NO   |     | NULL    |                |
| diskon | double      | YES  |     | 0       |                |
| iuran  | double      | YES  |     | 0       |                |
+--------+-------------+------+-----+---------+----------------+
5 rows in set (0.021 sec)

//Melihat table
MariaDB [dbtoko]> show tables;

//Melihat isi table 
MariaDB [dbtoko]> desc kartu;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| id     | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode   | varchar(10) | YES  | UNI | NULL    |                |
| nama   | varchar(30) | NO   |     | NULL    |                |
| diskon | double      | YES  |     | 0       |                |
| iuran  | double      | YES  |     | 0       |                |
+--------+-------------+------+-----+---------+----------------+
5 rows in set (0.021 sec)


//(Primary Key (pembeda) = ketika kita memanggil primary key maka akan muncul data yang lain contoh memnggil stamuk 111 maka akan muncul nama, kelass dan lain-lain.)
//(uniqie = yaitu datanya tdk boleh sama dengan yang lain)
//(NULL Yes = datanya boleh kosong atau tdk diisi)
//(NULL No = Datanya tidak boleh kosong)
//(Auto_increment = untuk mengotomatis penjumalahan jenis data)

//Buat Table Pelanggan
MariaDB [dbtoko]> CREATE TABLE pelanggan(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(45),
    -> jk char(1),
    -> tmp_lahir varchar(20),
    -> tgl_lahir date,
    -> email varchar(30),
    -> kartu_id int NOT NULL references kartu(id));


// references kartu (id) (menghubungkaan tabel yang lain dan yang menjadi penghubung adalah id)
//Membuat Table pesanan
MariaDB [dbtoko]> CREATE table pesanan(
    -> id int NOT NULL auto_increment primary key,
    -> tanggal date,
    -> total double,
    ->
    -> pelanggan_id int NOT NULL references pelanggan(id));

MariaDB [dbtoko]> desc pesanan;
+--------------+---------+------+-----+---------+----------------+
| Field        | Type    | Null | Key | Default | Extra          |
+--------------+---------+------+-----+---------+----------------+
| id           | int(11) | NO   | PRI | NULL    | auto_increment |
| tanggal      | date    | YES  |     | NULL    |                |
| total        | double  | YES  |     | NULL    |                |
| pelanggan_id | int(11) | NO   |     | NULL    |                |
+--------------+---------+------+-----+---------+----------------+
4 rows in set (0.023 sec)

//Membuat table pembayaran
MariaDB [dbtoko]> create table pembayaran(
    -> id int NOT NULL auto_increment primary key,
    -> nokuitansi varchar (10) unique,
    -> tanggal date,
    -> jumlah double,
    -> ke int,
    -> pesanan_id int not null references pesanan(id));

MariaDB [dbtoko]> desc pembayaran;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| id         | int(11)     | NO   | PRI | NULL    | auto_increment |
| nokuitansi | varchar(10) | YES  | UNI | NULL    |                |
| tanggal    | date        | YES  |     | NULL    |                |
| jumlah     | double      | YES  |     | NULL    |                |
| ke         | int(11)     | YES  |     | NULL    |                |
| pesanan_id | int(11)     | NO   |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
6 rows in set (0.011 sec)

//Membuat table Jenis_produk
MariaDB [dbtoko]> create table jenis_produk(
    -> id int not null auto_increment primary key,
    -> nama varchar (45));

MariaDB [dbtoko]> desc jenis_produk;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama  | varchar(45) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
2 rows in set (0.007 sec)

//TUGAS MANDIRI
//Membuat table produk
MariaDB [dbtoko]> CREATE table produk(
    -> id int not null auto_increment primary key,
    -> kode varchar (10) unique,
    -> nama varchar (45),
    -> harga_beli double,
    -> harga_jual double,
    -> stok int(11),
    -> min_stok int (11),
    -> jenis_produk_id int NOT NULL REFERENCES Jenis_produk(id));

MariaDB [dbtoko]> desc produk;
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
8 rows in set (0.006 sec)

//Membuat table pesanan_items
MariaDB [dbtoko]> CREATE TABLE pesanan_items(
    -> id int NOT NULL auto_increment primary key,
    -> produk_id int NOT NULL references produk(id),
    -> pesanan_id int NOT NULL references pesanan(id),
    -> qty int (11),
    -> harga doUble);

MariaDB [dbtoko]> desc pesanan_items;
+------------+---------+------+-----+---------+----------------+
| Field      | Type    | Null | Key | Default | Extra          |
+------------+---------+------+-----+---------+----------------+
| id         | int(11) | NO   | PRI | NULL    | auto_increment |
| produk_id  | int(11) | NO   |     | NULL    |                |
| pesanan_id | int(11) | NO   |     | NULL    |                |
| qty        | int(11) | YES  |     | NULL    |                |
| harga      | double  | YES  |     | NULL    |                |
+------------+---------+------+-----+---------+----------------+
5 rows in set (0.011 sec)

//Membuat table vendor
MariaDB [dbtoko]> CREATE TABLE vendor(
    -> id int NOT NULL auto_increment primary key,
    -> nomor varchar (4),
    -> nama varchar(40),
    -> kota varchar(30),
    -> kontak varchar(30));

MariaDB [dbtoko]> desc vendor;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| id     | int(11)     | NO   | PRI | NULL    | auto_increment |
| nomor  | varchar(4)  | YES  |     | NULL    |                |
| nama   | varchar(40) | YES  |     | NULL    |                |
| kota   | varchar(30) | YES  |     | NULL    |                |
| kontak | varchar(30) | YES  |     | NULL    |                |
+--------+-------------+------+-----+---------+----------------+
5 rows in set (0.013 sec)

//Membuat Table pembelian
MariaDB [dbtoko]> CREATE TABLE pembelian(
    -> id int NOT NULL auto_increment primary key,
    -> tanggal varchar(10),
    -> nomor varchar(10),
    -> produk_id int NOT NULL references produk(id),
    -> jumlah int(11),
    -> harga double,
    -> vendor_id int NOT NULL references vendor(id));

MariaDB [dbtoko]> desc pembelian;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int(11)     | NO   | PRI | NULL    | auto_increment |
| tanggal   | varchar(10) | YES  |     | NULL    |                |
| nomor     | varchar(10) | YES  |     | NULL    |                |
| produk_id | int(11)     | NO   |     | NULL    |                |
| jumlah    | int(11)     | YES  |     | NULL    |                |
| harga     | double      | YES  |     | NULL    |                |
| vendor_id | int(11)     | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
7 rows in set (0.013 sec)

//Tambahkan kolom alamat pada pelanggan dengan tipe data varchar (40)
MariaDB [dbtoko]> ALTER TABLE pelanggan
    -> ADD Alama varchar(40);
Query OK, 0 rows affected (0.019 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> desc pelanggan
    -> ;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode           | varchar(10) | YES  | UNI | NULL    |                |
| nama_pelanggan | varchar(50) | YES  |     | NULL    |                |
| jk             | char(1)     | YES  |     | NULL    |                |
| tmp_lahir      | varchar(20) | YES  |     | NULL    |                |
| tgl_lahir      | date        | YES  |     | NULL    |                |
| email          | varchar(30) | YES  |     | NULL    |                |
| kartu_id       | int(11)     | NO   |     | NULL    |                |
| Alama          | varchar(40) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
9 rows in set (0.011 sec)

//Ubah kolom nama pada pelanggan menjadi nama_pelanggan
MariaDB [dbtoko]> ALTER TABLE pelanggan
    -> CHANGE nama nama_pelanggan varchar(50);
Query OK, 0 rows affected (0.033 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> desc pelanggan
    -> ;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode           | varchar(10) | YES  | UNI | NULL    |                |
| nama_pelanggan | varchar(50) | YES  |     | NULL    |                |
| jk             | char(1)     | YES  |     | NULL    |                |
| tmp_lahir      | varchar(20) | YES  |     | NULL    |                |
| tgl_lahir      | date        | YES  |     | NULL    |                |
| email          | varchar(30) | YES  |     | NULL    |                |
| kartu_id       | int(11)     | NO   |     | NULL    |                |
| Alama          | varchar(40) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
9 rows in set (0.011 sec)

//Table yang ada pada database (dbtoko)
MariaDB [dbtoko]> show tables;
+------------------+
| Tables_in_dbtoko |
+------------------+
| jenis_produk     |
| kartu            |
| pelanggan        |
| pembayaran       |
| pembelian        |
| pesanan          |
| pesanan_items    |
| produk           |
| vendor           |
+------------------+
9 rows in set (0.000 sec)