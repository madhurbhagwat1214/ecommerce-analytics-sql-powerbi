-- ==========================================================
-- E-COMMERCE ANALYTICS PROJECT
-- SECTION 3: PRODUCT ANALYTICS
-- ==========================================================

-- ==========================================================
-- 11. TOP 10 PRODUCTS BY REVENUE
-- ==========================================================

SELECT
    product_id,
    ROUND(SUM(total_amount), 2) AS revenue
FROM ecommerce_sales
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;


-- ==========================================================
-- 12. TOP 10 PRODUCTS BY QUANTITY SOLD
-- ==========================================================

SELECT
    product_id,
    SUM(quantity) AS total_quantity_sold
FROM ecommerce_sales
GROUP BY product_id
ORDER BY total_quantity_sold DESC
LIMIT 10;


-- ==========================================================
-- 13. CATEGORY-WISE REVENUE ANALYSIS
-- ==========================================================

SELECT
    category,
    ROUND(SUM(total_amount), 2) AS revenue,
    SUM(quantity) AS units_sold
FROM ecommerce_sales
GROUP BY category
ORDER BY revenue DESC;


-- ==========================================================
-- 14. CATEGORY-WISE PROFIT ANALYSIS
-- ==========================================================

SELECT
    category,
    ROUND(
        SUM(total_amount * profit_margin),
        2
    ) AS estimated_profit
FROM ecommerce_sales
GROUP BY category
ORDER BY estimated_profit DESC;


-- ==========================================================
-- 15. BEST-SELLING PRODUCT IN EACH CATEGORY
-- ==========================================================

WITH product_sales AS (
    SELECT
        category,
        product_id,
        SUM(total_amount) AS revenue,

        DENSE_RANK() OVER(
            PARTITION BY category
            ORDER BY SUM(total_amount) DESC
        ) AS rank_num

    FROM ecommerce_sales
    GROUP BY category, product_id
)

SELECT
    category,
    product_id,
    ROUND(revenue, 2) AS revenue
FROM product_sales
WHERE rank_num = 1;


-- ==========================================================
-- PRODUCT REVENUE CONTRIBUTION (%)
-- ==========================================================

SELECT
    category,
    ROUND(SUM(total_amount), 2) AS revenue,

    ROUND(
        SUM(total_amount) * 100 /
        (SELECT SUM(total_amount)
         FROM ecommerce_sales),
        2
    ) AS revenue_contribution_percentage

FROM ecommerce_sales
GROUP BY category
ORDER BY revenue DESC;


-- ==========================================================
-- TOP 5 PRODUCTS WITH HIGHEST PROFIT
-- ==========================================================

SELECT
    product_id,

    ROUND(
        SUM(total_amount * profit_margin),
        2
    ) AS estimated_profit

FROM ecommerce_sales
GROUP BY product_id
ORDER BY estimated_profit DESC
LIMIT 5;


-- ==========================================================
-- BOTTOM 5 PRODUCTS WITH LOWEST PROFIT
-- ==========================================================

SELECT
    product_id,

    ROUND(
        SUM(total_amount * profit_margin),
        2
    ) AS estimated_profit

FROM ecommerce_sales
GROUP BY product_id
ORDER BY estimated_profit ASC
LIMIT 5;
