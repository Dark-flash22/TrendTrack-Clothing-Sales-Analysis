TrendTrack-Clothing-Sales-Analysis
This project simulates a complete backend for an online clothing store using MySQL. It models key entities such as Customers, Sellers, Products, Carts, Payments, and Shipping. The system supports:

Managing customer and seller information
Tracking product inventory by seller
Adding products to carts and managing purchases
Recording payments and generating purchase history
Tracking shipments between customers and sellers
Generating insights like top-selling products, monthly sales trends, and customer purchase reports
Entities with Attributes
Seller
Attributes:
Seller_id (PK), Name, Address, Phone_number, S_password

Customer
Attributes:
Customer_id (PK), Name, Phone_number, C_password, Street, Pincode

Cart
Attributes:
Cart_id (PK), Customer_id (FK)

Product
Attributes:
Product_id (PK), Type, Size, Gender, Age_group, Reviews, Cost, Quantity, Seller_id (FK)

Cart_item
Attributes:
Cart_id (PK, FK), Product_id (PK, FK), Quantity, Date_added, Purchased, Total_cost

Payment
Attributes:
Payment_id (PK), Amount, Payment_date, Customer_id (FK)

Shipping
Attributes:
Tracking_id (PK), Customer_id (FK), Seller_id (FK)

Relationships
Customer — Cart: 1-to-1
One customer has one cart

Cart — Cart_item — Product: Many-to-Many
A cart can have many products, and a product can be in many carts

Cart_item — Product: Many-to-1
Each cart item refers to one product

📊 Sales Visualizations
Sales Performance Analysis: Top 5 Products by Month<img width="765" height="462" alt="image" src="https://github.com/user-attachments/assets/80119aae-29d3-401a-bfa1-e3c637cea7ad" />
Customer Spends Insights
<img width="1257" height="541" alt="image" src="https://github.com/user-attachments/assets/66adee8a-8d6c-4cc0-9a31-443c12ea5cb5" />

Trend Analysis of Monthly Sales
<img width="597" height="356" alt="image" src="https://github.com/user-attachments/assets/46a9cef3-fd53-410c-818d-af4aa26266a9" />

