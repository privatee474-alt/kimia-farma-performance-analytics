# Kimia Farma Performance Analytics 2020–2023

Project ini merupakan bagian dari **Rakamin x Kimia Farma — Big Data Analytics
Virtual Internship Experience (VIX)**. Project berisi proses ETL dan analisis
kinerja bisnis Kimia Farma tahun 2020–2023, menggunakan Google BigQuery untuk
pengolahan data dan Microsoft Excel untuk visualisasi dashboard.

## Struktur Project

- `sql/01_create_analysis_table.sql` — query pembuatan tabel analisa gabungan
  (`kf_analysis_table`) dari 4 dataset mentah
- `sql/02_dashboard_queries.sql` — 4 query pendukung untuk kebutuhan dashboard

## Dataset

- `kf_final_transaction.csv` — data transaksi
- `kf_product.csv` — data produk/obat
- `kf_inventory.csv` — data stok per cabang
- `kf_kantor_cabang.csv` — data kantor cabang Kimia Farma

## Catatan Teknis

Dashboard pada project ini dibuat menggunakan **Microsoft Excel**, bukan
Google Looker Studio seperti requirement awal. Hal ini dikarenakan Looker
Studio tidak dapat diakses dari lokasi penulis saat pengerjaan project
(layanan tersebut memang tidak mendukung akses dari wilayah tersebut, dan
sudah dicoba melalui beberapa server VPN namun tetap tidak berhasil). Elemen
inti dashboard (judul, tren transaksi per tahun, top 10 provinsi, top 5
cabang, profit per provinsi) tetap dipenuhi; beberapa elemen seperti summary
scorecard, filter interaktif, dan geo map disederhanakan mengikuti
keterbatasan Excel.

## Insight Utama

- Pendapatan (nett sales) relatif stagnan di kisaran Rp 80 miliar/tahun
  sepanjang 2020–2023.
- Jawa Barat mendominasi kontribusi nett sales dan transaksi secara
  nasional, jauh di atas provinsi lain.
- Terdapat gap antara rating cabang dan rating transaksi pada 5 cabang
  dengan rating cabang tertinggi.
- Sebaran profit antar provinsi tidak merata.

## Author
Nama: Jane Shannon Yang
Program: Rakamin x Kimia Farma — Big Data Analytics

Nama: [Nama Lengkap]
Program: Rakamin x Kimia Farma — Big Data Analytics VIX
