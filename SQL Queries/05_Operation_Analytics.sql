-- ==========================================================
-- E-COMMERCE ANALYTICS PROJECT
-- SECTION 5: OPERATIONS ANALYTICS
-- ==========================================================

-- ==========================================================
-- 21. OVERALL RETURN RATE (%)
-- Business Question:
-- What percentage of orders are returned?
-- ==========================================================

SELECT
    ROUND(
        SUM(CASE WHEN returned = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS return_rate_percentage
FROM ecommerce_sales;

-- ==========================================================
-- 22. AVERAGE DELIVERY TIME BY REGION
-- Business Question:
-- Which regions experience the slowest deliveries?
-- ==========================================================

SELECT
    region,
    ROUND(AVG(delivery_time_days), 2) AS avg_delivery_days
FROM ecommerce_sales
GROUP BY region
ORDER BY avg_delivery_days DESC;


-- ==========================================================
-- 23. REVENUE LOST DUE TO RETURNS
-- ==========================================================

SELECT
    ROUND(
        SUM(
            CASE
                WHEN returned = 'Yes'
                THEN total_amount
                ELSE 0
            END
        ),
        2
    ) AS revenue_lost_due_to_returns
FROM ecommerce_sales;


-- ==========================================================
-- 24. MOST PROFITABLE REGIONS
-- ==========================================================

SELECT
    region,

    ROUND(
        SUM(total_amount * profit_margin),
        2
    ) AS estimated_profit

FROM ecommerce_sales
GROUP BY region
ORDER BY estimated_profit DESC;