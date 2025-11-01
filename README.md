# Analisis Kinerja Bisnis Kimia Farma (2020-2023)

## Latar Belakang Proyek

Proyek ini merupakan bagian dari *Project-Based Internship* yang diselenggarakan oleh **Rakamin Academy** bekerja sama dengan **Kimia Farma**. Tantangan utamanya adalah untuk melakukan analisis mendalam terhadap kinerja bisnis Kimia Farma selama periode 2020 hingga 2023 dengan memanfaatkan serangkaian dataset transaksional.

Tujuan akhir dari proyek ini adalah membangun sebuah dashboard analitik yang interaktif untuk menyajikan insight utama, memonitor metrik kinerja kunci (KPIs), dan memberikan rekomendasi bisnis berdasarkan temuan data.

---

## 🛠️ Tech Stack yang Digunakan

*   **Cloud Platform:** Google Cloud Platform (GCP)
*   **Data Warehouse:** Google BigQuery
*   **Bahasa Kueri:** SQL (Standard SQL)
*   **Visualisasi Data:** Google Looker Studio (sekarang Looker Studio)
*   **Version Control:** Git & GitHub

---

## 📄 Sumber Data

Analisis ini didasarkan pada empat dataset utama yang disediakan dalam format CSV:

1.  `kf_final_transaction.csv`: Berisi data detail setiap transaksi, termasuk ID transaksi, ID produk, tanggal, harga, diskon, dan rating dari pelanggan.
2.  `kf_product.csv`: Berisi data master produk, termasuk nama dan kategori produk.
3.  `kf_kantor_cabang.csv`: Berisi data master cabang Kimia Farma di seluruh Indonesia, termasuk nama cabang, kota, dan provinsi.
4.  `kf_inventory.csv`: Berisi data inventaris produk di setiap cabang (tidak digunakan dalam pembuatan tabel analisa akhir, namun merupakan bagian dari data yang disediakan).

---

## ⚙️ Alur Kerja Proyek

Proyek ini dilaksanakan melalui beberapa tahapan utama:

### 1. Data Loading (ETL)
*   Membuat *project* baru di Google Cloud Platform.
*   Membuat *dataset* bernama `kimia_farma` di dalam BigQuery.
*   Mengunggah keempat file CSV ke BigQuery dan membuatnya menjadi tabel permanen (`kf_final_transaction`, `kf_product`, `kf_kantor_cabang`, `kf_inventory`).

### 2. Transformasi dan Pemodelan Data
*   Menggabungkan tiga tabel utama (`kf_final_transaction`, `kf_product`, `kf_kantor_cabang`) menggunakan `LEFT JOIN`.
*   Membuat kolom-kolom baru yang dibutuhkan untuk analisis sesuai dengan *business rules* yang diberikan:
    *   `persentase_gross_laba`: Menghitung persentase laba kotor berdasarkan rentang harga produk menggunakan `CASE WHEN statement`.
    *   `nett_sales`: Menghitung pendapatan bersih setelah dikurangi diskon.
    *   `nett_profit`: Menghitung keuntungan bersih dari setiap transaksi.
*   Menyimpan hasil dari kueri gabungan ini ke dalam sebuah tabel analisa akhir bernama `tabel_analisa`.

**Kueri SQL yang digunakan dapat dilihat di file ini:**
➡️ [`analysis_query.sql`](analysis_query.sql)

### 3. Visualisasi Data
*   Menghubungkan tabel `tabel_analisa` dari BigQuery ke Google Looker Studio sebagai sumber data.
*   Membangun dashboard interaktif yang mencakup visualisasi berikut:
    *   **Summary Cards (KPIs):** Total Pendapatan (Nett Sales), Total Keuntungan (Nett Profit), dan Total Transaksi.
    *   **Filter Control:** Filter berdasarkan rentang tanggal untuk analisis yang dinamis.
    *   **Analisis Time Series:** Tren pendapatan dari tahun ke tahun.
    *   **Analisis Geografis:** Peta persebaran total profit per provinsi.
    *   **Analisis Perbandingan:** Top 10 provinsi berdasarkan total transaksi dan total penjualan.
    *   **Analisis Rating:** Top 5 cabang dengan rating tertinggi, namun memiliki rating transaksi terendah (untuk identifikasi potensi masalah layanan).

---

## 📊 Hasil Akhir: Dashboard Kinerja Bisnis

Dashboard ini menyajikan ringkasan visual dari performa bisnis Kimia Farma. Pengguna dapat berinteraksi dengan filter untuk melihat data pada periode tertentu dan mendapatkan wawasan mendalam dari berbagai metrik yang disajikan.

**🔗 Link ke Dashboard:**
[Performance_Analytics_Kimia_Farma_-_Agnes_Zenobia_Griselda_Petrina Google Looker](https://lookerstudio.google.com/reporting/deb8cff0-256c-4477-8a32-e6990163902a)

### Pratinjau Dashboard
[Performance_Analytics_Kimia_Farma_-_Agnes_Zenobia_Griselda_Petrina.pdf](https://github.com/user-attachments/files/23286152/Performance_Analytics_Kimia_Farma_-_Agnes_Zenobia_Griselda_Petrina.pdf)


---

## 🚀 Cara Menjalankan Ulang Proyek Ini

1.  **Prasyarat:** Pastikan Anda memiliki akun Google dan akses ke Google Cloud Platform.
2.  **Clone Repository:** `git clone https://github.com/agnesgriselda/rakamin-kf-analytics.git`
3.  **Setup BigQuery:**
    *   Buat project dan dataset `kimia_farma` di BigQuery.
    *   Upload keempat file CSV sebagai tabel di dalam dataset tersebut.
4.  **Jalankan Kueri:** Buka file `analysis_query.sql`, salin isinya, dan jalankan di BigQuery Editor untuk membuat `tabel_analisa`.
5.  **Hubungkan ke Looker Studio:** Buat laporan baru di Looker Studio dan hubungkan ke `tabel_analisa` yang baru saja dibuat di BigQuery Anda.

---

Dibuat oleh **Agnes Zenobia Griselda Petrina**
*   **LinkedIn:** `linkedin.com/in/agnesgriseldaa`
*   **Email:** `agnesgriselle66@gmail.com`
