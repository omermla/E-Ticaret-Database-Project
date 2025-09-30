🛒 E-Ticaret Database Project

Bu proje, SQL Server kullanılarak geliştirilmiş bir e-ticaret veritabanı uygulamasıdır.
Amaç; gerçek bir online alışveriş platformunu (Trendyol, Hepsiburada, Amazon benzeri) simüle ederek veritabanı tasarımı, veri ekleme, sorgulama, güncelleme, silme, trigger ve raporlama uygulamalarını göstermektir.


🔧 Kullanılan Teknolojiler:

*SQL Server (T-SQL)

*SSMS (SQL Server Management Studio)

🗂 Veritabanı Tabloları

👤 Musteri → Müşteri bilgileri (Ad, Soyad, Email, Telefon, Şehir, KayıtTarihi)

🛍️ Kategori → Ürün kategorileri (Kategori Adı, Açıklama)

🏬 Satici → Satıcı bilgileri (Ad, Email, Telefon, Şehir)

📦 Urun → Ürün detayları (Ürün Adı, Fiyat, Stok, Kategori, Satıcı)

📑 Siparis → Sipariş bilgileri (Müşteri, Tarih, Toplam Tutar)

📊 Siparis_Detay → Sipariş detayları (Ürün, Adet, Birim Fiyat)


📷 ER Diyagramı

⚙️ Özellikler

Müşteri, ürün, kategori ve satıcı yönetimi

Sipariş & sipariş detayları

Trigger ile stok takibi (Sipariş sonrası stok otomatik azalır)

UPDATE / DELETE işlemleri (müşteri ve ürün yönetimi)

***Raporlama sorguları:

-En çok sipariş veren müşteriler

-En çok satılan ürünler

-En çok gelir getiren kategoriler

-En çok satış yapan satıcılar

-Aylık satış istatistikleri


📊 Örnek Raporlama Sorgusu

-- En çok sipariş veren ilk 5 müşteri

```sql
SELECT TOP 5 M.Ad, M.Soyad, COUNT(S.SiparisID) AS SiparisSayisi
FROM Musteri M
JOIN Siparis S ON M.MusteriID = S.MusteriID
GROUP BY M.Ad, M.Soyad
ORDER BY SiparisSayisi DESC;



