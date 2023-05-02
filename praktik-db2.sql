-- SOAL 3 --
-- Menampilkan produk yang kode awalnya huruf K dan huruf M
SELECT * FROM produk WHERE kode LIKE 'K%' OR kode LIKE 'M%';

-- Menampilkan produk yang kode awalnya bukan huruf M
SELECT * FROM produk WHERE kode LIKE 'M%';

-- Menampilkan produk-produk televisi
SELECT * FROM produk WHERE nama='tv';

-- Menampilkan pelanggan mengandung huruf 'SA'
SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '%SA%';

-- Menampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘
SELECT * FROM pelanggan WHERE NOT tmp_lahir='jakarta' AND tmp_lahir LIKE '%YO%';

-- Menampilkan pelanggan yang karakter huruf ke – 2 nya adalah A
SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '_A%';

-- SOAL 4 --
-- Menampilkan 2 data produk termahal
SELECT * FROM produk ORDER BY harga_beli DESC LIMIT 2;

-- Menampilkan produk yang paling murah
SELECT * FROM produk ORDER BY harga_beli ASC LIMIT 1;

-- Menampilkan produk yang stoknya paling banyak
SELECT * FROM produk ORDER BY stok DESC LIMIT 1;

-- Menampilkan dua produk yang stoknya paling sedikit
SELECT * FROM produk ORDER BY stok ASC LIMIT 2;

-- Menampilkan pelanggan yang paling muda
SELECT * FROM pelanggan ORDER BY tgl_lahir DESC;

-- Menampilkan pelanggan yang paling tua
SELECT * FROM pelanggan ORDER BY tgl_lahir ASC;