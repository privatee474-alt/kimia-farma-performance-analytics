-- Query 1: Revenue per tahun
SELECT
  EXTRACT(YEAR FROM date) AS tahun,
  ROUND(SUM(nett_sales), 0) AS total_nett_sales,
  ROUND(SUM(nett_profit), 0) AS total_nett_profit,
  COUNT(transaction_id) AS total_transaksi
FROM `rakaminkfanalytics-508200.kimia_farma.kf_analysis_table`
GROUP BY tahun
ORDER BY tahun;

-- Query 2: Top 10 provinsi
SELECT
  provinsi,
  COUNT(transaction_id) AS total_transaksi,
  ROUND(SUM(nett_sales), 0) AS total_nett_sales
FROM `rakaminkfanalytics-508200.kimia_farma.kf_analysis_table`
GROUP BY provinsi
ORDER BY total_nett_sales DESC
LIMIT 10;

-- Query 3: Top 5 cabang - rating cabang tertinggi, rating transaksi terendah
SELECT
  branch_name,
  kota,
  provinsi,
  ROUND(AVG(rating_cabang), 2)    AS avg_rating_cabang,
  ROUND(AVG(rating_transaksi), 2) AS avg_rating_transaksi
FROM `rakaminkfanalytics-508200.kimia_farma.kf_analysis_table`
GROUP BY branch_name, kota, provinsi
ORDER BY avg_rating_cabang DESC, avg_rating_transaksi ASC
LIMIT 5;

-- Query 4: Total profit per provinsi
SELECT
  provinsi,
  ROUND(SUM(nett_profit), 0) AS total_profit
FROM `rakaminkfanalytics-508200.kimia_farma.kf_analysis_table`
GROUP BY provinsi
ORDER BY total_profit DESC;
