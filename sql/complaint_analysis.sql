
-- ============================================================
-- FINTRUST 360
-- Financial Customer Complaints & Response Analytics
-- Database: SQLite
-- Table: complaints
-- Cleaned records: 4,975
-- ============================================================


-- QUERY 1: Total number of complaints
SELECT
    COUNT(*) AS total_complaints
FROM complaints;


-- QUERY 2: Monthly complaint trends
SELECT
    SUBSTR(date_received, 1, 7) AS complaint_month,
    COUNT(*) AS total_complaints
FROM complaints
GROUP BY SUBSTR(date_received, 1, 7)
ORDER BY complaint_month;


-- QUERY 3: Complaints by financial product
SELECT
    financial_product,
    COUNT(*) AS total_complaints
FROM complaints
GROUP BY financial_product
ORDER BY total_complaints DESC;


-- QUERY 4: Most frequently reported issues
SELECT
    issue_category,
    COUNT(*) AS complaint_count
FROM complaints
GROUP BY issue_category
ORDER BY complaint_count DESC;


-- QUERY 5: Complaints by company
-- Raw complaint volume is not a direct measure of company performance.
SELECT
    company_name,
    COUNT(*) AS total_complaints
FROM complaints
GROUP BY company_name
ORDER BY total_complaints DESC;


-- QUERY 6: Complaints by customer state
SELECT
    state,
    COUNT(*) AS total_complaints
FROM complaints
GROUP BY state
ORDER BY total_complaints DESC;


-- QUERY 7: Open and closed complaint distribution
SELECT
    response_status,
    COUNT(*) AS complaint_count
FROM complaints
GROUP BY response_status
ORDER BY complaint_count DESC;


-- QUERY 8: Overall timely response percentage
-- Open complaints are excluded from the denominator.
SELECT
    COUNT(*) AS closed_complaints,
    SUM(CASE WHEN timely_response = 'Yes' THEN 1 ELSE 0 END)
        AS timely_responses,
    SUM(CASE WHEN timely_response = 'No' THEN 1 ELSE 0 END)
        AS late_responses,
    ROUND(
        100.0 * SUM(CASE WHEN timely_response = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS timely_response_percentage
FROM complaints
WHERE response_status = 'Closed';


-- QUERY 9: Average response time
-- Open complaints are excluded.
SELECT
    COUNT(*) AS closed_complaints,
    ROUND(AVG(response_time_days), 2) AS average_response_days
FROM complaints
WHERE response_status = 'Closed'
  AND response_time_days IS NOT NULL;


-- QUERY 10: Timely response percentage by company
-- Only closed complaints are included.
SELECT
    company_name,
    COUNT(*) AS closed_complaints,
    SUM(CASE WHEN timely_response = 'Yes' THEN 1 ELSE 0 END)
        AS timely_responses,
    ROUND(
        100.0 * SUM(CASE WHEN timely_response = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS timely_response_percentage
FROM complaints
WHERE response_status = 'Closed'
GROUP BY company_name
ORDER BY timely_response_percentage DESC;


-- QUERY 11: Average response time by financial product
-- Open complaints are excluded.
SELECT
    financial_product,
    COUNT(*) AS closed_complaints,
    ROUND(AVG(response_time_days), 2) AS average_response_days
FROM complaints
WHERE response_status = 'Closed'
  AND response_time_days IS NOT NULL
GROUP BY financial_product
ORDER BY average_response_days DESC;

