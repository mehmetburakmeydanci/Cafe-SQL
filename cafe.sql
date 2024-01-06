create database cafe
use cafe

CREATE TABLE Personel (
    personel_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    plaka VARCHAR(20),
    ad VARCHAR(50),
    soyad VARCHAR(50),
    tc_no VARCHAR(11) NOT NULL,
    telefon_no VARCHAR(15),
    e_mail VARCHAR(50),
    maas DECIMAL(10, 2),
    ise_baslama_tarihi DATE,
	adres varchar(255)
);

CREATE TABLE Unvan (
    unvan_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    personel_id INT,
    unvan_adi VARCHAR(50),
    FOREIGN KEY (personel_id) REFERENCES Personel(personel_id)
);

CREATE TABLE Musteri (
    musteri_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ad VARCHAR(50),
    soyad VARCHAR(50),
    telefon VARCHAR(15),
    email VARCHAR(100),
	adres varchar(255)
);

CREATE TABLE Sube (
    sube_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Sube_Ad NVARCHAR(MAX),
    Sube_Tel NCHAR(11),
	adres varchar(255) NULL
);

CREATE TABLE Siparis (
    siparis_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Siparis_Tarihi DATE,
    menuID INT NOT NULL,
    musteri_id INT
	FOREIGN KEY (menuID) REFERENCES Menu(menu_id) 
);

CREATE TABLE Fatura (
    fatura_id INT PRIMARY KEY IDENTITY(1,1),
    islem_tarihi VARCHAR(50),
    odenecek_tutar VARCHAR(50),
    odeme_turu VARCHAR(50),
    siparis_id INT,
    FOREIGN KEY (siparis_id) REFERENCES Siparis(siparis_id)
);

CREATE TABLE Menu (
    menu_id INT PRIMARY KEY IDENTITY(1,1),
    Menu_Ad VARCHAR(50),
    Fiyat DECIMAL(10, 2)
);


CREATE TABLE Kategori (
    kategori_id INT PRIMARY KEY IDENTITY(1,1),
    Kategori_Ad VARCHAR(50)
);


CREATE TABLE Urun (
    urun_id INT PRIMARY KEY IDENTITY(1,1),
    Urun_Ad VARCHAR(50),
    Menu_id INT,
    Kategori_id INT,
    FOREIGN KEY (Menu_id) REFERENCES Menu(menu_id),
    FOREIGN KEY (Kategori_id) REFERENCES Kategori(kategori_id)
);

CREATE TABLE SiparisDurumu (
    durum_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    siparis_id INT,
    durum VARCHAR(50),
    FOREIGN KEY (Siparis_id) REFERENCES Siparis(siparis_id)
);
/*ŞUBE GİRDİLERİ*/
insert into Sube values('İst.bahçelievler','02126212000','Şirinevler mah.zümrüt sk. no:4 İstanbul/Bahçelievler')
insert into Sube values('İst.avcılar','02126212002','Cihangir mah. asil sk. no:7 İstanbul/Avcılar')
insert into Sube values('İst.Beylidüzü','02126212005','Çengel mah. kiraz sk. no:2 İstanbul/Beylikdüzü') 
insert into Sube values('İst.Beylidüzü','02126212121',NULL)
insert into Sube values('Ank.bahçelievler','02127492000',NULL)
insert into Sube values('Ank.bahçelievler',null,'Yakup mah. şairler sk. no:3 Ankara/Bahçelievler')
insert into Sube values('Ank.Beypazarı','02127492001',NULL)
insert into Sube values('İzm.Çeşme','02123452000','Sedir mah. çiğdem sk. no:1 İzmir/Çeşme')
insert into Sube values('İzm.Menemen',NULL,NULL)
insert into Sube values('Ant.Alanya','02129122000','Aykut mah. değerli sk. Antalya/Alanya')
insert into Sube values('Ant.Kaş','02129122003','Fesleğen mah. Kemal Sunal sk. no:2 Antalya/Kaş')
insert into Sube values('Ant.Elmalı',NULL,'Zeki mah. zakkum cad. elma3 sk. Antalya/Kaş')
insert into Sube values('Adn.Çukurova','02120040140','Esen mah. Sevda sk. no:9 Adana/Çukurova')
insert into Sube values('İst.Bakırköy','02126212008',NULL)
insert into Sube values('İst.Levent',NULL,'Ayaz mah. maden1 sk. no:4 İstanbul/Levent')

/*MENÜ GİRDİLERİ*/
insert into Menu values('2 kişilik Kahvaltı','162.00')
insert into Menu values('Aile Boyu Kahvaltı','350.75')
insert into Menu values('Tek Kişilik Kahvaltı','90.50')
insert into Menu values('Tatlı-Kahve','150.00')
insert into Menu values('Hafta içi Ne yersen','312.25')
insert into Menu values('Pazar Süprizi','179.90')
insert into Menu values('2 tatlı-1 kahve','190.50')
insert into Menu values('Maç Klasiği','216.00')
insert into Menu values('Doğum günü özel','465.90')
insert into Menu values('Sevindiren menü','143.25')

/*MÜŞTERİ GİRDİLERİ*/
INSERT INTO Musteri
VALUES
    ( 'Efe', 'Yaman', '1234567890', 'e.ymn345@gmail.com',
'Cihangir, Şehit Jandarma Komando, J. Kom. Er Hakan Öner Sk. No:1, 34310 Avcılar/İstanbul')
   INSERT INTO Musteri
VALUES ( 'Ayşenur Ceren', 'Öztürk', '1234567891', 'aysenurcrn1@gmail.com',null)
  INSERT INTO Musteri
VALUES  ( 'Eren', 'Yıldız', '1234567892', 'ern155@gmail.com',null)
  INSERT INTO Musteri
VALUES  ( 'Mehmet Burak', 'Meydancı', '1234567893', 'Mhmtbrk31@gmail.com',null)
INSERT INTO Musteri
VALUES ( 'Ahmet', 'Özçivit', '1234567894', 'ahmtözç12@gmai.com',null)
INSERT INTO Musteri
VALUES ( 'Dilara', 'Kurtul', '1234567895', 'Dlrkrtll01@gmail.com',null)
INSERT INTO Musteri
VALUES  ( 'Ahmet', 'Dursun', '1234567896', 'ahtdrsn38@gmail.com',
'Sahil Mahallesi Çuğra Mevkii No:72, 10500 Erdek/Balıkesir')
INSERT INTO Musteri
VALUES ( 'osman', 'güder', '1234567897', 'osmngdr10@gmail.com',null)
INSERT INTO Musteri
VALUES  ( 'ferit', 'çakmak', '1234567898', 'feritckmk61@gmail.com',null)
INSERT INTO Musteri
VALUES  ( 'ali', 'gök', '1234567899', 'alibtgk21@gmail.com',
'Kocatepe Mah. 12. Sok. C-28 Blok Kat:2, Yağ İskelesi Cd., 34045 Bayrampaşa/İstanbul') 
INSERT INTO Musteri
VALUES ( 'yavuz', 'selim', '1234567800', 'yavzslm@gmail.com',
'Poyraz, 34829 Beykoz/İstanbul')
INSERT INTO Musteri
VALUES ( 'berzan', 'burhan', '1234567801', 'berznbrh24@gmail.com',null)
INSERT INTO Musteri
VALUES ( 'katip', 'çelebi', '1234567802', 'ktpçlb@gmail.com',null)
INSERT INTO Musteri
VALUES ( 'alp', 'arslan', '1234567803', 'alparsln81@gmail.com',null)
INSERT INTO Musteri
VALUES ('fatih', 'han', '1234567804', 'fathan10gmail.com',
'Sütlüce, Karaağaç Cd 12/A, 34445 Beyoğlu/İstanbul')
INSERT INTO Musteri
VALUES ( 'güneş', 'taş', '12542742803', 'tasgun1@gmail.com',null)
INSERT INTO Musteri
VALUES ( 'ecem', 'seyit', null, 'eceyit@gmail.com',null)
INSERT INTO Musteri
VALUES ( 'eda', 'ulu', null, null,null)
INSERT INTO Musteri
VALUES ( 'efe', 'topal', '12376522203', 'efeT56@gmail.com',null)
INSERT INTO Musteri
VALUES ( 'kuzey', 'arlan', '12356482103', null,null)

/*FATURA GİRDİLERİ*/
INSERT INTO Fatura
VALUES 
    ('2023-01-01', '150.00', 'Nakit', 1)
INSERT INTO Fatura
VALUES 
    ('2023-02-03', '200.50', 'Kredi Kartı', 2)
INSERT INTO Fatura
VALUES 
    ('2023-03-15', '100.25', 'Havale', 3)
INSERT INTO Fatura
VALUES 
    ('2023-04-22', '75.60', 'Nakit', 4)
INSERT INTO Fatura
VALUES 
    ('2023-05-10', '300.75', 'Kapıda Ödeme', 5)
INSERT INTO Fatura
VALUES 
    ('2023-06-18', '180.20', 'Kredi Kartı', 6)
INSERT INTO Fatura
VALUES 
    ('2023-07-29', '250.30', 'Havale', 7)
INSERT INTO Fatura
VALUES 
    ('2023-08-14', '90.50', 'Nakit', 8)
INSERT INTO Fatura
VALUES 
    ('2023-09-27', '120.75', 'Kapıda Ödeme', 9)
INSERT INTO Fatura
VALUES 
    ('2023-10-05', '175.40', 'Kredi Kartı', 10)
INSERT INTO Fatura
VALUES 
    ('2023-11-11', '210.80', 'Havale', 11)
INSERT INTO Fatura
VALUES 
    ('2023-12-25', '95.20', 'Nakit', 12)
INSERT INTO Fatura
VALUES 
    ('2024-01-03', '180.00', 'Kapıda Ödeme', 13)
INSERT INTO Fatura
VALUES 
    ('2024-02-14', '220.50', 'Kredi Kartı', 14)
INSERT INTO Fatura
VALUES 
    ('2024-03-30', '130.25', 'Havale', 15)
INSERT INTO Fatura
VALUES 
    ('2024-02-14', '220.50', 'Kredi Kartı', 16)
INSERT INTO Fatura
VALUES 
    ('2024-02-14', '220.50', 'Kredi Kartı', 17)
INSERT INTO Fatura
VALUES 
    ('2024-02-14', '220.50', 'Nakit', 18)
INSERT INTO Fatura
VALUES 
    ('2024-02-14', '220.50', 'Kredi Kartı', 19)
	
	update Fatura set odeme_turu='Nakit' where odeme_turu='kapıda ödeme'

	/*SİPARİŞ GİRDİSİ*/
	INSERT INTO Siparis
VALUES ('2023-01-01',1,2)
INSERT INTO Siparis
VALUES ('2023-02-01',2,3)
INSERT INTO Siparis
VALUES ('2023-03-01',3,4)
INSERT INTO Siparis
VALUES ('2023-04-01',4,5)
INSERT INTO Siparis
VALUES ('2023-05-01',5,6)
INSERT INTO Siparis
VALUES ('2023-06-01',6,7)
INSERT INTO Siparis
VALUES ('2023-07-01',7,8)
INSERT INTO Siparis
VALUES ('2023-08-01',8,9)
INSERT INTO Siparis
VALUES ('2023-09-01',9,10)
INSERT INTO Siparis
VALUES ('2023-10-01',10,11)
INSERT INTO Siparis
VALUES ('2023-10-01',10,12)
INSERT INTO Siparis
VALUES ('2023-10-01',10,13)
INSERT INTO Siparis
VALUES ('2023-10-01',10,14)
INSERT INTO Siparis
VALUES ('2023-10-01',10,15)
INSERT INTO Siparis
VALUES ('2023-11-01',5,16)
INSERT INTO Siparis
VALUES ('2023-11-01',1,17)
INSERT INTO Siparis
VALUES ('2023-11-01',1,18)
INSERT INTO Siparis
VALUES ('2023-11-01',7,19)
INSERT INTO Siparis
VALUES ('2023-11-01',8,20)

/*KATEGORİ GİRDİLERİ*/
insert into Kategori values ('Yiyecek')
insert into Kategori values ('İçecek')
insert into Kategori values ('Ara Sıcak')
insert into Kategori values ('Nargile')
insert into Kategori values ('Atıştırmalık')
update Kategori set Kategori_Ad='Tatlı' where kategori_id=3;

/*ÜNVAN GİRDİLERİ*/
INSERT INTO Unvan
VALUES 
(1,'Garson')
INSERT INTO Unvan
VALUES 
(2, 'Komi')
INSERT INTO Unvan
VALUES 
(3,'Bulaşıkçı')
INSERT INTO Unvan
VALUES 
(4,'Şef')
INSERT INTO Unvan
VALUES 
(5,'Müdür')
INSERT INTO Unvan
VALUES 
(6,'Komi')
INSERT INTO Unvan
VALUES 
(7,'Garson')
INSERT INTO Unvan
VALUES 
(8,'Garson')
INSERT INTO Unvan
VALUES 
(9,'Şef')
INSERT INTO Unvan
VALUES 
(10,'Komi')
INSERT INTO Unvan
VALUES 
(11,'Garson')
INSERT INTO Unvan
VALUES 
(12,'Komi')
INSERT INTO Unvan
VALUES 
(13,'Garson')
INSERT INTO Unvan
VALUES 
(14,'Şef')
INSERT INTO Unvan
VALUES 
(15,'Garson')
INSERT INTO Unvan
VALUES 
(16,'Garson')
INSERT INTO Unvan
VALUES 
(17,'Garson')
INSERT INTO Unvan
VALUES 
(18,'Komi')
INSERT INTO Unvan
VALUES 
(20,'Bulaşıkçı')
INSERT INTO Unvan
VALUES 
(19,'Bulaşıkçı')


/*PERSONEL GİRDİSİ*/
INSERT INTO Personel VALUES 
('34 EHA 21', 'Ahmet', 'Yılmaz', '12345678901', '505 505 55 55', 'ahmet@gmail.com', 5000.00, '2022-01-14','a mahallesi tan sokak no:21 daire 12 istanbul/esenyurt')
INSERT INTO Personel VALUES 
('21 KUP 65', 'Arif', 'Kel', '12345678902', '555 333 22 55', 'arif@gmail.com', 7000.00, '2021-01-11','ban mahallesi kenan sokak no:1 daire 4 istanbul/bahçelievler')
INSERT INTO Personel VALUES 
('22 KAP 20', 'Ayça', 'Türk', '22345678901', '532 432 23 21', 'ayca@gmail.com', 8000.00, '2023-06-15','rana mahallesi mana sokak no:5 daire 10 istanbul/şirinevler')
INSERT INTO Personel VALUES 
('06 YTL 61', 'Ece', 'Tarık', '12345678905', '515 267 22 12', 'ece@gmail.com', 9000.00, '2023-01-27','kanal mahallesi çorak sokak no:21 daire 11 istanbul/bağcılar')
INSERT INTO Personel VALUES 
('34 KAL 78', 'Tarkan', 'Bal', '12345676901', '545 234 11 11', 'tarkan@gmail.com', 6000.00, '2023-01-29','çan mahallesi cansu sokak no:12 daire 23 istanbul/sarıyer')
INSERT INTO Personel VALUES 
('34 IKA 67', 'Buğra', 'Ton', '12345678091', '535 324 57 43', 'bugra@gmail.com', 7000.00, '2023-01-26','yan mahallesi berkay sokak no:14 daire 5 istanbul/bahçelievler');
INSERT INTO Personel VALUES 
('34 OLA 23', 'Faruk', 'Yıkılmaz', '12347658901', '546 574 77 75', 'faruk@gmail.com', 11000.00, '2023-01-21','yol mahallesi yarın sokak no:14 daire 2 istanbul/bahçelievler')
INSERT INTO Personel VALUES 
('34 KAN 25', 'Fahrettin', 'Yeşil', '23145678901', '551 235 54 45', 'fahrettin@gmail.com', 7000.00, '2023-01-04','veri mahallesi kantin sokak no:11 daire 1 istanbul/eyüp')
INSERT INTO Personel VALUES 
('01 CAB 01', 'Yakup', 'Bozdoğan', '31245678901', '541 654 12 23', 'yakup@gmail.com', 7000.00, '2023-01-15','yıl mahallesi yaş sokak no:22 daire 6 istanbul/mecidiyeköy') 
INSERT INTO Personel VALUES 
('11 TAT 14', 'Umut', 'Bulut', '12354678901', '542 545 32 32', 'umut@gmail.com', 9000.00, '2023-01-16','jale mahallesi sarı sokak no:24 daire 3 istanbul/bakırköy') 
INSERT INTO Personel VALUES 
('22 BY 75', 'Barış', 'Çiçek', '12345670891', '542 532 45 45', 'baris@gmail.com', 9000.00, '2023-01-15','zafer mahallesi yeşil sokak no:17 daire 4 istanbul/sarıyer')
INSERT INTO Personel VALUES 
('30 ALA 65', 'Kağan', 'Kır', '12345676766', '543 875 14 05', 'kagan@gmail.com', 4000.00, '2023-01-24','hürriyet mahallesi öz sokak no:11 daire 4 istanbul/sarıyer')
INSERT INTO Personel VALUES 
('22 ABC 11', 'Menekşe', 'Çam', '25432178901', '551 976 23 16', 'menekse@gmail.com', 3000.00, '2023-01-11','ötüken mahallesi konya sokak no:14 daire 2 istanbul/bahçelievler')
INSERT INTO Personel VALUES 
('23 TAC 01', 'Neşe', 'Mutlu', '15432187901', '542 354 76 34', 'nese@gmail.com', 7000.00, '2023-01-22','hür mahallesi kansız sokak no:15 daire 12 istanbul/avcılar')
INSERT INTO Personel VALUES 
('06 TR 01', 'Narin', 'Yankı', '22325672901', '544 511 54 05', 'narin@gmail.com', 7000.00, '2023-01-12','cihangir mahallesi kan sokak no:1 daire 2 istanbul/avcılar')
alter table Personel drop column plaka

INSERT INTO Personel VALUES 
('Tarkan', 'söğüt', '94255676901', '545 123 11 46', null, 5000.00, '2023-01-29',null)
INSERT INTO Personel VALUES 
('Han', 'Ton', '12341324091', '542 324 89 43', 'tonHan45@gmail.com', 5000.00, '2023-01-26','yan mahallesi kiraz sokak no:12 daire 3 istanbul/bahçelievler');
INSERT INTO Personel VALUES 
('Faruk', 'kılmaz', '12764925901', '546 556 77 25', null, 7000.00, '2023-01-21','sabancı mahallesi güz sokak no:14 daire 2 istanbul/bahçelievler')
INSERT INTO Personel VALUES 
('Fahri', 'gök', '23145612345', '551 235 96 69', null, 6000.00, '2023-01-04','dağ mahallesi 542. sokak no:11 daire 1 istanbul/eyüp')
INSERT INTO Personel VALUES 
('Yakup', 'doğan', '31248576921', '545 694 12 23', null, 6000.00, '2023-01-15','sezen mahallesi songül sokak no:22 daire 6 istanbul/mecidiyeköy') 


/*ÜRÜN GİRDİLERİ*/
insert into Urun Values ('Spagetti',10,1)
insert into Urun values ('Hamburger',6, 1)
insert into Urun values ('Pizza',1,1)
insert into Urun values ('Mantı',6,1)
insert into Urun values ('Latte',7,2)
insert into Urun values ('Filtre Kahve',7,2)
insert into Urun values ('Türk Kahvesi',7,2)
insert into Urun values ('Çikolatalı muffin',7,3)
insert into Urun values ('Donat',7,3)
insert into Urun values ('Çilekli Pasta',7,3)
insert into Urun values ('Kruvasan',7,3)
insert into Urun values ('Gazoz',9,2)
insert into Urun values ('Fanta',9,2)
insert into Urun values ('Su',2,2)
insert into Urun values ('Soda',2,2)
insert into Urun values ('Sigara Böreği',2,1)
insert into Urun values ('Patates',3,1)
insert into Urun values ('Kıymalı Börek',3,1)
insert into Urun values ('Peynirli Börek',2,1)
insert into Urun values ('Elma Nargile',8,4)
insert into Urun values ('Üzüm Nargile',8,4)
insert into Urun values ('Kiraz Nargile',8,4)
insert into Urun values ('Vişne Nargile',8,4)
insert into Urun values ('Kuruyemiş Tabağı',5,5)
insert into Urun values ('Şekerleme',5,3)
insert into Urun values ('Meyve Tabağı',10,5)
insert into Urun values ('Maç Atıştırma Tabağı',8,5)

/*SİPARİŞ DURUM GİRDİLERİ*/
insert into SiparisDurumu values(1,'teslim edildi')
insert into SiparisDurumu values(2,'teslim edildi')
insert into SiparisDurumu values(3,'teslim edildi')
insert into SiparisDurumu values(4,'hazırlanıyor')
insert into SiparisDurumu values(5,'teslim edildi')
insert into SiparisDurumu values(6,'hazırlanıyor')
insert into SiparisDurumu values(7,'teslim edildi')
insert into SiparisDurumu values(8,'hazırlanıyor')
insert into SiparisDurumu values(9,'teslim edildi')
insert into SiparisDurumu values(10,'hazırlanıyor')
insert into SiparisDurumu values(11,'hazırlanıyor')
insert into SiparisDurumu values(12,'teslim edildi')
insert into SiparisDurumu values(13,'hazırlanıyor')
insert into SiparisDurumu values(14,'teslim edildi')
insert into SiparisDurumu values(15,'teslim edildi')
insert into SiparisDurumu values(16,'hazırlanıyor')
insert into SiparisDurumu values(17,'hazırlanıyor')
insert into SiparisDurumu values(18,'teslim edildi')
insert into SiparisDurumu values(19,'hazırlanıyor')
insert into SiparisDurumu values(20,'teslim edildi')
