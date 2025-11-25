-- queries.sql
-- Useful queries (questions) for the A/B test data.

-- 1) How many rows (visits) do we have in total?

SELECT
    COUNT(*) AS total_rows
FROM
    ab_test_results;


-- 2) Overall conversion rate
-- conversion_rate = average of the converted column (1 = yes, 0 = no)

SELECT
    COUNT(*) AS total_rows,
    SUM(converted) AS total_converted,
    AVG(converted) AS conversion_rate
FROM
    ab_test_results;


-- 3) Conversion rate by variant (A vs B)

SELECT
    variant,
    COUNT(*) AS total_rows,
    SUM(converted) AS total_converted,
    AVG(converted) AS conversion_rate
FROM
    ab_test_results
GROUP BY
    variant;


-- 4) Conversion rate by variant and device

SELECT
    variant,
    device,
    COUNT(*) AS total_rows,
    SUM(converted) AS total_converted,
    AVG(converted) AS conversion_rate
FROM
    ab_test_results
GROUP BY
    variant,
    device
ORDER BY
    variant,
    device;


-- 5) Conversion rate by variant and region

SELECT
    variant,
    region,
    COUNT(*) AS total_rows,
    SUM(converted) AS total_converted,
    AVG(converted) AS conversion_rate
FROM
    ab_test_results
GROUP BY
    variant,
    region
ORDER BY
    variant,
    region;
