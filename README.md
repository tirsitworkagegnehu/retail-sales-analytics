ShopMart Retail Analytics Project (SQL + Power BI)
Project Overview
This project focuses on transforming a raw retail dataset into a clean, structured, and analysis-ready dataset using SQL, followed by building interactive dashboards in Power BI.
The dataset contained duplicate records, inconsistent categorical values, missing data, and invalid numeric entries. The goal was to build a reliable dataset for business intelligence and customer analytics.
This project demonstrates a full data workflow:
Data Cleaning (SQL) → Data Structuring → Dashboarding (Power BI)



Business Objective
Retail datasets often suffer from inconsistencies that reduce the reliability of insights. This project aimed to:
•	Clean and standardize raw customer data 
•	Remove duplicates and unreliable records 
•	Fix inconsistent categorical and numerical values 
•	Prepare a trusted dataset for analytics 
•	Build dashboards for business decision-making 



Tools & Technologies
•	SQL (MySQL) 
•	Power BI 
•	Window Functions 
•	CTEs (Common Table Expressions) 



Data Cleaning & Transformation (SQL)
1. Data Preparation
•	Created a working copy of the dataset for transformation 
•	Structured raw data into a clean staging table 

2. Duplicate Handling
•	Identified duplicates using ROW_NUMBER() with PARTITION BY 
•	Validated duplicates using CTEs 
•	Removed redundant records to ensure data integrity 

3. Data Standardization
Cleaned and standardized multiple fields:
•	Gender → unified inconsistent labels (Male/Female variations) 
•	City Tier → standardized all formats into consistent categories 
•	Preferred Category → grouped variations into unified business categories 
•	Payment Method → normalized (COD, UPI, Wallet, Net Banking, etc.) 
•	Device Type & Language → standardized formatting and naming 
•	Text Fields → cleaned using TRIM() and formatting functions 

4. Data Corrections
•	Handled negative values using ABS() for relevant fields 
•	Corrected invalid numeric entries 
•	Created derived features such as: 
o	Age Bracket segmentation 
•	Ensured consistency across numerical fields like: 
o	Total Orders 
o	Total Spend 
o	App Sessions 

5. Missing Value Handling
•	Identified NULL and blank values across dataset 
•	Replaced missing values using business logic 
•	Standardized missing categorical values as “Unknown” 
•	Ensured dataset completeness for reporting and dashboarding 



Power BI Dashboards
After cleaning the dataset in SQL, three interactive dashboards were built in Power BI:
1. Customer Overview Dashboard
•	Customer segmentation by age, gender, and city tier 
•	High-level customer distribution insights
2. Sales Performance Dashboard
•	Total revenue trends 
•	Order volume analysis 
•	Spending behavior patterns 
3. Customer Behavior Dashboard
•	App usage patterns 
•	Discount usage behavior 
•	Category preferences and engagement trends 


Key Insights
•	Customers show clear segmentation patterns based on age and behavior 
•	Payment method distribution highlights strong digital adoption 
•	Certain customer groups drive higher engagement and spending 
•	Data cleaning significantly improved accuracy of downstream insights 

Business Impact
This project transformed raw, inconsistent data into a reliable analytics dataset that supports:
•	Customer segmentation strategies 
•	Revenue and sales analysis 
•	Behavioral trend tracking 
•	Data-driven decision-making via dashboards 

Future Improvements
•	Add Python based advanced analytics (predictive modeling) 
•	Build cohort analysis for customer retention 
•	Expand Power BI dashboards with drill through features 
•	Automate ETL pipeline for real time updates 
