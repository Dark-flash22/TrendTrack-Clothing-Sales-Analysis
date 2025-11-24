# TrendTrack-Clothing-Sales-Analysis

This project simulates a complete backend for an online clothing store using MySQL. It models key entities such as **Customers, Sellers, Products, Carts, Payments**, and **Shipping**. The system supports:

1. Managing customer and seller information  
2. Tracking product inventory by seller  
3. Adding products to carts and managing purchases  
4. Recording payments and generating purchase history  
5. Tracking shipments between customers and sellers  
6. Generating insights like top-selling products, monthly sales trends, and customer purchase reports  

---

## Entities with Attributes

### Seller  
**Attributes:**  
`Seller_id (PK)`, `Name`, `Address`, `Phone_number`, `S_password`

### Customer  
**Attributes:**  
`Customer_id (PK)`, `Name`, `Phone_number`, `C_password`, `Street`, `Pincode`

### Cart  
**Attributes:**  
`Cart_id (PK)`, `Customer_id (FK)`

### Product  
**Attributes:**  
`Product_id (PK)`, `Type`, `Size`, `Gender`, `Age_group`, `Reviews`, `Cost`, `Quantity`, `Seller_id (FK)`

### Cart_item  
**Attributes:**  
`Cart_id (PK, FK)`, `Product_id (PK, FK)`, `Quantity`, `Date_added`, `Purchased`, `Total_cost`

### Payment  
**Attributes:**  
`Payment_id (PK)`, `Amount`, `Payment_date`, `Customer_id (FK)`

### Shipping  
**Attributes:**  
`Tracking_id (PK)`, `Customer_id (FK)`, `Seller_id (FK)`

---

## Relationships

- **Customer — Cart**: `1-to-1`  
  One customer has one cart  

- **Cart — Cart_item — Product**: `Many-to-Many`  
  A cart can have many products, and a product can be in many carts  

- **Cart_item — Product**: `Many-to-1`  
  Each cart item refers to one product

## 📊 Sales Visualizations

###  Sales Performance Analysis: Top 5 Products by Month
<img width="605" height="363" alt="Screenshot 2025-07-21 213812" src="https://github.com/user-attachments/assets/e5f72322-da07-4851-844f-48a57987444c" />

###  Customer Spends Insights  
<img width="1085" height="490" alt="Screenshot 2025-07-21 213752" src="https://github.com/user-attachments/assets/7fd6bc3d-6953-4fbf-b4c1-89de053c40e5" />

###  Trend Analysis of Monthly Sales
<img width="597" height="356" alt="Screenshot 2025-07-21 213821" src="https://github.com/user-attachments/assets/cfb52902-eeb9-4a37-b045-035e901bd74a" />
