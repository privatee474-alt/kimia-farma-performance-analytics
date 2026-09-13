CREATE OR REPLACE TABLE `rakaminkfanalytics-508200.kimia_farma.kf_analysis_table` AS

WITH base AS (
  SELECT
    t.transaction_id,
    t.date,
    t.branch_id,
    kc.branch_name,
    kc.kota,
    kc.provinsi,
    kc.rating          AS rating_cabang,
    t.customer_name,
    t.product_id,
    p.product_name,
    t.price             AS actual_price,
    t.discount_percentage,
    t.rating            AS rating_transaksi
  FROM `rakaminkfanalytics-508200.kimia_farma.kf_final_transaction` t
  LEFT JOIN `rakaminkfanalytics-508200.kimia_farma.kf_product` p
    ON t.product_id = p.product_id
  LEFT JOIN `rakaminkfanalytics-508200.kimia_farma.kf_kantor_cabang` kc
    ON t.branch_id = kc.branch_id
)

SELECT
  transaction_id,
  date,
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang,
  customer_name,
  product_id,
  product_name,
  actual_price,
  discount_percentage,

  CASE
    WHEN actual_price <= 50000                            THEN 0.10
    WHEN actual_price >  50000  AND actual_price <= 100000 THEN 0.15
    WHEN actual_price >  100000 AND actual_price <= 300000 THEN 0.20
    WHEN actual_price >  300000 AND actual_price <= 500000 THEN 0.25
    WHEN actual_price >  500000                            THEN 0.30
  END AS persentase_gross_laba,

  ROUND(actual_price - (actual_price * discount_percentage), 2) AS nett_sales,

  ROUND(
    (actual_price - (actual_price * discount_percentage)) *
    CASE
      WHEN actual_price <= 50000                            THEN 0.10
      WHEN actual_price >  50000  AND actual_price <= 100000 THEN 0.15
      WHEN actual_price >  100000 AND actual_price <= 300000 THEN 0.20
      WHEN actual_price >  300000 AND actual_price <= 500000 THEN 0.25
      WHEN actual_price >  500000                            THEN 0.30
    END, 2
  ) AS nett_profit,

  rating_transaksi
FROM base;
