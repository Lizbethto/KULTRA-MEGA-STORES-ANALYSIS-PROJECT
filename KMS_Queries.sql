
-- KMS SQL Analysis – Capstone Project
-- Author: Elizabeth Odunayo Omope
-- Date: 18/07/2025
--

-- CASE SCENARIO I

-- Q1: Which product category had the highest sales?
SELECT 
    [Product Category], 
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY [Product Category]
ORDER BY Total_Sales DESC
LIMIT 1;

-- Q2: What are the Top 3 and Bottom 3 regions in terms of sales?

-- Top 3 Regions
SELECT Region, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC
LIMIT 3;

-- Bottom 3 Regions
SELECT Region, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales ASC
LIMIT 3;

-- Q3: Total sales of appliances in Ontario
SELECT 
    SUM(Sales) AS Total_Appliance_Sales_Ontario
FROM sales_data
WHERE 
    [Product Sub-Category] = 'Appliances'
    AND Province = 'Ontario';

-- Q4: Bottom 10 customers by total sales
SELECT 
    [Customer Name],
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY [Customer Name]
ORDER BY Total_Sales ASC
LIMIT 10;

-- Q5: Shipping method with the highest estimated shipping cost
SELECT 
    [Ship Mode], 
    SUM(Sales - Profit) AS Estimated_Shipping_Cost
FROM sales_data
GROUP BY [Ship Mode]
ORDER BY Estimated_Shipping_Cost DESC
LIMIT 1;

-- CASE SCENARIO II

-- Q6: Most valuable customers and their preferred category
SELECT 
    [Customer Name], 
    [Customer Segment],
    [Product Category],
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY [Customer Name], [Customer Segment], [Product Category]
ORDER BY Total_Sales DESC
LIMIT 5;

-- Q7: Top small business customer
SELECT 
    [Customer Name],
    SUM(Sales) AS Total_Sales
FROM sales_data
WHERE [Customer Segment] = 'Small Business'
GROUP BY [Customer Name]
ORDER BY Total_Sales DESC
LIMIT 1;

-- Q8: Corporate customer with the most orders from 2009–2012
SELECT 
    [Customer Name],
    COUNT([Order ID]) AS Order_Count
FROM sales_data
WHERE 
    [Customer Segment] = 'Corporate' AND 
    YEAR(STR_TO_DATE([Order Date], '%m/%d/%Y')) BETWEEN 2009 AND 2012
GROUP BY [Customer Name]
ORDER BY Order_Count DESC
LIMIT 1;

-- Q9: Most profitable consumer customer
SELECT 
    [Customer Name],
    SUM(Profit) AS Total_Profit
FROM sales_data
WHERE [Customer Segment] = 'Consumer'
GROUP BY [Customer Name]
ORDER BY Total_Profit DESC
LIMIT 1;

-- Q10: Returned items and segment
-- NOTE: No "Returned" column found in the dataset.
-- Placeholder query if such column existed:
-- SELECT DISTINCT [Customer Name], [Customer Segment]
-- FROM sales_data
-- WHERE Returned = 'Yes';

-- Q11: Was shipping method appropriate for order priority?
SELECT 
    [Order Priority], 
    [Ship Mode], 
    COUNT(*) AS Order_Count
FROM sales_data
GROUP BY [Order Priority], [Ship Mode]
ORDER BY [Order Priority];
