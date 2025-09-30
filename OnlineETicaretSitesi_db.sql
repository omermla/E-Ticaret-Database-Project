--Veritabaný Oluþturma
IF DB_ID(N'ETicaretPro50') IS NULL
    CREATE DATABASE ETicaretPro50;
GO

USE ETicaretPro50;
GO

SELECT DB_NAME() AS CurrentDatabase;


USE ETicaretPro50;
GO

-- Müþteri Tablosu
CREATE TABLE Musteri (
    MusteriID INT IDENTITY(1,1) PRIMARY KEY,
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Telefon NVARCHAR(20),
    Sehir NVARCHAR(50),
    KayitTarihi DATE DEFAULT GETDATE()
);

-- Kategori Tablosu
CREATE TABLE Kategori (
    KategoriID INT IDENTITY(1,1) PRIMARY KEY,
    KategoriAdi NVARCHAR(100) NOT NULL,
    Aciklama NVARCHAR(255)
);

-- Satýcý Tablosu
CREATE TABLE Satici (
    SaticiID INT IDENTITY(1,1) PRIMARY KEY,
    SaticiAdi NVARCHAR(100) NOT NULL,
    IletisimEmail NVARCHAR(100),
    Telefon NVARCHAR(20),
    Sehir NVARCHAR(50)
);

-- Ürün Tablosu
CREATE TABLE Urun (
    UrunID INT IDENTITY(1,1) PRIMARY KEY,
    UrunAdi NVARCHAR(100) NOT NULL,
    Fiyat DECIMAL(10,2) NOT NULL,
    Stok INT NOT NULL,
    KategoriID INT FOREIGN KEY REFERENCES Kategori(KategoriID),
    SaticiID INT FOREIGN KEY REFERENCES Satici(SaticiID)
);

-- Sipariþ Tablosu
CREATE TABLE Siparis (
    SiparisID INT IDENTITY(1,1) PRIMARY KEY,
    MusteriID INT FOREIGN KEY REFERENCES Musteri(MusteriID),
    SiparisTarihi DATE DEFAULT GETDATE(),
    ToplamTutar DECIMAL(10,2)
);

-- Sipariþ Detay Tablosu
CREATE TABLE Siparis_Detay (
    DetayID INT IDENTITY(1,1) PRIMARY KEY,
    SiparisID INT FOREIGN KEY REFERENCES Siparis(SiparisID),
    UrunID INT FOREIGN KEY REFERENCES Urun(UrunID),
    Adet INT NOT NULL,
    BirimFiyat DECIMAL(10,2) NOT NULL
);

--Kategori ve Satýcý Verileri
INSERT INTO Kategori (KategoriAdi, Aciklama)
VALUES
(N'Elektronik', N'Telefon, bilgisayar ve diðer elektronik ürünler'),
(N'Giyim', N'Kadýn, erkek ve çocuk giyim ürünleri'),
(N'Ev & Yaþam', N'Mobilya, dekorasyon ve ev eþyalarý'),
(N'Spor', N'Spor malzemeleri ve ekipmanlarý'),
(N'Kozmetik', N'Makyaj ve bakým ürünleri'),
(N'Kitap', N'Roman, ders kitabý ve diðer yayýnlar'),
(N'Oyuncak', N'Çocuk oyuncaklarý ve oyun setleri'),
(N'Mutfak', N'Mutfak gereçleri ve yemek takýmlarý'),
(N'Bahçe', N'Bahçe mobilyasý ve ekipmanlarý'),
(N'Müzik', N'Enstrümanlar ve müzik ekipmanlarý'),
(N'Kýrtasiye', N'Defter, kalem ve ofis malzemeleri'),
(N'Petshop', N'Evcil hayvan ürünleri');

INSERT INTO Satici (SaticiAdi, IletisimEmail, Telefon, Sehir)
VALUES
(N'TeknoMarket', 'info@teknomarket.com', '02122334455', N'Ýstanbul'),
(N'ModaDünyasý', 'iletisim@modadunyasi.com', '03124445566', N'Ankara'),
(N'EvShop', 'destek@evshop.com', '02326667788', N'Ýzmir'),
(N'Sportify', 'info@sportify.com', '02223334455', N'Bursa'),
(N'BeautyStore', 'info@beautystore.com', '02164561234', N'Antalya'),
(N'BookWorld', 'info@bookworld.com', '02123335566', N'Adana'),
(N'ToyPlanet', 'info@toyplanet.com', '03126549877', N'Gaziantep'),
(N'MusicHouse', 'info@musichouse.com', '02125557799', N'Eskiþehir');

SELECT * FROM Kategori;
SELECT * FROM Satici;

--Müþteri Ekleme
USE ETicaretPro50;
GO

INSERT INTO Musteri (Ad, Soyad, Email, Telefon, Sehir)
VALUES
(N'Ahmet', N'Yýlmaz', 'ahmet.yilmaz1@example.com', '05001110001', N'Ýstanbul'),
(N'Ayþe', N'Demir', 'ayse.demir@example.com', '05001110002', N'Ankara'),
(N'Mehmet', N'Kaya', 'mehmet.kaya@example.com', '05001110003', N'Ýzmir'),
(N'Elif', N'Çelik', 'elif.celik@example.com', '05001110004', N'Bursa'),
(N'Murat', N'Arslan', 'murat.arslan@example.com', '05001110005', N'Antalya'),
(N'Zeynep', N'Koç', 'zeynep.koc@example.com', '05001110006', N'Adana'),
(N'Emre', N'Polat', 'emre.polat@example.com', '05001110007', N'Trabzon'),
(N'Fatma', N'Þahin', 'fatma.sahin@example.com', '05001110008', N'Konya'),
(N'Can', N'Acar', 'can.acar@example.com', '05001110009', N'Eskiþehir'),
(N'Selin', N'Kurt', 'selin.kurt@example.com', '05001110010', N'Samsun'),
(N'Burak', N'Turan', 'burak.turan@example.com', '05001110011', N'Mersin'),
(N'Gamze', N'Özdemir', 'gamze.ozdemir@example.com', '05001110012', N'Sakarya'),
(N'Hasan', N'Tekin', 'hasan.tekin@example.com', '05001110013', N'Denizli'),
(N'Yasemin', N'Aydýn', 'yasemin.aydin@example.com', '05001110014', N'Malatya'),
(N'Serkan', N'Çetin', 'serkan.cetin@example.com', '05001110015', N'Kayseri'),
(N'Hande', N'Güneþ', 'hande.gunes@example.com', '05001110016', N'Balýkesir'),
(N'Tolga', N'Aksoy', 'tolga.aksoy@example.com', '05001110017', N'Gaziantep'),
(N'Esra', N'Kýlýç', 'esra.kilic@example.com', '05001110018', N'Sivas'),
(N'Onur', N'Öztürk', 'onur.ozturk@example.com', '05001110019', N'Ordu'),
(N'Derya', N'Aslan', 'derya.aslan@example.com', '05001110020', N'Çorum'),
(N'Kerem', N'Koçak', 'kerem.kocak@example.com', '05001110021', N'Aydýn'),
(N'Buse', N'Doðan', 'buse.dogan@example.com', '05001110022', N'Muðla'),
(N'Kaan', N'Özkan', 'kaan.ozkan@example.com', '05001110023', N'Tekirdað'),
(N'Nil', N'Turan', 'nil.turan@example.com', '05001110024', N'Uþak'),
(N'Arda', N'Yýldýrým', 'arda.yildirim@example.com', '05001110025', N'Mardin'),
(N'Melis', N'Erdem', 'melis.erdem@example.com', '05001110026', N'Hatay'),
(N'Alper', N'Çalýþkan', 'alper.caliskan@example.com', '05001110027', N'Batman'),
(N'Pelin', N'Bulut', 'pelin.bulut@example.com', '05001110028', N'Van'),
(N'Engin', N'Tektaþ', 'engin.tektas@example.com', '05001110029', N'Rize'),
(N'Ýrem', N'Soylu', 'irem.soylu@example.com', '05001110030', N'Tokat'),
(N'Tuna', N'Acar', 'tuna.acar@example.com', '05001110031', N'Erzurum'),
(N'Meryem', N'Uzun', 'meryem.uzun@example.com', '05001110032', N'Çanakkale'),
(N'Batuhan', N'Topal', 'batuhan.topal@example.com', '05001110033', N'Manisa'),
(N'Cemre', N'Uz', 'cemre.uz@example.com', '05001110034', N'Aksaray'),
(N'Volkan', N'Yalçýn', 'volkan.yalcin@example.com', '05001110035', N'Kocaeli'),
(N'Nazlý', N'Özer', 'nazli.ozer@example.com', '05001110036', N'Yozgat'),
(N'Gökhan', N'Balcý', 'gokhan.balci@example.com', '05001110037', N'Karaman'),
(N'Ýlayda', N'Yaman', 'ilayda.yaman@example.com', '05001110038', N'Tokat'),
(N'Mustafa', N'Tuna', 'mustafa.tuna@example.com', '05001110039', N'Zonguldak'),
(N'Deniz', N'Sarý', 'deniz.sari@example.com', '05001110040', N'Kastamonu'),
(N'Ömer', N'Yavuz', 'omer.yavuz@example.com', '05001110041', N'Kýrþehir'),
(N'Cansu', N'Taþ', 'cansu.tas@example.com', '05001110042', N'Bolu'),
(N'Erhan', N'Yýldýz', 'erhan.yildiz@example.com', '05001110043', N'Kýrýkkale'),
(N'Ece', N'Tek', 'ece.tek@example.com', '05001110044', N'Isparta'),
(N'Ferhat', N'Demirtaþ', 'ferhat.demirtas@example.com', '05001110045', N'Giresun'),
(N'Aylin', N'Turhan', 'aylin.turhan@example.com', '05001110046', N'Kütahya'),
(N'Yunus', N'Tekin', 'yunus.tekin@example.com', '05001110047', N'Muþ'),
(N'Bahar', N'Yýldýz', 'bahar.yildiz@example.com', '05001110048', N'Nevþehir'),
(N'Kemal', N'Korkmaz', 'kemal.korkmaz@example.com', '05001110049', N'Aðrý'),
(N'Sevgi', N'Yalýn', 'sevgi.yalin@example.com', '05001110050', N'Ardahan'),
(N'Melih', N'Toprak', 'melih.toprak@example.com', '05001110051', N'Bartýn'),
(N'Aslý', N'Beyaz', 'asli.beyaz@example.com', '05001110052', N'Kilis'),
(N'Sinan', N'Kara', 'sinan.kara@example.com', '05001110053', N'Artvin'),
(N'Gizem', N'Çakýr', 'gizem.cakir@example.com', '05001110054', N'Þýrnak'),
(N'Levent', N'Demirci', 'levent.demirci@example.com', '05001110055', N'Elazýð'),
(N'Seda', N'Bayraktar', 'seda.bayraktar@example.com', '05001110056', N'Tunceli'),
(N'Tarýk', N'Yýlmazer', 'tarik.yilmazer@example.com', '05001110057', N'Hakkari'),
(N'Nur', N'Akçay', 'nur.akcay@example.com', '05001110058', N'Bayburt'),
(N'Almila', N'Ersoy', 'almila.ersoy@example.com', '05001110059', N'Kars'),
(N'Yusuf', N'Tekin', 'yusuf.tekin@example.com', '05001110060', N'Denizli');


SELECT COUNT(*) AS MusteriSayisi FROM Musteri;


--Ürün Ekleme
USE ETicaretPro50;
GO

INSERT INTO Urun (UrunAdi, Fiyat, Stok, KategoriID, SaticiID)
VALUES
-- Elektronik
(N'iPhone 14', 45000, 15, 1, 1),
(N'Samsung Galaxy S23', 40000, 20, 1, 1),
(N'Laptop Asus', 32000, 10, 1, 1),
(N'Kulaklýk JBL', 2500, 40, 1, 1),
(N'Akýllý Saat Apple Watch', 12000, 25, 1, 1),

-- Giyim
(N'Tiþört', 250, 80, 2, 2),
(N'Kot Pantolon', 600, 60, 2, 2),
(N'Spor Ayakkabý', 1500, 45, 2, 2),
(N'Ceket', 2500, 20, 2, 2),
(N'Elbise', 1800, 30, 2, 2),

-- Ev & Yaþam
(N'Koltuk Takýmý', 15000, 5, 3, 3),
(N'Yatak', 9000, 8, 3, 3),
(N'Halý', 3000, 15, 3, 3),
(N'Lamba', 500, 25, 3, 3),
(N'Dolap', 7000, 10, 3, 3),

-- Spor
(N'Basketbol Topu', 750, 35, 4, 4),
(N'Futbol Topu', 650, 40, 4, 4),
(N'Dambýl Seti', 2200, 12, 4, 4),
(N'Spor Çantasý', 400, 25, 4, 4),
(N'Koþu Bandý', 18000, 3, 4, 4),

-- Kozmetik
(N'Ruj', 250, 100, 5, 5),
(N'Fondöten', 450, 80, 5, 5),
(N'Parfüm', 1500, 50, 5, 5),
(N'Göz Farý Paleti', 600, 60, 5, 5),
(N'Cilt Bakým Kremi', 700, 40, 5, 5),

-- Kitap
(N'Roman - Suç ve Ceza', 150, 100, 6, 6),
(N'Ders Kitabý - Matematik', 200, 90, 6, 6),
(N'Tarih Kitabý', 180, 70, 6, 6),
(N'Fantastik Roman', 220, 80, 6, 6),
(N'Bilim Kurgu Romaný', 250, 60, 6, 6),

-- Oyuncak
(N'LEGO Seti', 900, 30, 7, 7),
(N'Puzzle 1000 Parça', 400, 40, 7, 7),
(N'Bebek Barbie', 500, 50, 7, 7),
(N'Araba Oyuncak', 300, 60, 7, 7),
(N'Trendy Masa Oyunu', 700, 35, 7, 7),

-- Mutfak
(N'Tencere Seti', 1500, 20, 8, 3),
(N'Çatal Býçak Takýmý', 700, 30, 8, 3),
(N'Mutfak Robotu', 3500, 15, 8, 3),
(N'Tost Makinesi', 1200, 25, 8, 3),
(N'Kahve Makinesi', 4500, 12, 8, 3),

-- Bahçe
(N'Bahçe Sandalyesi', 800, 40, 9, 3),
(N'Bahçe Masasý', 2500, 10, 9, 3),
(N'Çim Biçme Makinesi', 5500, 8, 9, 3),
(N'Bahçe Salýncaðý', 4000, 5, 9, 3),
(N'Bahçe Aydýnlatmasý', 600, 25, 9, 3),

-- Müzik
(N'Gitar', 3500, 20, 10, 8),
(N'Keman', 4000, 15, 10, 8),
(N'Piyano', 25000, 3, 10, 8),
(N'Davul Seti', 12000, 5, 10, 8),
(N'Flüt', 600, 30, 10, 8);

SELECT COUNT(*) AS UrunSayisi FROM Urun;
SELECT TOP 10 * FROM Urun;


--Sipariþ
USE ETicaretPro50;
GO

-- 40 sipariþ ekleme
INSERT INTO Siparis (MusteriID, SiparisTarihi, ToplamTutar)
VALUES
(1,  GETDATE(), 45250),   -- Ahmet: iPhone + Tiþört
(2,  GETDATE(), 15000),   -- Ayþe: Koltuk Takýmý
(3,  GETDATE(), 750),     -- Mehmet: Basketbol Topu
(4,  GETDATE(), 32000),   -- Elif: Laptop
(5,  GETDATE(), 1800),    -- Murat: Elbise
(6,  GETDATE(), 1500),    -- Zeynep: Spor Ayakkabý
(7,  GETDATE(), 250),     -- Emre: Tiþört
(8,  GETDATE(), 6000),    -- Fatma: Halý + Lamba
(9,  GETDATE(), 2500),    -- Can: Ceket
(10, GETDATE(), 900),     -- Selin: LEGO Seti
(11, GETDATE(), 250),     -- Burak: Ruj
(12, GETDATE(), 4500),    -- Gamze: Kahve Makinesi
(13, GETDATE(), 2200),    -- Hasan: Dambýl Seti
(14, GETDATE(), 150),     -- Yasemin: Roman
(15, GETDATE(), 5500),    -- Serkan: Çim Biçme Makinesi
(16, GETDATE(), 700),     -- Hande: Çatal Býçak Takýmý
(17, GETDATE(), 4000),    -- Tolga: Keman
(18, GETDATE(), 25000),   -- Esra: Piyano
(19, GETDATE(), 180),     -- Onur: Tarih Kitabý
(20, GETDATE(), 250),     -- Derya: Ruj
(21, GETDATE(), 600),     -- Kerem: Göz Farý Paleti
(22, GETDATE(), 3500),    -- Buse: Mutfak Robotu
(23, GETDATE(), 1200),    -- Kaan: Tost Makinesi
(24, GETDATE(), 45000),   -- Nil: iPhone 14
(25, GETDATE(), 9000),    -- Arda: Yatak
(26, GETDATE(), 18000),   -- Melis: Koþu Bandý
(27, GETDATE(), 2500),    -- Alper: Parfüm + Puzzle
(28, GETDATE(), 7000),    -- Pelin: Dolap
(29, GETDATE(), 150),     -- Engin: Roman
(30, GETDATE(), 3500),    -- Ýrem: Gitar
(31, GETDATE(), 220),     -- Tuna: Fantastik Roman
(32, GETDATE(), 500),     -- Meryem: Lamba
(33, GETDATE(), 1800),    -- Batuhan: Elbise
(34, GETDATE(), 650),     -- Cemre: Futbol Topu
(35, GETDATE(), 1500),    -- Volkan: Spor Ayakkabý
(36, GETDATE(), 250),     -- Nazlý: Ruj
(37, GETDATE(), 4000),    -- Gökhan: Bahçe Masasý
(38, GETDATE(), 12000),   -- Ýlayda: Davul Seti
(39, GETDATE(), 700),     -- Mustafa: Cilt Bakým Kremi
(40, GETDATE(), 4500);    -- Deniz: Kahve Makinesi


--Sipariþ Detaylarý
INSERT INTO Siparis_Detay (SiparisID, UrunID, Adet, BirimFiyat)
VALUES
(1, 1, 1, 45000),  -- iPhone
(1, 6, 1, 250),    -- Tiþört
(2, 11, 1, 15000), -- Koltuk Takýmý
(3, 16, 1, 750),   -- Basketbol Topu
(4, 3, 1, 32000),  -- Laptop
(5, 10, 1, 1800),  -- Elbise
(6, 8, 1, 1500),   -- Spor Ayakkabý
(7, 6, 1, 250),    -- Tiþört
(8, 13, 1, 3000),  -- Halý
(8, 14, 2, 500),   -- Lamba
(9, 9, 1, 2500),   -- Ceket
(10, 31, 1, 900),  -- LEGO
(11, 21, 1, 250),  -- Ruj
(12, 39, 1, 4500), -- Kahve Makinesi
(13, 18, 1, 2200), -- Dambýl
(14, 26, 1, 150),  -- Roman
(15, 43, 1, 5500), -- Çim Biçme
(16, 33, 1, 700),  -- Çatal Býçak
(17, 46, 1, 4000), -- Keman
(18, 47, 1, 25000),-- Piyano
(19, 28, 1, 180),  -- Tarih Kitabý
(20, 21, 1, 250),  -- Ruj
(21, 24, 1, 600),  -- Göz Farý
(22, 36, 1, 3500), -- Mutfak Robotu
(23, 37, 1, 1200), -- Tost Makinesi
(24, 1, 1, 45000), -- iPhone
(25, 12, 1, 9000), -- Yatak
(26, 20, 1, 18000),-- Koþu Bandý
(27, 23, 1, 1500), -- Parfüm
(27, 32, 1, 400),  -- Puzzle
(28, 15, 1, 7000), -- Dolap
(29, 26, 1, 150),  -- Roman
(30, 45, 1, 3500), -- Gitar
(31, 29, 1, 220),  -- Fantastik Roman
(32, 14, 1, 500),  -- Lamba
(33, 10, 1, 1800), -- Elbise
(34, 17, 1, 650),  -- Futbol Topu
(35, 8, 1, 1500),  -- Spor Ayakkabý
(36, 21, 1, 250),  -- Ruj
(37, 41, 1, 4000), -- Bahçe Masasý
(38, 49, 1, 12000),-- Davul
(39, 25, 1, 700),  -- Cilt Kremi
(40, 39, 1, 4500); -- Kahve Makinesi


SELECT COUNT(*) FROM Siparis;  
SELECT COUNT(*) FROM Siparis_Detay;  


--Tüm müþterileri listele
SELECT * FROM Musteri;


--Ýstanbul’daki müþterileri listele
SELECT Ad, Soyad, Sehir 
FROM Musteri
WHERE Sehir = N'Ýstanbul';

--Fiyatý 10.000 TL’den büyük ürünleri listele
SELECT UrunAdi, Fiyat 
FROM Urun
WHERE Fiyat > 10000;

--Stok adedi 10’dan az olan ürünleri listele
SELECT UrunAdi, Stok 
FROM Urun
WHERE Stok < 10;

--GROUP BY ve HAVING Sorgularý

--Þehirlere göre müþteri sayýsý
SELECT Sehir, COUNT(*) AS MusteriSayisi
FROM Musteri
GROUP BY Sehir;

--Kategoriye göre ürün sayýsý
SELECT K.KategoriAdi, COUNT(U.UrunID) AS UrunSayisi
FROM Kategori K
LEFT JOIN Urun U ON K.KategoriID = U.KategoriID
GROUP BY K.KategoriAdi;

--Her müþterinin toplam sipariþ tutarý
SELECT M.Ad + ' ' + M.Soyad AS MusteriAdi, SUM(S.ToplamTutar) AS ToplamSiparis
FROM Musteri M
JOIN Siparis S ON M.MusteriID = S.MusteriID
GROUP BY M.Ad, M.Soyad;

--Toplam sipariþi 20.000 TL’den fazla olan müþteriler
SELECT M.Ad + ' ' + M.Soyad AS MusteriAdi, SUM(S.ToplamTutar) AS ToplamSiparis
FROM Musteri M
JOIN Siparis S ON M.MusteriID = S.MusteriID
GROUP BY M.Ad, M.Soyad
HAVING SUM(S.ToplamTutar) > 20000;

--JOIN Sorgularý

--Sipariþlerle birlikte müþteri bilgilerini getir
SELECT S.SiparisID, M.Ad, M.Soyad, S.SiparisTarihi, S.ToplamTutar
FROM Siparis S
JOIN Musteri M ON S.MusteriID = M.MusteriID;

--Sipariþ detaylarýný ürün isimleriyle birlikte getir
SELECT SD.SiparisID, U.UrunAdi, SD.Adet, SD.BirimFiyat
FROM Siparis_Detay SD
JOIN Urun U ON SD.UrunID = U.UrunID;

--Hiç sipariþ vermemiþ müþterileri listele
SELECT M.MusteriID, M.Ad, M.Soyad
FROM Musteri M
LEFT JOIN Siparis S ON M.MusteriID = S.MusteriID
WHERE S.SiparisID IS NULL;

--Hiç satýlmamýþ ürünleri listele
SELECT U.UrunID, U.UrunAdi
FROM Urun U
LEFT JOIN Siparis_Detay SD ON U.UrunID = SD.UrunID
WHERE SD.SiparisID IS NULL;

--Ýleri Raporlama Sorgularý

--En çok sipariþ veren 5 müþteri
SELECT TOP 5 M.Ad + ' ' + M.Soyad AS MusteriAdi, SUM(S.ToplamTutar) AS ToplamSiparis
FROM Musteri M
JOIN Siparis S ON M.MusteriID = S.MusteriID
GROUP BY M.Ad, M.Soyad
ORDER BY SUM(S.ToplamTutar) DESC;

--En çok satýlan 5 ürün
SELECT TOP 5 U.UrunAdi, SUM(SD.Adet) AS ToplamAdet
FROM Siparis_Detay SD
JOIN Urun U ON SD.UrunID = U.UrunID
GROUP BY U.UrunAdi
ORDER BY SUM(SD.Adet) DESC;

--En çok gelir getiren 3 kategori
SELECT TOP 3 K.KategoriAdi, SUM(SD.Adet * SD.BirimFiyat) AS ToplamSatis
FROM Siparis_Detay SD
JOIN Urun U ON SD.UrunID = U.UrunID
JOIN Kategori K ON U.KategoriID = K.KategoriID
GROUP BY K.KategoriAdi
ORDER BY ToplamSatis DESC;

--En çok satýþ yapan 3 satýcý
SELECT TOP 3 Sa.SaticiAdi, SUM(SD.Adet * SD.BirimFiyat) AS ToplamSatis
FROM Siparis_Detay SD
JOIN Urun U ON SD.UrunID = U.UrunID
JOIN Satici Sa ON U.SaticiID = Sa.SaticiID
GROUP BY Sa.SaticiAdi
ORDER BY ToplamSatis DESC;

--Ortalama sipariþ tutarýnýn üstünde sipariþ veren müþteriler
SELECT M.Ad + ' ' + M.Soyad AS MusteriAdi, AVG(S.ToplamTutar) AS OrtalamaSiparis
FROM Musteri M
JOIN Siparis S ON M.MusteriID = S.MusteriID
GROUP BY M.Ad, M.Soyad
HAVING AVG(S.ToplamTutar) > (SELECT AVG(ToplamTutar) FROM Siparis);

--Aylýk bazda toplam satýþ tutarlarý
SELECT YEAR(SiparisTarihi) AS Yil, MONTH(SiparisTarihi) AS Ay, SUM(ToplamTutar) AS ToplamSatis
FROM Siparis
GROUP BY YEAR(SiparisTarihi), MONTH(SiparisTarihi)
ORDER BY Yil, Ay;

--UPDATE / DELETE Örnekleri

--Müþteri bilgisini güncelleme
UPDATE Musteri
SET Telefon = '05009998877'
WHERE Ad = N'Ahmet' AND Soyad = N'Yýlmaz';

--Ürün stok azaltma (ör: iPhone 14’ten 1 eksilt)
UPDATE Urun
SET Stok = Stok - 1
WHERE UrunAdi = N'iPhone 14';

--Bir müþteriyi silme (ör: sipariþi olmayan müþteri)
DELETE FROM Musteri
WHERE MusteriID NOT IN (SELECT DISTINCT MusteriID FROM Siparis);

--Stoðu 0 olan ürünleri silme
DELETE FROM Urun
WHERE Stok <= 0;

--Trigger (stok azaltma)
CREATE TRIGGER trg_StokAzalt
ON Siparis_Detay
AFTER INSERT
AS
BEGIN
    UPDATE Urun
    SET Stok = Stok - i.Adet
    FROM Urun U
    JOIN inserted i ON U.UrunID = i.UrunID;
END;








