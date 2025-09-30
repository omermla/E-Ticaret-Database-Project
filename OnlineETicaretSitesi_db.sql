--Veritaban� Olu�turma
IF DB_ID(N'ETicaretPro50') IS NULL
    CREATE DATABASE ETicaretPro50;
GO

USE ETicaretPro50;
GO

SELECT DB_NAME() AS CurrentDatabase;


USE ETicaretPro50;
GO

-- M��teri Tablosu
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

-- Sat�c� Tablosu
CREATE TABLE Satici (
    SaticiID INT IDENTITY(1,1) PRIMARY KEY,
    SaticiAdi NVARCHAR(100) NOT NULL,
    IletisimEmail NVARCHAR(100),
    Telefon NVARCHAR(20),
    Sehir NVARCHAR(50)
);

-- �r�n Tablosu
CREATE TABLE Urun (
    UrunID INT IDENTITY(1,1) PRIMARY KEY,
    UrunAdi NVARCHAR(100) NOT NULL,
    Fiyat DECIMAL(10,2) NOT NULL,
    Stok INT NOT NULL,
    KategoriID INT FOREIGN KEY REFERENCES Kategori(KategoriID),
    SaticiID INT FOREIGN KEY REFERENCES Satici(SaticiID)
);

-- Sipari� Tablosu
CREATE TABLE Siparis (
    SiparisID INT IDENTITY(1,1) PRIMARY KEY,
    MusteriID INT FOREIGN KEY REFERENCES Musteri(MusteriID),
    SiparisTarihi DATE DEFAULT GETDATE(),
    ToplamTutar DECIMAL(10,2)
);

-- Sipari� Detay Tablosu
CREATE TABLE Siparis_Detay (
    DetayID INT IDENTITY(1,1) PRIMARY KEY,
    SiparisID INT FOREIGN KEY REFERENCES Siparis(SiparisID),
    UrunID INT FOREIGN KEY REFERENCES Urun(UrunID),
    Adet INT NOT NULL,
    BirimFiyat DECIMAL(10,2) NOT NULL
);

--Kategori ve Sat�c� Verileri
INSERT INTO Kategori (KategoriAdi, Aciklama)
VALUES
(N'Elektronik', N'Telefon, bilgisayar ve di�er elektronik �r�nler'),
(N'Giyim', N'Kad�n, erkek ve �ocuk giyim �r�nleri'),
(N'Ev & Ya�am', N'Mobilya, dekorasyon ve ev e�yalar�'),
(N'Spor', N'Spor malzemeleri ve ekipmanlar�'),
(N'Kozmetik', N'Makyaj ve bak�m �r�nleri'),
(N'Kitap', N'Roman, ders kitab� ve di�er yay�nlar'),
(N'Oyuncak', N'�ocuk oyuncaklar� ve oyun setleri'),
(N'Mutfak', N'Mutfak gere�leri ve yemek tak�mlar�'),
(N'Bah�e', N'Bah�e mobilyas� ve ekipmanlar�'),
(N'M�zik', N'Enstr�manlar ve m�zik ekipmanlar�'),
(N'K�rtasiye', N'Defter, kalem ve ofis malzemeleri'),
(N'Petshop', N'Evcil hayvan �r�nleri');

INSERT INTO Satici (SaticiAdi, IletisimEmail, Telefon, Sehir)
VALUES
(N'TeknoMarket', 'info@teknomarket.com', '02122334455', N'�stanbul'),
(N'ModaD�nyas�', 'iletisim@modadunyasi.com', '03124445566', N'Ankara'),
(N'EvShop', 'destek@evshop.com', '02326667788', N'�zmir'),
(N'Sportify', 'info@sportify.com', '02223334455', N'Bursa'),
(N'BeautyStore', 'info@beautystore.com', '02164561234', N'Antalya'),
(N'BookWorld', 'info@bookworld.com', '02123335566', N'Adana'),
(N'ToyPlanet', 'info@toyplanet.com', '03126549877', N'Gaziantep'),
(N'MusicHouse', 'info@musichouse.com', '02125557799', N'Eski�ehir');

SELECT * FROM Kategori;
SELECT * FROM Satici;

--M��teri Ekleme
USE ETicaretPro50;
GO

INSERT INTO Musteri (Ad, Soyad, Email, Telefon, Sehir)
VALUES
(N'Ahmet', N'Y�lmaz', 'ahmet.yilmaz1@example.com', '05001110001', N'�stanbul'),
(N'Ay�e', N'Demir', 'ayse.demir@example.com', '05001110002', N'Ankara'),
(N'Mehmet', N'Kaya', 'mehmet.kaya@example.com', '05001110003', N'�zmir'),
(N'Elif', N'�elik', 'elif.celik@example.com', '05001110004', N'Bursa'),
(N'Murat', N'Arslan', 'murat.arslan@example.com', '05001110005', N'Antalya'),
(N'Zeynep', N'Ko�', 'zeynep.koc@example.com', '05001110006', N'Adana'),
(N'Emre', N'Polat', 'emre.polat@example.com', '05001110007', N'Trabzon'),
(N'Fatma', N'�ahin', 'fatma.sahin@example.com', '05001110008', N'Konya'),
(N'Can', N'Acar', 'can.acar@example.com', '05001110009', N'Eski�ehir'),
(N'Selin', N'Kurt', 'selin.kurt@example.com', '05001110010', N'Samsun'),
(N'Burak', N'Turan', 'burak.turan@example.com', '05001110011', N'Mersin'),
(N'Gamze', N'�zdemir', 'gamze.ozdemir@example.com', '05001110012', N'Sakarya'),
(N'Hasan', N'Tekin', 'hasan.tekin@example.com', '05001110013', N'Denizli'),
(N'Yasemin', N'Ayd�n', 'yasemin.aydin@example.com', '05001110014', N'Malatya'),
(N'Serkan', N'�etin', 'serkan.cetin@example.com', '05001110015', N'Kayseri'),
(N'Hande', N'G�ne�', 'hande.gunes@example.com', '05001110016', N'Bal�kesir'),
(N'Tolga', N'Aksoy', 'tolga.aksoy@example.com', '05001110017', N'Gaziantep'),
(N'Esra', N'K�l��', 'esra.kilic@example.com', '05001110018', N'Sivas'),
(N'Onur', N'�zt�rk', 'onur.ozturk@example.com', '05001110019', N'Ordu'),
(N'Derya', N'Aslan', 'derya.aslan@example.com', '05001110020', N'�orum'),
(N'Kerem', N'Ko�ak', 'kerem.kocak@example.com', '05001110021', N'Ayd�n'),
(N'Buse', N'Do�an', 'buse.dogan@example.com', '05001110022', N'Mu�la'),
(N'Kaan', N'�zkan', 'kaan.ozkan@example.com', '05001110023', N'Tekirda�'),
(N'Nil', N'Turan', 'nil.turan@example.com', '05001110024', N'U�ak'),
(N'Arda', N'Y�ld�r�m', 'arda.yildirim@example.com', '05001110025', N'Mardin'),
(N'Melis', N'Erdem', 'melis.erdem@example.com', '05001110026', N'Hatay'),
(N'Alper', N'�al��kan', 'alper.caliskan@example.com', '05001110027', N'Batman'),
(N'Pelin', N'Bulut', 'pelin.bulut@example.com', '05001110028', N'Van'),
(N'Engin', N'Tekta�', 'engin.tektas@example.com', '05001110029', N'Rize'),
(N'�rem', N'Soylu', 'irem.soylu@example.com', '05001110030', N'Tokat'),
(N'Tuna', N'Acar', 'tuna.acar@example.com', '05001110031', N'Erzurum'),
(N'Meryem', N'Uzun', 'meryem.uzun@example.com', '05001110032', N'�anakkale'),
(N'Batuhan', N'Topal', 'batuhan.topal@example.com', '05001110033', N'Manisa'),
(N'Cemre', N'Uz', 'cemre.uz@example.com', '05001110034', N'Aksaray'),
(N'Volkan', N'Yal��n', 'volkan.yalcin@example.com', '05001110035', N'Kocaeli'),
(N'Nazl�', N'�zer', 'nazli.ozer@example.com', '05001110036', N'Yozgat'),
(N'G�khan', N'Balc�', 'gokhan.balci@example.com', '05001110037', N'Karaman'),
(N'�layda', N'Yaman', 'ilayda.yaman@example.com', '05001110038', N'Tokat'),
(N'Mustafa', N'Tuna', 'mustafa.tuna@example.com', '05001110039', N'Zonguldak'),
(N'Deniz', N'Sar�', 'deniz.sari@example.com', '05001110040', N'Kastamonu'),
(N'�mer', N'Yavuz', 'omer.yavuz@example.com', '05001110041', N'K�r�ehir'),
(N'Cansu', N'Ta�', 'cansu.tas@example.com', '05001110042', N'Bolu'),
(N'Erhan', N'Y�ld�z', 'erhan.yildiz@example.com', '05001110043', N'K�r�kkale'),
(N'Ece', N'Tek', 'ece.tek@example.com', '05001110044', N'Isparta'),
(N'Ferhat', N'Demirta�', 'ferhat.demirtas@example.com', '05001110045', N'Giresun'),
(N'Aylin', N'Turhan', 'aylin.turhan@example.com', '05001110046', N'K�tahya'),
(N'Yunus', N'Tekin', 'yunus.tekin@example.com', '05001110047', N'Mu�'),
(N'Bahar', N'Y�ld�z', 'bahar.yildiz@example.com', '05001110048', N'Nev�ehir'),
(N'Kemal', N'Korkmaz', 'kemal.korkmaz@example.com', '05001110049', N'A�r�'),
(N'Sevgi', N'Yal�n', 'sevgi.yalin@example.com', '05001110050', N'Ardahan'),
(N'Melih', N'Toprak', 'melih.toprak@example.com', '05001110051', N'Bart�n'),
(N'Asl�', N'Beyaz', 'asli.beyaz@example.com', '05001110052', N'Kilis'),
(N'Sinan', N'Kara', 'sinan.kara@example.com', '05001110053', N'Artvin'),
(N'Gizem', N'�ak�r', 'gizem.cakir@example.com', '05001110054', N'��rnak'),
(N'Levent', N'Demirci', 'levent.demirci@example.com', '05001110055', N'Elaz��'),
(N'Seda', N'Bayraktar', 'seda.bayraktar@example.com', '05001110056', N'Tunceli'),
(N'Tar�k', N'Y�lmazer', 'tarik.yilmazer@example.com', '05001110057', N'Hakkari'),
(N'Nur', N'Ak�ay', 'nur.akcay@example.com', '05001110058', N'Bayburt'),
(N'Almila', N'Ersoy', 'almila.ersoy@example.com', '05001110059', N'Kars'),
(N'Yusuf', N'Tekin', 'yusuf.tekin@example.com', '05001110060', N'Denizli');


SELECT COUNT(*) AS MusteriSayisi FROM Musteri;


--�r�n Ekleme
USE ETicaretPro50;
GO

INSERT INTO Urun (UrunAdi, Fiyat, Stok, KategoriID, SaticiID)
VALUES
-- Elektronik
(N'iPhone 14', 45000, 15, 1, 1),
(N'Samsung Galaxy S23', 40000, 20, 1, 1),
(N'Laptop Asus', 32000, 10, 1, 1),
(N'Kulakl�k JBL', 2500, 40, 1, 1),
(N'Ak�ll� Saat Apple Watch', 12000, 25, 1, 1),

-- Giyim
(N'Ti��rt', 250, 80, 2, 2),
(N'Kot Pantolon', 600, 60, 2, 2),
(N'Spor Ayakkab�', 1500, 45, 2, 2),
(N'Ceket', 2500, 20, 2, 2),
(N'Elbise', 1800, 30, 2, 2),

-- Ev & Ya�am
(N'Koltuk Tak�m�', 15000, 5, 3, 3),
(N'Yatak', 9000, 8, 3, 3),
(N'Hal�', 3000, 15, 3, 3),
(N'Lamba', 500, 25, 3, 3),
(N'Dolap', 7000, 10, 3, 3),

-- Spor
(N'Basketbol Topu', 750, 35, 4, 4),
(N'Futbol Topu', 650, 40, 4, 4),
(N'Damb�l Seti', 2200, 12, 4, 4),
(N'Spor �antas�', 400, 25, 4, 4),
(N'Ko�u Band�', 18000, 3, 4, 4),

-- Kozmetik
(N'Ruj', 250, 100, 5, 5),
(N'Fond�ten', 450, 80, 5, 5),
(N'Parf�m', 1500, 50, 5, 5),
(N'G�z Far� Paleti', 600, 60, 5, 5),
(N'Cilt Bak�m Kremi', 700, 40, 5, 5),

-- Kitap
(N'Roman - Su� ve Ceza', 150, 100, 6, 6),
(N'Ders Kitab� - Matematik', 200, 90, 6, 6),
(N'Tarih Kitab�', 180, 70, 6, 6),
(N'Fantastik Roman', 220, 80, 6, 6),
(N'Bilim Kurgu Roman�', 250, 60, 6, 6),

-- Oyuncak
(N'LEGO Seti', 900, 30, 7, 7),
(N'Puzzle 1000 Par�a', 400, 40, 7, 7),
(N'Bebek Barbie', 500, 50, 7, 7),
(N'Araba Oyuncak', 300, 60, 7, 7),
(N'Trendy Masa Oyunu', 700, 35, 7, 7),

-- Mutfak
(N'Tencere Seti', 1500, 20, 8, 3),
(N'�atal B��ak Tak�m�', 700, 30, 8, 3),
(N'Mutfak Robotu', 3500, 15, 8, 3),
(N'Tost Makinesi', 1200, 25, 8, 3),
(N'Kahve Makinesi', 4500, 12, 8, 3),

-- Bah�e
(N'Bah�e Sandalyesi', 800, 40, 9, 3),
(N'Bah�e Masas�', 2500, 10, 9, 3),
(N'�im Bi�me Makinesi', 5500, 8, 9, 3),
(N'Bah�e Sal�nca��', 4000, 5, 9, 3),
(N'Bah�e Ayd�nlatmas�', 600, 25, 9, 3),

-- M�zik
(N'Gitar', 3500, 20, 10, 8),
(N'Keman', 4000, 15, 10, 8),
(N'Piyano', 25000, 3, 10, 8),
(N'Davul Seti', 12000, 5, 10, 8),
(N'Fl�t', 600, 30, 10, 8);

SELECT COUNT(*) AS UrunSayisi FROM Urun;
SELECT TOP 10 * FROM Urun;


--Sipari�
USE ETicaretPro50;
GO

-- 40 sipari� ekleme
INSERT INTO Siparis (MusteriID, SiparisTarihi, ToplamTutar)
VALUES
(1,  GETDATE(), 45250),   -- Ahmet: iPhone + Ti��rt
(2,  GETDATE(), 15000),   -- Ay�e: Koltuk Tak�m�
(3,  GETDATE(), 750),     -- Mehmet: Basketbol Topu
(4,  GETDATE(), 32000),   -- Elif: Laptop
(5,  GETDATE(), 1800),    -- Murat: Elbise
(6,  GETDATE(), 1500),    -- Zeynep: Spor Ayakkab�
(7,  GETDATE(), 250),     -- Emre: Ti��rt
(8,  GETDATE(), 6000),    -- Fatma: Hal� + Lamba
(9,  GETDATE(), 2500),    -- Can: Ceket
(10, GETDATE(), 900),     -- Selin: LEGO Seti
(11, GETDATE(), 250),     -- Burak: Ruj
(12, GETDATE(), 4500),    -- Gamze: Kahve Makinesi
(13, GETDATE(), 2200),    -- Hasan: Damb�l Seti
(14, GETDATE(), 150),     -- Yasemin: Roman
(15, GETDATE(), 5500),    -- Serkan: �im Bi�me Makinesi
(16, GETDATE(), 700),     -- Hande: �atal B��ak Tak�m�
(17, GETDATE(), 4000),    -- Tolga: Keman
(18, GETDATE(), 25000),   -- Esra: Piyano
(19, GETDATE(), 180),     -- Onur: Tarih Kitab�
(20, GETDATE(), 250),     -- Derya: Ruj
(21, GETDATE(), 600),     -- Kerem: G�z Far� Paleti
(22, GETDATE(), 3500),    -- Buse: Mutfak Robotu
(23, GETDATE(), 1200),    -- Kaan: Tost Makinesi
(24, GETDATE(), 45000),   -- Nil: iPhone 14
(25, GETDATE(), 9000),    -- Arda: Yatak
(26, GETDATE(), 18000),   -- Melis: Ko�u Band�
(27, GETDATE(), 2500),    -- Alper: Parf�m + Puzzle
(28, GETDATE(), 7000),    -- Pelin: Dolap
(29, GETDATE(), 150),     -- Engin: Roman
(30, GETDATE(), 3500),    -- �rem: Gitar
(31, GETDATE(), 220),     -- Tuna: Fantastik Roman
(32, GETDATE(), 500),     -- Meryem: Lamba
(33, GETDATE(), 1800),    -- Batuhan: Elbise
(34, GETDATE(), 650),     -- Cemre: Futbol Topu
(35, GETDATE(), 1500),    -- Volkan: Spor Ayakkab�
(36, GETDATE(), 250),     -- Nazl�: Ruj
(37, GETDATE(), 4000),    -- G�khan: Bah�e Masas�
(38, GETDATE(), 12000),   -- �layda: Davul Seti
(39, GETDATE(), 700),     -- Mustafa: Cilt Bak�m Kremi
(40, GETDATE(), 4500);    -- Deniz: Kahve Makinesi


--Sipari� Detaylar�
INSERT INTO Siparis_Detay (SiparisID, UrunID, Adet, BirimFiyat)
VALUES
(1, 1, 1, 45000),  -- iPhone
(1, 6, 1, 250),    -- Ti��rt
(2, 11, 1, 15000), -- Koltuk Tak�m�
(3, 16, 1, 750),   -- Basketbol Topu
(4, 3, 1, 32000),  -- Laptop
(5, 10, 1, 1800),  -- Elbise
(6, 8, 1, 1500),   -- Spor Ayakkab�
(7, 6, 1, 250),    -- Ti��rt
(8, 13, 1, 3000),  -- Hal�
(8, 14, 2, 500),   -- Lamba
(9, 9, 1, 2500),   -- Ceket
(10, 31, 1, 900),  -- LEGO
(11, 21, 1, 250),  -- Ruj
(12, 39, 1, 4500), -- Kahve Makinesi
(13, 18, 1, 2200), -- Damb�l
(14, 26, 1, 150),  -- Roman
(15, 43, 1, 5500), -- �im Bi�me
(16, 33, 1, 700),  -- �atal B��ak
(17, 46, 1, 4000), -- Keman
(18, 47, 1, 25000),-- Piyano
(19, 28, 1, 180),  -- Tarih Kitab�
(20, 21, 1, 250),  -- Ruj
(21, 24, 1, 600),  -- G�z Far�
(22, 36, 1, 3500), -- Mutfak Robotu
(23, 37, 1, 1200), -- Tost Makinesi
(24, 1, 1, 45000), -- iPhone
(25, 12, 1, 9000), -- Yatak
(26, 20, 1, 18000),-- Ko�u Band�
(27, 23, 1, 1500), -- Parf�m
(27, 32, 1, 400),  -- Puzzle
(28, 15, 1, 7000), -- Dolap
(29, 26, 1, 150),  -- Roman
(30, 45, 1, 3500), -- Gitar
(31, 29, 1, 220),  -- Fantastik Roman
(32, 14, 1, 500),  -- Lamba
(33, 10, 1, 1800), -- Elbise
(34, 17, 1, 650),  -- Futbol Topu
(35, 8, 1, 1500),  -- Spor Ayakkab�
(36, 21, 1, 250),  -- Ruj
(37, 41, 1, 4000), -- Bah�e Masas�
(38, 49, 1, 12000),-- Davul
(39, 25, 1, 700),  -- Cilt Kremi
(40, 39, 1, 4500); -- Kahve Makinesi


SELECT COUNT(*) FROM Siparis;  
SELECT COUNT(*) FROM Siparis_Detay;  


--T�m m��terileri listele
SELECT * FROM Musteri;


--�stanbul�daki m��terileri listele
SELECT Ad, Soyad, Sehir 
FROM Musteri
WHERE Sehir = N'�stanbul';

--Fiyat� 10.000 TL�den b�y�k �r�nleri listele
SELECT UrunAdi, Fiyat 
FROM Urun
WHERE Fiyat > 10000;

--Stok adedi 10�dan az olan �r�nleri listele
SELECT UrunAdi, Stok 
FROM Urun
WHERE Stok < 10;

--GROUP BY ve HAVING Sorgular�

--�ehirlere g�re m��teri say�s�
SELECT Sehir, COUNT(*) AS MusteriSayisi
FROM Musteri
GROUP BY Sehir;

--Kategoriye g�re �r�n say�s�
SELECT K.KategoriAdi, COUNT(U.UrunID) AS UrunSayisi
FROM Kategori K
LEFT JOIN Urun U ON K.KategoriID = U.KategoriID
GROUP BY K.KategoriAdi;

--Her m��terinin toplam sipari� tutar�
SELECT M.Ad + ' ' + M.Soyad AS MusteriAdi, SUM(S.ToplamTutar) AS ToplamSiparis
FROM Musteri M
JOIN Siparis S ON M.MusteriID = S.MusteriID
GROUP BY M.Ad, M.Soyad;

--Toplam sipari�i 20.000 TL�den fazla olan m��teriler
SELECT M.Ad + ' ' + M.Soyad AS MusteriAdi, SUM(S.ToplamTutar) AS ToplamSiparis
FROM Musteri M
JOIN Siparis S ON M.MusteriID = S.MusteriID
GROUP BY M.Ad, M.Soyad
HAVING SUM(S.ToplamTutar) > 20000;

--JOIN Sorgular�

--Sipari�lerle birlikte m��teri bilgilerini getir
SELECT S.SiparisID, M.Ad, M.Soyad, S.SiparisTarihi, S.ToplamTutar
FROM Siparis S
JOIN Musteri M ON S.MusteriID = M.MusteriID;

--Sipari� detaylar�n� �r�n isimleriyle birlikte getir
SELECT SD.SiparisID, U.UrunAdi, SD.Adet, SD.BirimFiyat
FROM Siparis_Detay SD
JOIN Urun U ON SD.UrunID = U.UrunID;

--Hi� sipari� vermemi� m��terileri listele
SELECT M.MusteriID, M.Ad, M.Soyad
FROM Musteri M
LEFT JOIN Siparis S ON M.MusteriID = S.MusteriID
WHERE S.SiparisID IS NULL;

--Hi� sat�lmam�� �r�nleri listele
SELECT U.UrunID, U.UrunAdi
FROM Urun U
LEFT JOIN Siparis_Detay SD ON U.UrunID = SD.UrunID
WHERE SD.SiparisID IS NULL;

--�leri Raporlama Sorgular�

--En �ok sipari� veren 5 m��teri
SELECT TOP 5 M.Ad + ' ' + M.Soyad AS MusteriAdi, SUM(S.ToplamTutar) AS ToplamSiparis
FROM Musteri M
JOIN Siparis S ON M.MusteriID = S.MusteriID
GROUP BY M.Ad, M.Soyad
ORDER BY SUM(S.ToplamTutar) DESC;

--En �ok sat�lan 5 �r�n
SELECT TOP 5 U.UrunAdi, SUM(SD.Adet) AS ToplamAdet
FROM Siparis_Detay SD
JOIN Urun U ON SD.UrunID = U.UrunID
GROUP BY U.UrunAdi
ORDER BY SUM(SD.Adet) DESC;

--En �ok gelir getiren 3 kategori
SELECT TOP 3 K.KategoriAdi, SUM(SD.Adet * SD.BirimFiyat) AS ToplamSatis
FROM Siparis_Detay SD
JOIN Urun U ON SD.UrunID = U.UrunID
JOIN Kategori K ON U.KategoriID = K.KategoriID
GROUP BY K.KategoriAdi
ORDER BY ToplamSatis DESC;

--En �ok sat�� yapan 3 sat�c�
SELECT TOP 3 Sa.SaticiAdi, SUM(SD.Adet * SD.BirimFiyat) AS ToplamSatis
FROM Siparis_Detay SD
JOIN Urun U ON SD.UrunID = U.UrunID
JOIN Satici Sa ON U.SaticiID = Sa.SaticiID
GROUP BY Sa.SaticiAdi
ORDER BY ToplamSatis DESC;

--Ortalama sipari� tutar�n�n �st�nde sipari� veren m��teriler
SELECT M.Ad + ' ' + M.Soyad AS MusteriAdi, AVG(S.ToplamTutar) AS OrtalamaSiparis
FROM Musteri M
JOIN Siparis S ON M.MusteriID = S.MusteriID
GROUP BY M.Ad, M.Soyad
HAVING AVG(S.ToplamTutar) > (SELECT AVG(ToplamTutar) FROM Siparis);

--Ayl�k bazda toplam sat�� tutarlar�
SELECT YEAR(SiparisTarihi) AS Yil, MONTH(SiparisTarihi) AS Ay, SUM(ToplamTutar) AS ToplamSatis
FROM Siparis
GROUP BY YEAR(SiparisTarihi), MONTH(SiparisTarihi)
ORDER BY Yil, Ay;

--UPDATE / DELETE �rnekleri

--M��teri bilgisini g�ncelleme
UPDATE Musteri
SET Telefon = '05009998877'
WHERE Ad = N'Ahmet' AND Soyad = N'Y�lmaz';

--�r�n stok azaltma (�r: iPhone 14�ten 1 eksilt)
UPDATE Urun
SET Stok = Stok - 1
WHERE UrunAdi = N'iPhone 14';

--Bir m��teriyi silme (�r: sipari�i olmayan m��teri)
DELETE FROM Musteri
WHERE MusteriID NOT IN (SELECT DISTINCT MusteriID FROM Siparis);

--Sto�u 0 olan �r�nleri silme
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








