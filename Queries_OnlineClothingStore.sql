-- 1. View all sellers
SELECT * FROM Seller;

-- 2. View all customers
SELECT * FROM Customer;

-- 3. View all products
SELECT * FROM Product;

-- 4. View all cart entries
SELECT * FROM Cart;

-- 5. View all cart items
SELECT * FROM Cart_item;

-- 6. View all payment records
SELECT * FROM Payment;

-- 7. View all shipping records
SELECT * FROM Shipping;

-- 8. Get all female products of size M
SELECT * FROM Product
WHERE Gender = 'F' AND Size = 'M';

-- 9. Insert a product only if it doesn't already exist
INSERT INTO Product (Product_id, Type, Size, Gender, Age_group, Reviews, Cost, Quantity, Seller_id)
VALUES ('P30021', 'Hoodie', 'L', 'M', 'Adult', 'Warm and comfy', 1299, 8, 'S1002')
ON DUPLICATE KEY UPDATE
Reviews = 'Warm and comfy',
Cost = 1299,
Quantity = 8;
SELECT * FROM Product;

-- 10. View all products that are in stock
SELECT * FROM Product
WHERE Quantity > 0;

-- 11. Insert item into cart only if not already added
INSERT INTO Cart_item (Cart_id, Product_id, Quantity, Date_added, Purchased, Total_cost)
VALUES ('CRT001', 'P3002', 1, CURRENT_DATE, 'no', 1930)
ON DUPLICATE KEY UPDATE
Quantity = VALUES(Quantity),
Date_added = CURRENT_DATE;
SELECT * FROM Cart_item;

-- 12. Mark the cart item as purchased
UPDATE Cart_item
SET Purchased = 'yes'
WHERE Cart_id = 'CRT001' AND Product_id = 'P3002';
SELECT * FROM Cart_item;

-- 13. Reduce product quantity by 1 after purchase
UPDATE Product
SET Quantity = Quantity - 1
WHERE Product_id = 'P3002' AND Quantity > 0;
SELECT * FROM Product;

-- 14. Insert payment record if not already present
INSERT INTO Payment (Payment_id, Amount, Payment_date, Customer_id)
VALUES ('PAY5021', 1930, CURRENT_DATE, 'C2001')
ON DUPLICATE KEY UPDATE
Amount = 1930,
Payment_date = CURRENT_DATE;
SELECT * FROM Payment;

-- 15. Insert shipping info if not already added
INSERT INTO Shipping (Tracking_id, Customer_id, Seller_id)
VALUES ('TRK021', 'C2001', 'S1016')
ON DUPLICATE KEY UPDATE
Seller_id = 'S1016';
SELECT * FROM Shipping;

-- 16. Get purchased products by customer C2001
SELECT p.Product_id, p.Type, ci.Quantity, ci.Date_added, ci.Total_cost
FROM Cart_item ci
JOIN Product p ON ci.Product_id = p.Product_id
JOIN Cart c ON c.Cart_id = ci.Cart_id
WHERE c.Customer_id = 'C2001' AND ci.Purchased = 'yes';

-- 17. Update product review and cost
UPDATE Product
SET Cost = 899, Reviews = 'Now with improved fit'
WHERE Product_id = 'P3002';
SELECT * FROM Product;

-- 18. Remove cart item (e.g., cleanup step after reporting)
DELETE FROM Cart_item
WHERE Cart_id = 'CRT001' AND Product_id = 'P3002';
SELECT * FROM Cart_item;

-- 19. Show top-selling products
SELECT Product_id, SUM(Quantity) AS TotalSold
FROM Cart_item
WHERE Purchased = 'yes'
GROUP BY Product_id
ORDER BY TotalSold DESC;

-- 20. Detailed customer purchase report
SELECT
c.Customer_id,
c.Name AS Customer_Name,
s.Seller_id,
s.Name AS Seller_Name,
p.Product_id,
p.Type AS Product_Type,
p.Size,
p.Gender,
p.Age_group,
p.Reviews,
p.Cost,
ci.Quantity AS Purchased_Quantity,
ci.Total_cost,
ci.Date_added
FROM Cart_item ci
JOIN Product p ON ci.Product_id = p.Product_id
JOIN Cart ct ON ci.Cart_id = ct.Cart_id
JOIN Customer c ON ct.Customer_id = c.Customer_id
JOIN Seller s ON p.Seller_id = s.Seller_id
WHERE ci.Purchased = 'yes'
ORDER BY ci.Date_added DESC;

-- 21.Monthly sales trend
SELECT 
  DATE_FORMAT(Date_added, '%Y-%m') AS Month,
  SUM(Total_cost) AS Monthly_Revenue
FROM Cart_item
WHERE Purchased = 'yes'
GROUP BY Month
ORDER BY Month;

-- 22.Top 5 Products by Revenue
SELECT 
  Product_id,
  SUM(Total_cost) AS Total_Revenue
FROM Cart_item
WHERE Purchased = 'yes'
GROUP BY Product_id
ORDER BY Total_Revenue DESC
LIMIT 5;
