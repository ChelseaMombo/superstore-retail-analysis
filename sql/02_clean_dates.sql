USE superstore;
GO

-- Create a cleaned copy of the raw table with real date columns
SELECT
    row_id,
    order_id,
    TRY_CONVERT(date, order_date, 101) AS order_date,
    TRY_CONVERT(date, ship_date, 101)  AS ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    quantity,
    discount,
    profit
INTO orders_clean
FROM orders_raw;
GO

-- Check the row count (expect 9994)
SELECT COUNT(*) AS total_rows FROM orders_clean;