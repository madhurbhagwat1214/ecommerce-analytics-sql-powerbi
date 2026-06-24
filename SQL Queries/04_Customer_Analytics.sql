-- ==========================================================
-- E-COMMERCE ANALYTICS PROJECT
-- SECTION 4: CUSTOMER ANALYTICS
-- ==========================================================

-- ==========================================================
-- 16. CUSTOMER LIFETIME VALUE (CLV)
-- ==========================================================

SELECT
    customer_id,
    ROUND(SUM(total_amount), 2) AS customer_lifetime_value
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY customer_lifetime_value DESC;


-- ==========================================================
-- 17. TOP 10 CUSTOMERS BY REVENUE
-- ==========================================================

SELECT
    customer_id,
    ROUND(SUM(total_amount), 2) AS revenue
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY revenue DESC
LIMIT 10;


-- ==========================================================
-- 18. REPEAT CUSTOMERS
-- ==========================================================

SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_sales
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY total_orders DESC;


-- ==========================================================
-- 19. CUSTOMER SEGMENTATION BASED ON SPENDING
-- ==========================================================

WITH customer_spend AS (
    SELECT
        customer_id,
        SUM(total_amount) AS total_spent
    FROM ecommerce_sales
    GROUP BY customer_id
)

SELECT
    customer_id,
    ROUND(total_spent, 2) AS total_spent,

    CASE
        WHEN total_spent >= 10000 THEN 'High Value'
        WHEN total_spent >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment

FROM customer_spend
ORDER BY total_spent DESC;


-- ==========================================================
-- 20. REVENUE BY CUSTOMER GENDER
-- ==========================================================

SELECT
    customer_gender,
    COUNT(DISTINCT customer_id) AS customers,
    ROUND(SUM(total_amount), 2) AS revenue
FROM ecommerce_sales
GROUP BY customer_gender
ORDER BY revenue DESC;


-- ==========================================================
-- 21. REVENUE BY AGE GROUP
-- ==========================================================

SELECT
    CASE
        WHEN customer_age BETWEEN 18 AND 25 THEN '18-25'
        WHEN customer_age BETWEEN 26 AND 35 THEN '26-35'
        WHEN customer_age BETWEEN 36 AND 45 THEN '36-45'
        WHEN customer_age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_group,

    COUNT(DISTINCT customer_id) AS customers,
    ROUND(SUM(total_amount), 2) AS revenue

FROM ecommerce_sales
GROUP BY age_group
ORDER BY revenue DESC;


-- ==========================================================
-- 22. AVERAGE CUSTOMER SPEND
-- ==========================================================

SELECT
    ROUND(
        SUM(total_amount) /
        COUNT(DISTINCT customer_id),
        2
    ) AS average_customer_spend
FROM ecommerce_sales;


-- ==========================================================
-- 23. CUSTOMER PURCHASE FREQUENCY
-- ==========================================================

SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS purchase_frequency
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY purchase_frequency DESC;


-- ==========================================================
-- 24. CUSTOMER SEGMENT DISTRIBUTION
-- ==========================================================

WITH customer_spend AS (
    SELECT
        customer_id,
        SUM(total_amount) AS total_spent
    FROM ecommerce_sales
    GROUP BY customer_id
)

SELECT
    CASE
        WHEN total_spent >= 10000 THEN 'High Value'
        WHEN total_spent >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment,

    COUNT(*) AS customer_count

FROM customer_spend
GROUP BY customer_segment
ORDER BY customer_count DESC;
