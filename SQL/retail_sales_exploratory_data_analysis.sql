use `project`;
select * from shopsmart_customers_2;

Select count(*) From shopsmart_customers_2;

select count(*)
from shopsmart_customers_2 
where Age is Null;

select count(*)
from shopsmart_customers_2 
where Age is Null;

select count(*)
from shopsmart_customers_2 
where Device_Type is Null;


select Gender, count(*)
from shopsmart_customers_2
group by Gender
order by Gender;

select City_Tier, count(*)
from shopsmart_customers_2
group by City_Tier
order by City_Tier;

select Preferred_Category, count(*)
from shopsmart_customers_2
group by Preferred_Category
order by count(*) desc
limit 5;

select School_Type, count(*)
from shopsmart_customers_2
group by School_Type
order by count(*) desc;


select Payment_Method, count(*)
from shopsmart_customers_2
group by Payment_Method
order by count(*) desc;


select Signup_Source, count(*)
from shopsmart_customers_2
group by Signup_Source
order by count(*) desc;



Select max(Total_Orders) , Min(Total_Orders), Avg(Total_Orders), max(Total_Spend), Min(Total_Spend), avg(Total_Spend)
from shopsmart_customers_2;

select City_Tier, sum(Total_Spend) as Revenue
from shopsmart_customers_2
group by City_Tier
order by Revenue desc;

select Gender, sum(Total_Spend) as Revenue
from shopsmart_customers_2
group by Gender
order by Revenue desc;


select Preferred_Category, sum(Total_Spend) as Revenue
from shopsmart_customers_2
group by Preferred_Category
order by Revenue desc
limit 5;


select Signup_Source, sum(Total_Spend) as Revenue
from shopsmart_customers_2
group by Signup_Source
order by Revenue desc;


select age_bracket, sum(Total_Spend) as Revenue
from shopsmart_customers_2
group by age_bracket
order by Revenue desc;


SELECT
CASE 
    WHEN Annual_Income < 20000 THEN 'Low Income'
    WHEN Annual_Income BETWEEN 20000 AND 50000 THEN 'Middle Income'
    ELSE 'High Income'
END AS income_group, sum(Total_Spend) as Revenue,
COUNT(*) AS customers
FROM shopsmart_customers_2
GROUP BY income_group;


select Customer_ID , sum(Total_Spend) as Revenue
from shopsmart_customers_2
Group by Customer_ID
Order by Revenue desc
limit 15;