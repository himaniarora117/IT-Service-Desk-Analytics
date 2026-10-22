
-- Project 1: IT Service Desk Analytics
-- Database setup and analysis queries
-- Run the analysis queries one at a time.

CREATE DATABASE IF NOT EXISTS it_service_analytics;
USE it_service_analytics;

-- 1. Ticket volume by category
SELECT Category, COUNT(*) AS Total_Tickets
FROM incidents
GROUP BY Category
ORDER BY Total_Tickets DESC;

-- 2. Average resolution time by category
SELECT Category,
       COUNT(*) AS Total_Tickets,
       ROUND(AVG(Resolution_Hours), 2) AS Avg_Resolution_Hours
FROM incidents
GROUP BY Category
ORDER BY Avg_Resolution_Hours DESC;

-- 3. SLA breaches and breach rates by category
SELECT Category,
       COUNT(*) AS Total_Tickets,
       SUM(CASE WHEN Resolution_Hours > SLA_Hours THEN 1 ELSE 0 END) AS SLA_Breaches,
       ROUND(
           100.0 * SUM(CASE WHEN Resolution_Hours > SLA_Hours THEN 1 ELSE 0 END)
           / COUNT(*), 2
       ) AS SLA_Breach_Rate_Percent
FROM incidents
GROUP BY Category
ORDER BY SLA_Breach_Rate_Percent DESC;

-- 4. Overall SLA breach rate
SELECT COUNT(*) AS Total_Tickets,
       SUM(CASE WHEN Resolution_Hours > SLA_Hours THEN 1 ELSE 0 END) AS Total_SLA_Breaches,
       ROUND(
           100.0 * SUM(CASE WHEN Resolution_Hours > SLA_Hours THEN 1 ELSE 0 END)
           / COUNT(*), 2
       ) AS Overall_SLA_Breach_Rate_Percent
FROM incidents;

-- 5. SLA performance by priority
SELECT Priority,
       COUNT(*) AS Total_Tickets,
       ROUND(AVG(Resolution_Hours), 2) AS Avg_Resolution_Hours,
       SUM(CASE WHEN Resolution_Hours > SLA_Hours THEN 1 ELSE 0 END) AS SLA_Breaches,
       ROUND(
           100.0 * SUM(CASE WHEN Resolution_Hours > SLA_Hours THEN 1 ELSE 0 END)
           / COUNT(*), 2
       ) AS SLA_Breach_Rate_Percent
FROM incidents
GROUP BY Priority
ORDER BY SLA_Breach_Rate_Percent DESC;

-- 6. Workload and SLA performance by assignment group
SELECT Assignment_Group,
       COUNT(*) AS Total_Tickets,
       ROUND(AVG(Resolution_Hours), 2) AS Avg_Resolution_Hours,
       SUM(CASE WHEN Resolution_Hours > SLA_Hours THEN 1 ELSE 0 END) AS SLA_Breaches,
       ROUND(
           100.0 * SUM(CASE WHEN Resolution_Hours > SLA_Hours THEN 1 ELSE 0 END)
           / COUNT(*), 2
       ) AS SLA_Breach_Rate_Percent
FROM incidents
GROUP BY Assignment_Group
ORDER BY Total_Tickets DESC;

-- 7. Monthly ticket trends
SELECT DATE_FORMAT(Created_Date, '%Y-%m') AS Month,
       COUNT(*) AS Total_Tickets,
       ROUND(AVG(Resolution_Hours), 2) AS Avg_Resolution_Hours
FROM incidents
GROUP BY DATE_FORMAT(Created_Date, '%Y-%m')
ORDER BY Month;

-- 8. Reopened tickets and reopening rates by category
SELECT Category,
       COUNT(*) AS Total_Tickets,
       SUM(CASE WHEN Reopened = 'Yes' THEN 1 ELSE 0 END) AS Reopened_Tickets,
       ROUND(
           100.0 * SUM(CASE WHEN Reopened = 'Yes' THEN 1 ELSE 0 END)
           / COUNT(*), 2
       ) AS Reopening_Rate_Percent
FROM incidents
GROUP BY Category
ORDER BY Reopening_Rate_Percent DESC;

-- 9. Customer satisfaction by category
SELECT Category,
       COUNT(*) AS Total_Tickets,
       ROUND(AVG(Customer_Satisfaction), 2) AS Avg_Satisfaction
FROM incidents
GROUP BY Category
ORDER BY Avg_Satisfaction DESC;

-- 10A. Location analysis
SELECT Location,
       COUNT(*) AS Total_Tickets,
       ROUND(AVG(Resolution_Hours), 2) AS Avg_Resolution_Hours
FROM incidents
GROUP BY Location
ORDER BY Total_Tickets DESC;

-- 10B. Channel analysis
SELECT Channel,
       COUNT(*) AS Total_Tickets,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM incidents), 2)
           AS Ticket_Share_Percent,
       ROUND(AVG(Resolution_Hours), 2) AS Avg_Resolution_Hours
FROM incidents
GROUP BY Channel
ORDER BY Total_Tickets DESC;

-- 11. Ticket status distribution
SELECT Status,
       COUNT(*) AS Total_Tickets,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM incidents), 2)
           AS Ticket_Share_Percent
FROM incidents
GROUP BY Status
ORDER BY Total_Tickets DESC;

-- 12. Duplicate ticket validation
SELECT COUNT(*) AS Total_Rows,
       COUNT(DISTINCT Ticket_ID) AS Unique_Ticket_IDs,
       COUNT(*) - COUNT(DISTINCT Ticket_ID) AS Duplicate_ID_Count
FROM incidents;
