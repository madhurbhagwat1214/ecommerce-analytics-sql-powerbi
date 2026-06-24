-- ==========================================================
-- E-COMMERCE ANALYTICS PROJECT
-- SECTION 1: BUSINESS PERFORMANCE ANALYSIS
-- ==========================================================

-- ==========================================================
-- 1. TOTAL REVENUE
-- ==========================================================

SELECT
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM ecommerce_sales;


-- ==========================================================
-- 2. TOTAL ORDERS
-- ==========================================================

SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_sales;


-- ==========================================================
-- 3. TOTAL CUSTOMERS
-- ==========================================================

SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM ecommerce_sales;


-- ==========================================================
-- 4. AVERAGE ORDER VALUE (AOV)
-- ==========================================================

SELECT
    ROUND(
        SUM(total_amount) /
        COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM ecommerce_sales;


-- ==========================================================
-- 5. OVERALL PROFIT MARGIN %
-- ==========================================================

SELECT
    ROUND(
        AVG(profit_margin) * 100,
        2
    ) AS average_profit_margin_percentage
FROM ecommerce_sales;

