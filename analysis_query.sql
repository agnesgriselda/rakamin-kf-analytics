CREATE OR REPLACE TABLE kimia_farma.tabel_analisa AS
SELECT
  -- Kolom dari tabel transaksi
  t.transaction_id,
  t.date,
  t.branch_id,
  t.customer_name,
  t.product_id,
  t.price AS actual_price, -- Menggunakan alias sesuai permintaan
  t.discount_percentage,
  t.rating AS rating_transaksi, -- Menggunakan alias sesuai permintaan

  -- Kolom dari tabel kantor cabang
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.rating AS rating_cabang,

  -- Kolom dari tabel produk
  p.product_name,

  -- Kolom kalkulasi sesuai permintaan
  -- 1. persentase_gross_laba
  CASE
    WHEN t.price <= 50000 THEN 0.10
    WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
    WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
    WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
    ELSE 0.30
  END AS persentase_gross_laba,

  -- 2. nett_sales (Harga setelah diskon)
  (t.price * (1 - t.discount_percentage)) AS nett_sales,

  -- 3. nett_profit (Keuntungan bersih)
  (t.price * (1 - t.discount_percentage)) - (t.price * (
    1 - (CASE
      WHEN t.price <= 50000 THEN 0.10
      WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
      WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
      WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
      ELSE 0.30
    END)
  )) AS nett_profit

FROM
  `rakamin-kf-analytics-476516.kimia_farma.kf_final_transaction` AS t
LEFT JOIN
  `rakamin-kf-analytics-476516.kimia_farma.kf_kantor_cabang` AS kc ON t.branch_id = kc.branch_id
LEFT JOIN
  `rakamin-kf-analytics-476516.kimia_farma.kf_product` AS p ON t.product_id = p.product_id;
