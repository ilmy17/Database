Tugas 3

-- SOAL 3.1 --

-- Menampilkan produk yang asset nya diatas 20jt
MariaDB [dbtoko]> select * FROM Produk WHERE harga_beli * stok > 200000000;
Empty set (0.009 sec)
-- Tidak Ada produk asset di atas 20jt dan yang tampil hanya di atas 2jt
MariaDB [dbtoko]> select * FROM Produk WHERE harga_beli * stok > 2000000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | tv01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | tv02 | TV 21 inch |    2000000 |    6000000 |   10 |        3 |               1 |
|  3 | k001 | kulkas     |    2100000 |    6800000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
3 rows in set (0.000 sec)

-- Menampilkan data produk beserta selisih stok dengan minimal stok
MariaDB [dbtoko]> SELECT SUM(stok - min_stok) AS Selisih  from produk;
+---------+
| Selisih |
+---------+
|      10 |
+---------+
1 row in set (0.000 sec)

-- Menampilkan total asset produk secara keseluruhan
MariaDB [dbtoko]> SELECT SUM(Stok) AS total_Asset from produk;
+-------------+
| total_Asset |
+-------------+
|          32 |
+-------------+
1 row in set (0.000 sec)

-- Menampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004
MariaDB [dbtoko]> SELECT * from pelanggan WHERE YEAR(tgl_lahir)BETWEEN 1999 AND 2004;
+----+------+----------------+------+-----------+------------+------------------------+----------+--------+
| id | kode | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email                  | kartu_id | Alama  |
+----+------+----------------+------+-----------+------------+------------------------+----------+--------+
|  1 | 111  | ilmy           | P    | pinrang   | 2002-05-17 | ilmyhusain17@gmail.com |        1 | urung  |
|  2 | 222  | immi           | P    | pinrang   | 2002-08-17 | usain17@gmail.com      |        2 | urung  |
|  3 | 333  | qil            | L    | pinrang   | 2002-08-10 | usain@gmail.com        |        1 | urung  |
|  4 | 444  | aii            | L    | MInang    | 2002-10-10 | aii@gmail.com          |        2 | minang |
+----+------+----------------+------+-----------+------------+------------------------+----------+--------+
4 rows in set (0.008 sec)

-- Menampilkan data pelanggan yang lahirnya tahun 1998
MariaDB [dbtoko]> SELECT * FROM Pelanggan WHERE YEAR(tgl_lahir)=2000;
Empty set (0.000 sec)
-- Tidak ada data pelanggan yang lahir pata tahun 1998

-- Menampilkan data pelanggan yang berulang tahun bulan agustus
MariaDB [dbtoko]> SELECT * FROM  Pelanggan WHERE MONTH(tgl_lahir)=08;
+----+------+----------------+------+-----------+------------+-------------------+----------+-------+
| id | kode | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id | Alama |
+----+------+----------------+------+-----------+------------+-------------------+----------+-------+
|  2 | 222  | immi           | P    | pinrang   | 2002-08-17 | usain17@gmail.com |        2 | urung |
|  3 | 333  | qil            | L    | pinrang   | 2002-08-10 | usain@gmail.com   |        1 | urung |
+----+------+----------------+------+-----------+------------+-------------------+----------+-------+
2 rows in set (0.001 sec)

-- Menampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)
MariaDB [dbtoko]> SELECT nama_pelanggan, tmp_lahir, tgl_lahir, TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE()) AS umur FROM Pelanggan;
+----------------+-----------+------------+------+
| nama_pelanggan | tmp_lahir | tgl_lahir  | umur |
+----------------+-----------+------------+------+
| ilmy           | pinrang   | 2002-05-17 |   20 |
| immi           | pinrang   | 2002-08-17 |   20 |
| qil            | pinrang   | 2002-08-10 |   20 |
| aii            | MInang    | 2002-10-10 |   20 |
| yuli           | Jakarta   | 2008-11-11 |   14 |
| rani riri      | pinrang   | 2009-10-09 |   13 |
+----------------+-----------+------------+------+
6 rows in set (0.008 sec)


-- SOAL 3.2 --
-- Menampilkan jumlah pelanggan yang tahun lahirnya 1998
MariaDB [dbtoko]> Select COUNT(*) AS jml_Pelanggan
    -> FROM Pelanggan
    -> WHERE YEAR(tgl_lahir) =2002;
+---------------+
| jml_Pelanggan |
+---------------+
|             4 |
+---------------+
1 row in set (0.001 sec)

-- Menampilkan jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
MariaDB [dbtoko]> Select COUNT(*) AS jml_Pelanggan
    -> FROM Pelanggan
    -> WHERE tmp_lahir = "Pinrang";
+---------------+
| jml_Pelanggan |
+---------------+
|             4 |
+---------------+
1 row in set (0.001 sec)

-- Menampilkan jumlah total stok semua produk yang harga jualnya dibawah 10rb
MariaDB [(none)]> use dbtoko;
Database changed
MariaDB [dbtoko]> Select SUM(stok) AS Total_Stok
    -> FROM produk
    -> WHERE harga_Jual < 10000;
+------------+
| Total_Stok |
+------------+
|          5 |
+------------+
1 row in set (0.000 sec)

-- Menampilkan produk yang mempunyai kode awal K
MariaDB [dbtoko]> SELECT COUNT(*) AS Jumlah_produk
    -> FROM Produk
    -> Where Kode LIKE 'K%';
+---------------+
| Jumlah_produk |
+---------------+
|             1 |
+---------------+
1 row in set (0.008 sec)

-- Menampilkan harga jual rata-rata produk yang diatas 1jt
MariaDB [dbtoko]> Select AVG(harga_jual) AS rata_rata_hargajual
    -> FROM Produk
    -> WHERE harga_jual > 1000000;
+---------------------+
| rata_rata_hargajual |
+---------------------+
|             5600000 |
+---------------------+
1 row in set (0.001 sec)

-- Menampilkan jumlah stok yang paling besar
MariaDB [dbtoko]> SELECT MAX(stok) AS jumlahStok
    -> from produk;
+------------+
| jumlahStok |
+------------+
|         10 |
+------------+
1 row in set (0.000 sec)

-- Menampilkan jumlah produk yang stoknya kurang dari minimal stok
MariaDB [dbtoko]> SELECT COUNT(*) AS jumlahProduk
    -> FROM produk
    -> WHERE stok < min_stok;
+--------------+
| jumlahProduk |
+--------------+
|            1 |
+--------------+
1 row in set (0.000 sec)


-- Menampilkan Jumlah total asset dari keseluruhan produk
MariaDB [dbtoko]> SELECT SUM(Harga_beli * Stok) AS TOTAL_ASSET from Produk;
+-------------+
| TOTAL_ASSET |
+-------------+
|    50420000 |
+-------------+
1 row in set (0.000 sec)


-- SOAL 3.3 --
-- Menampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.
MariaDB [dbtoko]> SELECT id, nama, stok,
    -> CASE
    -> WHEN STOK <= MIn_stok THEN 'Segera Belanja'
    -> When Stok >= min_stok THEN 'Stok Aman'
    -> END AS info_Stok from produk;
+----+------------+------+----------------+
| id | nama       | stok | info_Stok      |
+----+------------+------+----------------+
|  1 | TV         |    3 | Stok Aman      |
|  2 | TV 21 inch |   10 | Stok Aman      |
|  3 | kulkas     |   10 | Stok Aman      |
|  4 | meja makan |    4 | Stok Aman      |
|  5 | Taro       |    3 | Stok Aman      |
|  6 | teh kotak  |    2 | Segera Belanja |
+----+------------+------+----------------+
6 rows in set (0.000 sec)

-- Menampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’
MariaDB [dbtoko]> Select id, nama_pelanggan, tgl_lahir,
    -> CASE
    -> WHEN tgl_lahir = DATE(2004) THEN 'MUDA'
    -> WHEN tgl_lahir > Date(2000) OR tgl_lahir < DATE(2023) THEN 'DEWASA'
    -> Else 'TUA'
    -> END AS ketegori_umur FROM pelanggan;
+----+----------------+------------+---------------+
| id | nama_pelanggan | tgl_lahir  | ketegori_umur |
+----+----------------+------------+---------------+
|  1 | ilmy           | 2002-05-17 | DEWASA        |
|  2 | immi           | 2002-08-17 | DEWASA        |
|  3 | qil            | 2002-08-10 | DEWASA        |
|  4 | aii            | 2002-10-10 | DEWASA        |
|  5 | yuli           | 2008-11-11 | DEWASA        |
|  7 | rani riri      | 2009-10-09 | DEWASA        |
+----+----------------+------------+---------------+
6 rows in set, 12 warnings (0.007 sec)


-- Menampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’



-- SOAL 3.4 --
-- Menampilkan data statistik jumlah tempat lahir pelanggan
SELECT tmp_lahir, count(*) AS JumlahPelanggan From pelanggan GROUP BY tmp_lahir;
+-----------+-----------------+
| tmp_lahir | JumlahPelanggan |
+-----------+-----------------+
| Jakarta   |               1 |
| MInang    |               1 |
| pinrang   |               4 |
+-----------+-----------------+
3 rows in set (0.001 sec)

-- Menampilkan jumlah statistik produk berdasarkan jenis produk
MariaDB [dbtoko]> SELECT jenis_produk_id, count(*) AS Jumlahproduk From produk GROUP BY jenis_produk_id;
+-----------------+--------------+
| jenis_produk_id | Jumlahproduk |
+-----------------+--------------+
|               1 |            3 |
|               2 |            1 |
|               3 |            1 |
|               4 |            1 |
+-----------------+--------------+
4 rows in set (0.001 sec)

-- Menampilkan data pelanggan yang usianya dibawah rata usia pelanggan
MariaDB [dbtoko]> SELECT id, nama_pelanggan, tgl_lahir
    -> FROM Pelanggan Where tgl_lahir < (SELECT AVG(DATE(tgl_lahir)) FROM pelang
gan);
Empty set, 1 warning (0.002 sec)

-- Menampilkan data produk yang harganya diatas rata-rata harga produk
MariaDB [dbtoko]> SELECT id, kode, nama, harga_beli FROM Produk WHERE Harga_beli
 > (SELECT AVG(harga_beli) FROM produk);
+----+------+------------+------------+
| id | kode | nama       | harga_beli |
+----+------+------------+------------+
|  1 | tv01 | TV         |    3000000 |
|  2 | tv02 | TV 21 inch |    2000000 |
|  3 | k001 | kulkas     |    2100000 |
+----+------+------------+------------+
3 rows in set (0.001 sec)

-- -- Menampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
SELECT kartu AS iuran_tahunan
FROM pelanggan 
WHERE kartu > 90000 ;

-- Menampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan
MariaDB [dbtoko]> select COUNT(*) AS total_produk, MIN(harga_beli) AS harga_mini
mal, MAX(harga_beli) AS harga_maksimal, AVG(harga_beli) AS Harga_ratarata
    -> FROM Produk
    -> WHERE harga_beli <  (SELECT AVG(harga_beli) from produk);
+--------------+---------------+----------------+----------------+
| total_produk | harga_minimal | harga_maksimal | Harga_ratarata |
+--------------+---------------+----------------+----------------+
|            3 |          4000 |         100000 |          36000 |
+--------------+---------------+----------------+----------------+
1 row in set (0.001 sec)

-- Menampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
SELECT *
FROM pelanggan
WHERE kartu > 3;