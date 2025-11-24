CREATE DATABASE IF NOT EXISTS OnlineClothingStores;

-- Select the database
USE OnlineClothingStores; 

CREATE TABLE Seller (
Seller_id VARCHAR(10) PRIMARY KEY,
Name VARCHAR(50),
Address VARCHAR(100),
Phone_number BIGINT,
S_password VARCHAR(30)
);

CREATE TABLE Customer (
Customer_id VARCHAR(12) PRIMARY KEY,
Name VARCHAR(50),
Phone_number BIGINT,
C_password VARCHAR(30),
Street VARCHAR(100),
Pincode INT
);

CREATE TABLE Cart (
Cart_id VARCHAR(10) PRIMARY KEY,
Customer_id VARCHAR(12),
FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

CREATE TABLE Product (
Product_id VARCHAR(10) PRIMARY KEY,
Type VARCHAR(30),
Size VARCHAR(10),
Gender CHAR(1),
Age_group VARCHAR(10),
Reviews TEXT,
Cost INT,
Quantity INT,
Seller_id VARCHAR(10),
FOREIGN KEY (Seller_id) REFERENCES Seller(Seller_id)
);

CREATE TABLE Cart_item (
Cart_id VARCHAR(10),
Product_id VARCHAR(10),
Quantity INT,
Date_added DATE,
Purchased ENUM('yes', 'no'),
Total_cost INT,
PRIMARY KEY (Cart_id, Product_id),
FOREIGN KEY (Cart_id) REFERENCES Cart(Cart_id),
FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);

CREATE TABLE Payment (
Payment_id VARCHAR(20) PRIMARY KEY,
Amount INT,
Payment_date DATE,
Customer_id VARCHAR(12),
FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

CREATE TABLE Shipping (
Tracking_id VARCHAR(20) PRIMARY KEY,
Customer_id VARCHAR(12),
Seller_id VARCHAR(10),
FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
FOREIGN KEY (Seller_id) REFERENCES Seller(Seller_id)
);
