-- Step 1: create the database
CREATE DATABASE superstore;
GO
USE superstore;
GO

-- Step 2: create the raw table (dates kept as text for now)
CREATE TABLE orders_raw (
    row_id        INT,
    order_id      VARCHAR(20),
    order_date    VARCHAR(20),
    ship_date     VARCHAR(20),
    ship_mode     VARCHAR(20),
    customer_id   VARCHAR(20),
    customer_name VARCHAR(100),
    segment       VARCHAR(20),
    country       VARCHAR(50),
    city          VARCHAR(100),
    state         VARCHAR(50),
    postal_code   VARCHAR(10),
    region        VARCHAR(20),
    product_id    VARCHAR(20),
    category      VARCHAR(50),
    sub_category  VARCHAR(50),
    product_name  VARCHAR(255),
    sales         DECIMAL(10,4),
    quantity      INT,
    discount      DECIMAL(4,2),
    profit        DECIMAL(10,4)
);
GO

-- Step 3: load the CSV (update the file path to match your machine)
BULK INSERT orders_raw
FROM 'C:\Users\MUNASHE MOMBO\Downloads\superstore-retail-analysis\data\superstore.csv'
WITH (
    FORMAT = 'CSV',
    FIELDQUOTE = '"',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
GO

-- Step 4: check the row count (expect 9994)
SELECT COUNT(*) AS total_rows FROM orders_raw;