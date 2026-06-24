-- ==========================================================
-- E-COMMERCE ANALYTICS PROJECT
-- SECTION 6: ADVANCED ANALYTICS
-- ==========================================================


-- ==========================================================
-- 31. RFM ANALYSIS
-- Business Question:
-- Which customers are most valuable based on
-- Recency, Frequency, and Monetary value?
-- ==========================================================

SELECT
    customer_id,

    DATEDIFF(
        MAX(order_date),
        MIN(order_date)
    ) AS recency,

    COUNT(DISTINCT order_id) AS frequency,

    SUM(total_amount) AS monetary

FROM ecommerce_sales
GROUP BY customer_id
ORDER BY monetary DESC;


-- ==========================================================
-- 32. TOP 20 CUSTOMERS BY REVENUE CONTRIBUTION
-- ==========================================================

WITH customer_revenue AS (

    SELECT
        customer_id,
        SUM(total_amount) AS revenue

    FROM ecommerce_sales
    GROUP BY customer_id

)

SELECT
    customer_id,
    revenue,

    revenue * 100 /
    (
        SELECT SUM(total_amount)
        FROM ecommerce_sales
    ) AS revenue_contribution_percentage

FROM customer_revenue
ORDER BY revenue DESC
LIMIT 20;


-- ==========================================================
-- 33. RUNNING REVENUE TREND
-- ==========================================================

-- ==========================================================
-- E-COMMERCE ANALYTICS PROJECT
-- SECTION 6: ADVANCED ANALYTICS
-- ==========================================================


-- ==========================================================
-- 31. RFM ANALYSIS
-- Business Question:
-- Which customers are most valuable based on
-- Recency, Frequency, and Monetary value?
-- ==========================================================

SELECT
    customer_id,

    DATEDIFF(
        MAX(order_date),
        MIN(order_date)
    ) AS recency,

    COUNT(DISTINCT order_id) AS frequency,

    SUM(total_amount) AS monetary

FROM ecommerce_sales
GROUP BY customer_id
ORDER BY monetary DESC;


-- ==========================================================
-- 32. TOP 20 CUSTOMERS BY REVENUE CONTRIBUTION
-- Business Question:
-- Which customers contribute the most revenue?
-- ==========================================================

WITH customer_revenue AS (

    SELECT
        customer_id,
        SUM(total_amount) AS revenue

    FROM ecommerce_sales
    GROUP BY customer_id

)

SELECT
    customer_id,
    revenue,

    revenue * 100 /
    (
        SELECT SUM(total_amount)
        FROM ecommerce_sales
    ) AS revenue_contribution_percentage

FROM customer_revenue
ORDER BY revenue DESC
LIMIT 20;


-- ==========================================================
-- 33. RUNNING REVENUE TREND
-- Business Question:
-- How does cumulative revenue grow over time?
-- ==========================================================

-- ==========================================================
-- E-COMMERCE ANALYTICS PROJECT
-- SECTION 6: ADVANCED ANALYTICS
-- ==========================================================


-- ==========================================================
-- 31. RFM ANALYSIS
-- Business Question:
-- Which customers are most valuable based on
-- Recency, Frequency, and Monetary value?
-- ==========================================================

SELECT
    customer_id,

    DATEDIFF(
        MAX(order_date),
        MIN(order_date)
    ) AS recency,

    COUNT(DISTINCT order_id) AS frequency,

    SUM(total_amount) AS monetary

FROM ecommerce_sales
GROUP BY customer_id
ORDER BY monetary DESC;


-- ==========================================================
-- 32. TOP 20 CUSTOMERS BY REVENUE CONTRIBUTION
-- Business Question:
-- Which customers contribute the most revenue?
-- ==========================================================

WITH customer_revenue AS (

    SELECT
        customer_id,
        SUM(total_amount) AS revenue

    FROM ecommerce_sales
    GROUP BY customer_id

)

SELECT
    customer_id,
    revenue,

    revenue * 100 /
    (
        SELECT SUM(total_amount)
        FROM ecommerce_sales
    ) AS revenue_contribution_percentage

FROM customer_revenue
ORDER BY revenue DESC
LIMIT 20;


-- ==========================================================
-- 33. RUNNING REVENUE TREND
-- Business Question:
-- How does cumulative revenue grow over time?
-- ==========================================================

-- ==========================================================
-- 33. RUNNING REVENUE TREND
-- ==========================================================

WITH daily_sales AS (

    SELECT
        order_date,
        SUM(total_amount) AS daily_revenue

    FROM ecommerce_sales
    GROUP BY order_date

)

SELECT
    order_date,
    daily_revenue,

    SUM(daily_revenue) OVER (
        ORDER BY order_date
    ) AS cumulative_revenue

FROM daily_sales
ORDER BY order_date;