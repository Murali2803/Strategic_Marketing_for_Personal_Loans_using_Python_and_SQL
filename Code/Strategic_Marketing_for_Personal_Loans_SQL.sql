use project;
-- Task 1: Quantifying Progress.
SELECT COUNT(*) from liability;
-- Task 2: Seeking avg income
SELECT AVG(Income) AS AverageIncome 
FROM liability;
-- Task 3: Identifying High-Potential Customers.
SELECT * FROM liability 
ORDER BY Income DESC
LIMIT 10;
-- Task 4: Uncovering Educational Financial Trends
SELECT Education, AVG(Income) FROM liability
GROUP BY Education
Drop view RankedData;
-- Task 5: Top Income Earners by Education
WITH RankedData AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY Education ORDER BY Income DESC) AS IncomeRank
    FROM liability
)

SELECT * FROM RankedData WHERE IncomeRank <= 2;


-- Task 6: Profiling Customer Demographics.
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 30 THEN '18-30'
        WHEN Age BETWEEN 31 AND 45 THEN '31-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '61+'
    END AS AgeGroup,
    COUNT(*) AS RecordCount
FROM
    liability
GROUP BY
    AgeGroup;
-- Task 7: Analyzing Age vs. Credit Card Spending
SELECT
    AVG(Age) AS AverageAge
FROM
    liability
WHERE
    CCAvg > (SELECT AVG(CCAvg) FROM liability);
-- Task 8: Unveiling High-Income Elite.
SELECT *
FROM liability
WHERE Income > 1.5 * (SELECT AVG(Income) FROM liability);
-- Task 9: Family Dynamics Analysis
SELECT
    Family,
    MIN(Age) AS YoungestAge
FROM
    liability
GROUP BY
    Family;
-- Task 10: Mortgage Holders.
SELECT *
FROM liability
WHERE Mortgage > 0;
-- Task 11: Understanding Customer Distribution
SELECT
    Education,
    COUNT(*) AS CustomerCount
FROM
    liability
GROUP BY
    Education;

 


