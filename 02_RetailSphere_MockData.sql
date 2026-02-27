/* RetailSphere: Kurumsal Veri Seti (Standardized Enterprise Mock Data) */

-- Kategoriler: İş birimleri
INSERT INTO Categories (CategoryName, Description) VALUES 
('BT Altyapı ve Sunucu', 'Veri merkezi ekipmanları ve ağ çözümleri'),
('Endüstriyel Otomasyon', 'Üretim hattı kontrol sistemleri'),
('Yazılım Lisanslama', 'Kurumsal ERP ve Güvenlik yazılımları');

-- Müşteriler: B2B Portföyü
INSERT INTO Customers (FirstName, LastName, Email, Phone) VALUES 
('Selin', 'Yılmaz', 's.yilmaz@kurumsal.com', '05051112233'),
('Murat', 'Kaya', 'm.kaya@teknoloji.com', '05423334455'),
('Deniz', 'Öztürk', 'd.ozturk@lojistik.com', '05307778899');

-- Ürünler: Raporlarla uyumlu stok seviyeleri
INSERT INTO Products (ProductName, CategoryID, UnitPrice, UnitsInStock, ReorderLevel) VALUES 
('Enterprise Rack Server v2', 1, 45000.00, 15, 5),
('Endüstriyel PLC Ünitesi', 2, 12500.00, 8, 3),
('Siber Güvenlik Lisansı', 3, 8900.00, 100, 10),
('Yüksek Hızlı Switch', 1, 18500.00, 2, 5); -- ÖZELLİKLE: Stok 2, Eşik 5 (Kritik Stok Raporu için)

-- Satışlar: Finansal raporlar için farklı hacimler
INSERT INTO Sales (CustomerID, TotalAmount) VALUES 
(1, 45000.00), -- Yüksek değerli satış
(1, 12500.00), -- Aynı müşteri ikinci alışveriş (Sadakat raporu için)
(2, 25000.00), 
(3, 8900.00);
