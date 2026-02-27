/* RetailSphere: Analitik Raporlar ve İş Zekası Sorguları
   Bu sorgular, işletme yöneticilerine karar destek mekanizması sunmak için hazırlanmıştır.
*/

-- RAPOR 1: Kritik Stok Alarmı (Tedarik Zinciri Yönetimi)
-- ReorderLevel altına düşen ürünleri tedarik önerisiyle beraber getirir.
SELECT 
    ProductName, 
    UnitsInStock, 
    ReorderLevel,
    (ReorderLevel * 2) - UnitsInStock AS SuggestedOrderQuantity
FROM Products
WHERE UnitsInStock < ReorderLevel;

-- RAPOR 2: Müşteri Değer Analizi (CRM / Sadakat Yönetimi)
-- En çok harcama yapan müşterileri toplam alışveriş sayısıyla beraber listeler.
SELECT 
    C.FirstName + ' ' + C.LastName AS FullName,
    COUNT(S.SaleID) AS TransactionCount,
    SUM(S.TotalAmount) AS TotalLifetimeValue
FROM Customers C
JOIN Sales S ON C.CustomerID = S.CustomerID
GROUP BY C.FirstName, C.LastName
ORDER BY TotalLifetimeValue DESC;

-- RAPOR 3: Kategori Bazlı Performans (Finansal Analiz)
-- Hangi kategorinin şirkete ne kadar ciro getirdiğini hesaplar.
SELECT 
    Cat.CategoryName,
    COUNT(P.ProductID) AS ProductCount,
    SUM(S.TotalAmount) AS CategoryRevenue
FROM Categories Cat
JOIN Products P ON Cat.CategoryID = P.CategoryID
JOIN Sales S ON P.ProductID = P.ProductID -- Mock veri yapısına göre basitleştirilmiş join
GROUP BY Cat.CategoryName;
