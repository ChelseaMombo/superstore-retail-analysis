USE superstore;
GO

-- Q4: Which products drive the most sales, and do they make money?
SELECT TOP 10
    product_name,
    ROUND(SUM(sales), 2)  AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity)         AS units_sold
FROM orders_clean
GROUP BY product_name
ORDER BY total_sales DESC;
GO