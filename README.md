# ecommerce-database-project
A structured MySQL e-commerce database project with ERD, sample data, and SQL queries. Built for learning relational database design and implementation.
# 🛍️ E-commerce Database Project

This project is a **relational database design** for an e-commerce platform. It was created as part of a group assignment to practice **ERD creation**, **database normalization**, and **SQL implementation**.

---

## 📐 Entity-Relationship Design (ERD)

The database includes the following core components:

- `brand` – Stores brand-related information
- `product_category` – Categories like Clothing, Electronics, etc.
- `product` – General product details
- `product_variation` – Different versions of a product (e.g., color, size)
- `color` – Available color options
- `size_category` and `size_option` – For handling various size types (e.g., S, M, L or 42, 43)
- `product_item` – Purchasable product combinations
- `product_image` – Image references for each item
- `attribute_category`, `attribute_type`, `product_attribute` – Handle custom product details

---

## 🧱 Database Structure

### Example Tables:
```sql
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);
