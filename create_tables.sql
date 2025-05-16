IF NOT EXISTS (
    SELECT name FROM master.dbo.sysdatabases WHERE name = N'HayvanBarinagiDB'
)
BEGIN
    CREATE DATABASE HayvanBarinagiDB;
END;
GO

USE HayvanBarinagiDB;
GO
  
CREATE TABLE Adresler (
    AdresID INT PRIMARY KEY,
    Ulke NVARCHAR(50),
    Sehir NVARCHAR(50),
    Mahalle NVARCHAR(50),
    Sokak NVARCHAR(50),
    BinaNo INT,
    DaireNo INT
);

CREATE TABLE Hayvanlar (
    HayvanID INT PRIMARY KEY,
    Ad NVARCHAR(50),
    Tur NVARCHAR(50),
    Cins NVARCHAR(50),
    Yas INT,
    SaglikDurumu NVARCHAR(50)
);

CREATE TABLE Ziyaretciler (
    ZiyaretciID INT PRIMARY KEY,
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    Telefon NVARCHAR(30),
    AdresID INT FOREIGN KEY REFERENCES Adresler(AdresID)
);

CREATE TABLE Sahiplenmeler (
    SahiplenmeID INT PRIMARY KEY,
    HayvanID INT FOREIGN KEY REFERENCES Hayvanlar(HayvanID),
    ZiyaretciID INT FOREIGN KEY REFERENCES Ziyaretciler(ZiyaretciID),
    Tarih DATE
);

CREATE TABLE Veterinerler (
    VeterinerID INT PRIMARY KEY,
    Ad NVARCHAR(50),
    Uzmanlik NVARCHAR(50)
);

CREATE TABLE Roller (
    RolID INT PRIMARY KEY,
    Rol NVARCHAR(20)
);

CREATE TABLE Muayeneler (
    MuayeneID INT PRIMARY KEY,
    HayvanID INT FOREIGN KEY REFERENCES Hayvanlar(HayvanID),
    VeterinerID INT FOREIGN KEY REFERENCES Veterinerler(VeterinerID),
    Tarih DATE,
    Teshis NVARCHAR(100)
);

CREATE TABLE Kullanicilar (
    KullaniciID INT PRIMARY KEY,
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    KullaniciAdi NVARCHAR(50) UNIQUE,
    Sifre NVARCHAR(50),
    RolID INT FOREIGN KEY REFERENCES Roller(RolID)
);

INSERT INTO Roller (RolID, Rol) VALUES (1, 'Yönetici');
INSERT INTO Roller (RolID, Rol) VALUES (2, 'Gönüllü');
INSERT INTO Roller (RolID, Rol) VALUES (3, 'Veteriner');
