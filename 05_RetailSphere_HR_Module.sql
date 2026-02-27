/* RetailSphere: İnsan Kaynakları ve Performans Analizi Modülü
   Bu dosya; çalışan verilerini yönetmek ve satış performanslarını 
   analiz etmek amacıyla kurgulanmıştır.
*/
1.ADIM: Çalışanlar Tablosu (İK Yapısı)
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Title NVARCHAR(100), -- Pozisyon (Satış Temsilcisi, Yönetici vb.)
    HireDate DATE DEFAULT GETDATE(),
    Salary DECIMAL(18, 2),
    ReportsTo INT NULL -- Organizasyon şeması için (Self-referencing)
);

2.ADIM: Satışlar Tablosunu Çalışanla İlişkilendirme
- Mevcut Sales tablosuna hangi çalışanın satışı yaptığını takip etmek için kolon ekliyoruz.
ALTER TABLE Sales ADD EmployeeID INT;
GO

3.ADIM: Örnek Çalışan Verileri
INSERT INTO Employees (FirstName, LastName, Title, Salary) VALUES 
('Zeynep', 'Köşger', 'Sistem Analisti & Kıdemli Satış', 45000.00),
('Ali', 'Yılmaz', 'Satış Temsilcisi', 28000.00),
('Ece', 'Demir', 'Satış Temsilcisi', 28000.00);

4.ADIM: Satış Verilerini Güncelleme -Geçmiş satışları çalışanlara atayalım.
UPDATE Sales SET EmployeeID = 1 WHERE SaleID IN (1, 2);
UPDATE Sales SET EmployeeID = 2 WHERE SaleID = 3;
UPDATE Sales SET EmployeeID = 3 WHERE SaleID = 4;

5.ADIM: Performans Raporu -Yönetici Özeti
SELECT 
    E.FirstName + ' ' + E.LastName AS EmployeeName,
    E.Title,
    COUNT(S.SaleID) AS TotalSalesCount,
    SUM(S.TotalAmount) AS TotalRevenueGenerated
FROM Employees E
LEFT JOIN Sales S ON E.EmployeeID = S.EmployeeID
GROUP BY E.FirstName, E.LastName, E.Title
ORDER BY TotalRevenueGenerated DESC;
