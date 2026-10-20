USE superstore;
GO

-- Q3: Which months drive the most sales and profit? (all years combined)
SELECT
    MONTH(order_date)           AS month_number,
    DATENAME(month, order_date) AS month_name,
    ROUND(SUM(sales), 2)        AS total_sales,
    ROUND(SUM(profit), 2)       AS total_profit
FROM orders_clean
GROUP BY MONTH(order_date), DATENAME(month, order_date)
ORDER BY total_sales DESC;
GO