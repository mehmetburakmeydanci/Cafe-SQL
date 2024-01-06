
use cafe

alter table Sube add personel_id int ;

alter table Sube add  FOREIGN KEY (personel_id) REFERENCES Personel(personel_id);

select substring(upper(ad),0,2)+substring(lower(ad),2,len(ad)),upper(soyad) from Personel

select coalesce (convert(nchar,menu_id),'kategori bilinmiyor') as 'Ürün kategori',isnull(cast(Menu_id as nchar),'Menüsü bilinmiyor') as 'Ürün Menü'from Urun

select  round(odenecek_tutar,0)'Ödenecek Tutar' from Fatura F inner join Siparis S on F.siparis_id= S.Siparis_id

select ad,soyad,floor(maas)'maas'from personel order by personel_id asc

select ad,soyad,datediff(week,ise_baslama_tarihi,GETDATE())'çalıştığı hafta sayısı'from personel

update Menu set Fiyat=135.75 where menu_id=10 --eski fiyat 143.25'di.

select ad,soyad,sum(datepart(month,maas))'toplam çalıştığı ay sayısı' into yillik_gelir from personel group by ad,soyad

drop table yillik_gelir

select ad,soyad,maas,ise_baslama_tarihi,sum(maas*(datediff(month,ise_baslama_tarihi,getdate())))
'toplam ödeme' into çalisan_yillik_gelir from Personel group by ad,soyad,ise_baslama_tarihi,maas

select ad,soyad,
case 
when datepart(year,ise_baslama_tarihi)=datepart(year,getdate()) then 'yeni çalışan'
when datepart (year,ise_baslama_tarihi)<datepart(year,getdate()) and datepart (month,ise_baslama_tarihi)>18 then 'eski çalışan'
else 'kıdemli çalışan'
end
from Personel

select max(fiyat)'max menu fiyatı',min(fiyat)'min menu fiyatı'from Menu

alter table Personel drop column plaka
 
update Kategori set Kategori_Ad='Tatlı' where kategori_id=3;

SELECT * FROM Personel WHERE ad = 'Kenan';

SELECT SUM(maas) AS ToplamMaas FROM Personel;

SELECT AVG(maas) AS OrtalamaMaas FROM Personel;

SELECT ad, COUNT(*) AS KayitSayisi FROM Personel GROUP BY ad;

SELECT * FROM Personel WHERE ise_baslama_tarihi > '2022-01-01';

SELECT GETDATE() AS CurrentDateTime;
IF OBJECT_ID('tempdb..#TabloOrnegi') IS NOT NULL DROP TABLE #TabloOrnegi;

DECLARE @variable INT;
SET @variable = (SELECT COUNT(*) FROM Personel);
IF @variable > 100
BEGIN
    CREATE TABLE #TabloOrnegi (
        id INT PRIMARY KEY,
        ad VARCHAR(50)
    );
    INSERT INTO #TabloOrnegi (id, ad)
    SELECT personel_id, ad
    FROM Personel;
END


CREATE VIEW Personel_View with encryption as
SELECT * FROM Personel;

SELECT SUM(maas) AS ToplamMaas FROM Personel;

SELECT AVG(maas) AS OrtalamaMaas FROM Personel; 

SELECT COUNT(*) AS CalisanSayisi, maas FROM Personel GROUP BY maas;

SELECT maas, COUNT(*) AS CalisanSayisi FROM Personel GROUP BY maas HAVING maas > 6000;

SELECT * FROM Personel ORDER BY maas DESC;

SELECT TOP 3 WITH TIES * FROM Musteri ORDER BY ad, soyad;

SELECT * FROM Musteri WHERE telefon LIKE '123%';

SELECT * FROM Personel
RIGHT OUTER JOIN Unvan ON Personel.personel_id = Unvan.personel_id;

SELECT * FROM Personel
LEFT OUTER JOIN Unvan ON Personel.personel_id = Unvan.personel_id;

SELECT * FROM Personel
INNER JOIN Unvan ON Personel.personel_id = Unvan.personel_id;

SELECT * FROM Personel
FULL OUTER JOIN Unvan ON Personel.personel_id = Unvan.personel_id;


CREATE VIEW PersonelView WITH SCHEMABINDING AS
SELECT personel_id,ad,soyad,maas FROM dbo.Personel;

CREATE FUNCTION ArtisOraniIleMaasArttir (
    @personelID INT,
    @artisOrani DECIMAL(5, 2) -- Örnek olarak yüzde cinsinden bir oran
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @yenimaas DECIMAL(10, 2);

    SELECT @yenimaas = maas * (1 + @artisOrani / 100)
    FROM Personel
    WHERE personel_id = @personelID;

    RETURN @yenimaas;
END;

SELECT ad,soyad,SUM(maas) AS ToplamMaas FROM Personel GROUP BY ad, soyad WITH CUBE;

SELECT ad,soyad,SUM(maas) AS ToplamMaas FROM Personel GROUP BY ad, soyad WITH ROLLUP;

SELECT  *,CHARINDEX('Ahmet', ad) AS KelimeBaslangicIndeksi FROM Personel WHERE CHARINDEX('Ahmet', ad) > 0;
	   
UPDATE Personel SET ad = REPLACE(ad, 'Ahmet', 'Mehmet') WHERE CHARINDEX('Ahmet', ad) > 0;

SELECT musteri_id FROM Musteri
INTERSECT
SELECT personel_id FROM Personel;

SELECT telefon FROM Musteri
EXCEPT
SELECT telefon_no FROM Personel;


SELECT email FROM Musteri
UNION
SELECT e_mail FROM Personel;

--Delete truncate komutları içindir.
CREATE TABLE Ogrenciler (
    ogrenci_id INT PRIMARY KEY,
    ad VARCHAR(50),
    soyad VARCHAR(50),
    yas INT
);

INSERT INTO Ogrenciler (ogrenci_id, ad, soyad, yas)
VALUES 
    (1, 'Ahmet', 'Yılmaz', 20),
    (2, 'Mehmet', 'Kaya', 22),
    (3, 'Ayşe', 'Demir', 21);

DELETE FROM Ogrenciler WHERE ogrenci_id = 1;

TRUNCATE TABLE Ogrenciler;