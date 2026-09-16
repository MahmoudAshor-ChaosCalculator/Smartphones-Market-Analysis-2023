select*
from smartphone;

--Total Brands

Select 
      Count(Distinct brand_name) As Total_brand 
From smartphone;



--Total Models

Select count(*) As Total_Models
From smartphone;


--Overall Average Price

Select 
      Cast(Avg(Cast(price As Decimal(10,2))) As Decimal(10,2)) As Overall_Avg_Price
From smartphone;


--Top Premium Brand Avg Price

Select Top 1
       brand_name As Premium_Brand,
       Count(*) As Count_Models,
       Cast(Avg(Cast(price As Decimal(10,2))) As Decimal(10,2)) As Avg_price
From smartphone
Group by brand_name
Order by Avg_price Desc;



--Top Processor Brand Leader

SELECT TOP 1
    processor_brand AS Dominant_Processor,
    COUNT(*) AS Total_Models
FROM smartphone
WHERE processor_brand IS NOT NULL AND processor_brand <> ''
GROUP BY processor_brand
ORDER BY Total_Models DESC;



--(5G Market Penetration Share %)


SELECT 
    CAST(
        (COUNT(CASE WHEN LOWER(_5G_or_not) = 'support' THEN 1 END) * 100.0) / COUNT(*) 
        AS DECIMAL(5,2)
    ) AS [5G_Penetration_Percentage]
FROM smartphone;


-- % High_Refresh_Rate (>=90) 

SELECT 
    CAST(
        (COUNT(CASE WHEN refresh_rate >= 90 THEN 1 END) * 100.0) / COUNT(*) 
        AS DECIMAL(5,2)
    ) AS [High_Refresh_Rate_Share_Percentage]
FROM smartphone
WHERE refresh_rate IS NOT NULL AND refresh_rate > 0;


-- 8) Average Battery Capacity

    SELECT
          CAST(AVG(CAST(battery_capacity AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS Avg_Battery_Capacity
    FROM smartphone;


-- 9) % High RAM Share (>=8GB)
    
    SELECT
         CAST(
              (COUNT(CASE WHEN ram_capacity >= 8 THEN 1 END) * 100.0) / COUNT(*)
              AS DECIMAL(5,2)
              ) AS High_Ram_Share_Percentage
    FROM smartphone
    WHERE ram_capacity IS NOT NULL AND ram_capacity >= 0;


-- 10) Average Internal Storage

   SELECT
        CAST(AVG(CAST(internal_memory AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS Average_Internal_Storage
    FROM smartphone;




    

    
