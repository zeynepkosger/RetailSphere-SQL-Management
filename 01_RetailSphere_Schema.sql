/* RetailSphere: Küçük ve Orta Ölçekli İşletmeler İçin Yönetim Sistemi
   Veritabanı Şeması (MSSQL Syntax)
*/

-- 1. Kategoriler: Ürün gruplandırması için
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX)
);

-- 2. Ürünler: Stok ve birim fiyat yönetimi
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(150) NOT NULL,
    CategoryID INT,
    UnitPrice DECIMAL(18, 2) NOT NULL CHECK (UnitPrice >= 0),
    UnitsInStock INT DEFAULT 0 CHECK (UnitsInStock >= 0),
    ReorderLevel INT DEFAULT 5, -- Kritik stok seviyesi
    CONSTRAINT FK_Product_Category FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- 3. Müşteriler: CRM analitiğinin temeli
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(20),
    RegistrationDate DATETIME DEFAULT GETDATE(),
    TotalSpent DECIMAL(18, 2) DEFAULT 0 CHECK (TotalSpent >= 0)
);

-- 4. Satışlar: Ticari işlemlerin takibi
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    SaleDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(18, 2) NOT NULL,
    CONSTRAINT FK_Sale_Customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
