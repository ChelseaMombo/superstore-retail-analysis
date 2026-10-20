USE superstore;
GO

-- Q1: Which sub-categories lose money?
SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2)  AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 1) AS profit_margin_pct
FROM orders_clean
GROUP BY category, sub_category
ORDER BY total_profit ASC;
GO

-- Q2: Does heavy discounting line up with losses?
SELECT
    discount_band,
    COUNT(*)              AS order_lines,
    ROUND(SUM(profit), 2) AS total_profit
FROM (
    SELECT
        profit,
        CASE
            WHEN discount = 0    THEN '0%'
            WHEN discount <= 0.2 THEN '1-20%'
            WHEN discount <= 0.4 THEN '21-40%'
            ELSE '41%+'
        END AS discount_band
    FROM orders_clean
) AS banded
GROUP BY discount_band
ORDER BY discount_band;
GO