# 📱 Smartphone Market Analysis (2023)

## 📌 Project Overview
In this project, I analyzed a dataset of global smartphones released in 2023 to understand pricing trends, brand positioning, and hardware specs. My goal was to turn raw smartphone data into clear, actionable insights using SQL Server for analysis and Excel for interactive reporting.

### 🛠️ Tools Used
- **SQL Server:** Used to query the dataset, clean null values, and extract key metrics (KPIs).
- **Microsoft Excel:** Used to build Pivot Tables, charts, and an interactive dashboard for visual reporting.
- **Git & GitHub:** Used for documentation and version control.

#### 🧹 Data Cleaning & Preparation
Before analyzing the data, I spent time cleaning and structuring the dataset to make sure the metrics were accurate:
- **Handling Missing Values:** Cleaned missing values in key columns like price, rating, and specs.
- **Fixing Data Types:** Converted price columns to numeric formats and split string values where necessary.
- **Removing Duplicates:** Checked for duplicate phone models and removed repetitive records.
- **Standardizing Brand Names:** Unified brand text formatting so group-by queries in SQL would aggregate correctly.

##### 📊 Key Performance Indicators & SQL Queries

To extract actionable business insights from the market dataset, I designed a series of aggregate T-SQL queries in SQL Server. These metrics evaluate core market volume, brand positioning, and the adoption rate of modern hardware features.

---

1️⃣ Total Brands Overview
Evaluates overall market diversity and brand competition.
```sql
SELECT 
    COUNT(DISTINCT brand_name) AS Total_brand 
FROM smartphone;```


2️⃣ Total Models Analyzed
Measures total product choices available across all manufacturers.

```sql
SELECT 
    COUNT(*) AS Total_Models 
FROM smartphone;
```

3️⃣ Overall Average Price
Calculates the baseline average market price across all devices.

```sql
SELECT 
    CAST(AVG(CAST(price AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS Overall_Avg_Price 
FROM smartphone;
```

4️⃣ Premium Brand Leader
Identifies the brand leading the highest average device price point.

```sql
SELECT TOP 1
    brand_name AS Premium_Brand,
    COUNT(*) AS Count_Models,
    CAST(AVG(CAST(price AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS Avg_price
FROM smartphone
GROUP BY brand_name
ORDER BY Avg_price DESC;
```

5️⃣ Dominant Processor Brand
Tracks the most common chipset supplier across all listings.

```sql
SELECT TOP 1
    processor_brand AS Dominant_Processor,
    COUNT(*) AS Total_Models
FROM smartphone
WHERE processor_brand IS NOT NULL AND processor_brand <> ''
GROUP BY processor_brand
ORDER BY Total_Models DESC;
```

6️⃣ 5G Market Penetration (%)
Calculates the percentage of smartphones supporting 5G connectivity.

```sql
SELECT 
    CAST((COUNT(CASE WHEN LOWER(_5G_or_not) = 'support' THEN 1 END) * 100.0) / COUNT(*) AS DECIMAL(5,2)) AS [5G_Penetration_Percentage]
FROM smartphone;
```

7️⃣ High Refresh Rate Adoption (>=90Hz %)
Measures display performance penetration across modern devices.

```sql
SELECT 
    CAST((COUNT(CASE WHEN refresh_rate >= 90 THEN 1 END) * 100.0) / COUNT(*) AS DECIMAL(5,2)) AS [High_Refresh_Rate_Share_Percentage]
FROM smartphone
WHERE refresh_rate IS NOT NULL AND refresh_rate > 0;
```

8️⃣ Average Battery Capacity
Determines standard battery sizing across the market.

```sql
SELECT
    CAST(AVG(CAST(battery_capacity AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS Avg_Battery_Capacity
FROM smartphone;
```

9️⃣ High RAM Share (>=8GB %)
Evaluates the prevalence of performance-oriented RAM configurations.

```sql
SELECT
    CAST((COUNT(CASE WHEN ram_capacity >= 8 THEN 1 END) * 100.0) / COUNT(*) AS DECIMAL(5,2)) AS High_Ram_Share_Percentage
FROM smartphone
WHERE ram_capacity IS NOT NULL AND ram_capacity >= 0;
```

🔟 Average Internal Storage
Measures average base storage capacity offered to users.

```sql
SELECT
    CAST(AVG(CAST(internal_memory AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS Average_Internal_Storage
FROM smartphone;
```


###### 💡 Key Dashboard Insights
- **Market Segmentation:** Mid-range smartphones ($200_$500) dominate the market volume, offering the highest value-for-money features.
- **5G & Refresh Rate Adoption:** Over 50% of 2023 models feature 5G connectivity and 90Hz+ displays, making high-speed specs a standard expectation rather than a luxury.
- **RAM vs. Pricing:** 8GB RAM has become the baseline standard for mid-to-high tier devices to ensure smooth performance.