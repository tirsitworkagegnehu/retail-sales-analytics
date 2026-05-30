Create database `project`;
use `project`;

select * from project.shopsmart_customers;
select * from project.shopsmart_customers_2;

create table shopsmart_customers_2 like shopsmart_customers;

select * from shopsmart_customers_2;

insert into shopsmart_customers_2 
select * from project.shopsmart_customers;

Select * from shopsmart_customers_2;







-- STEP 1: REMOVE DUPLICATES

Select *,
row_number()
over (partition by Customer_ID, Age, Gender, City_Tier, Account_Age_Days, Annual_Income,
Total_Orders, Avg_Order_Value, Total_Spend, Discount_Usage_Pct, Return_Rate, Preferred_Category,
Days_Since_Last_Order, App_Sessions_Per_Week, Wishlist_Items, Support_Tickets, Library_Visits, School_Type,
Payment_Method, Device_Type, Browser_Language, Screen_Resolution, Signup_Source, True_Segment) as row_num
from shopsmart_customers_2;

Select *,
row_number()
over (partition by Customer_ID, Age, Gender, City_Tier, Account_Age_Days, Annual_Income,
Total_Orders, Avg_Order_Value, Total_Spend, Discount_Usage_Pct, Return_Rate, Preferred_Category,
Days_Since_Last_Order, App_Sessions_Per_Week, Wishlist_Items, Support_Tickets, Library_Visits, School_Type,
Payment_Method, Device_Type, Browser_Language, Screen_Resolution, Signup_Source, True_Segment) as row_num
from shopsmart_customers_2;
-- creating cte to check duplicates

with Duplicate_values as
(
	Select *,
	row_number()
	over (partition by Customer_ID, Age, Gender, City_Tier, Account_Age_Days, Annual_Income,
	Total_Orders, Avg_Order_Value, Total_Spend, Discount_Usage_Pct, Return_Rate, Preferred_Category,
	Days_Since_Last_Order, App_Sessions_Per_Week, Wishlist_Items, Support_Tickets, Library_Visits, School_Type,
	Payment_Method, Device_Type, Browser_Language, Screen_Resolution, Signup_Source, True_Segment) as row_num
	from shopsmart_customers_2
)
select * from Duplicate_values
where row_num > 1;

-- no duplicate values if there were duplicate values we would create another table to remove duplicates

CREATE TABLE `shopsmart_customers_3` (
  `Customer_ID` text,
  `Age` int DEFAULT NULL,
  `Gender` text,
  `City_Tier` text,
  `Account_Age_Days` double DEFAULT NULL,
  `Annual_Income` double DEFAULT NULL,
  `Total_Orders` int DEFAULT NULL,
  `Avg_Order_Value` double DEFAULT NULL,
  `Total_Spend` double DEFAULT NULL,
  `Discount_Usage_Pct` text,
  `Return_Rate` double DEFAULT NULL,
  `Preferred_Category` text,
  `Days_Since_Last_Order` int DEFAULT NULL,
  `App_Sessions_Per_Week` double DEFAULT NULL,
  `Wishlist_Items` int DEFAULT NULL,
  `Support_Tickets` int DEFAULT NULL,
  `Library_Visits` text,
  `School_Type` text,
  `Payment_Method` text,
  `Device_Type` text,
  `Browser_Language` text,
  `Screen_Resolution` text,
  `Signup_Source` text,
  `True_Segment` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into shopsmart_customers_3
Select *,
	row_number()
	over (partition by Customer_ID, Age, Gender, City_Tier, Account_Age_Days, Annual_Income,
	Total_Orders, Avg_Order_Value, Total_Spend, Discount_Usage_Pct, Return_Rate, Preferred_Category,
	Days_Since_Last_Order, App_Sessions_Per_Week, Wishlist_Items, Support_Tickets, Library_Visits, School_Type,
	Payment_Method, Device_Type, Browser_Language, Screen_Resolution, Signup_Source, True_Segment) as row_num
	from shopsmart_customers_2;
select * from shopsmart_customers_3;

delete from shopsmart_customers_3
where row_num > 1;









-- STEP 2: STANDARDIZING DATA 

select * from shopsmart_customers_2;
-- Customer_ID
Select Customer_ID, length(Customer_ID)
from shopsmart_customers_2
where length(Customer_ID) != 11;

-- Age
select age from shopsmart_customers_2;



-- Gender
select Gender, trim(Gender) from shopsmart_customers_2;
update shopsmart_customers_2
set Gender = trim(Gender);

select distinct Gender 
from shopsmart_customers_2;


update shopsmart_customers_2
set Gender = 'Female'
where Gender ='f' or Gender ='woman' or Gender = 'FEMALE';

update shopsmart_customers_2
set Gender = 'Male'
where Gender ='m' or Gender ='man' or Gender = 'MALE';



-- City_Tier
select City_Tier, 
trim(City_Tier) from shopsmart_customers_2;

update shopsmart_customers_2
set City_Tier = trim(City_Tier);

select distinct City_Tier from shopsmart_customers_2
where City_Tier like "%1%";

update shopsmart_customers_2
set City_Tier = 'Tier 1'
where City_Tier = 'Tier-1'
	or City_Tier = 'Tier1'
	or City_Tier = 'Tier 1'
    or City_Tier = 'TIER_1'
    or City_Tier = 'T1';

select distinct City_Tier from shopsmart_customers_2
where City_Tier like "%2%";

update shopsmart_customers_2
set City_Tier = 'Tier 2'
where City_Tier = 'TIER2'
	or City_Tier = 'tier-2'
	or City_Tier = 'T2'
    or City_Tier = 'TIER 2'
    or City_Tier = 'TIER_2';
    
select distinct City_Tier from shopsmart_customers_2
where City_Tier like "%3%";

update shopsmart_customers_2
set City_Tier = 'Tier 3'
where City_Tier = 'Tier3'
	or City_Tier = 'Tier 3'
	or City_Tier = 'Tier-3'
    or City_Tier = 'TIER_3'
    or City_Tier = 'T3';

select distinct City_Tier from shopsmart_customers_2
order by City_Tier;

update shopsmart_customers_2
set City_Tier = '1'
Where City_Tier = 'Tier 1';

update shopsmart_customers_2
set City_Tier = '2'
Where City_Tier = 'Tier 2';

update shopsmart_customers_2
set City_Tier = '3'
Where City_Tier = 'Tier 3';



-- Account_Age_Days : number of days since signup
select distinct Account_Age_Days from shopsmart_customers_2
order by Account_Age_Days;



-- Annual_Income
select Annual_Income from shopsmart_customers_2
order by Annual_Income;


-- Total_Orders
select distinct Total_Orders from shopsmart_customers_2
order by Total_Orders;

select distinct Total_Orders from shopsmart_customers_2
where Total_Orders < 0
order by Total_Orders;

update shopsmart_customers_2
set Total_Orders = ABS(Total_Orders)
where Total_Orders < 0;



-- Avg_Order_Value
select distinct Avg_Order_Value from shopsmart_customers_2
order by Avg_Order_Value ;



-- Total_Spend
select distinct Total_Spend from shopsmart_customers_2
order by Total_Spend;



-- Discount_Usage_Pct
select distinct Discount_Usage_Pct from shopsmart_customers_2
order by Discount_Usage_Pct;



-- Return_Rate
select distinct Return_Rate from shopsmart_customers_2
order by Return_Rate;

update shopsmart_customers_2
set Return_Rate = Abs(Return_Rate)
where Return_Rate < 1;

-- Preferred_Category
select distinct Preferred_Category, trim(Preferred_Category) from shopsmart_customers_2
order by Preferred_Category;

update shopsmart_customers_2
set Preferred_Category= trim(Preferred_Category);


select distinct Preferred_Category
from shopsmart_customers_2
order by Preferred_Category;


update shopsmart_customers_2
set Preferred_Category = "Clothing"
where Preferred_Category= 'CLOTH'
	or Preferred_Category= 'clothing';


update shopsmart_customers_2
set Preferred_Category = "Beauty"
where Preferred_Category= 'BEAUTY'
	or Preferred_Category='beauty_care' ;
    

update shopsmart_customers_2
set Preferred_Category = "Cosmetics"
where Preferred_Category= 'COSM';


update shopsmart_customers_2
set Preferred_Category = 'Electronics'
where Preferred_Category ='ELEC'
	or Preferred_Category ='Elect'
    or Preferred_Category ='Electronic'
    or Preferred_Category ='Electronic Items'
    or Preferred_Category ='Electronics';


update shopsmart_customers_2
set Preferred_Category = 'Grocery'
where Preferred_Category ='GROC'
	or Preferred_Category ='GROCERIES'
    or Preferred_Category ='grocery';


update shopsmart_customers_2
set Preferred_Category = 'Home Decor'
where Preferred_Category ='home_decor'
	or Preferred_Category ='HomeDecor';


update shopsmart_customers_2
set Preferred_Category = 'Jewelry'
where Preferred_Category ='JEWEL'
	or Preferred_Category ='Jewellery'
	or Preferred_Category ='jewelry';
    

update shopsmart_customers_2
set Preferred_Category = 'Luxury'
where Preferred_Category ='lux'
	or Preferred_Category ='Luxury';
    

UPDATE shopsmart_customers_2
SET Preferred_Category = CONCAT(
    UPPER(LEFT(Preferred_Category, 1)), 
    LOWER(SUBSTRING(Preferred_Category, 2))
);

select distinct Preferred_Category
from shopsmart_customers_2
order by Preferred_Category;


-- Days_Since_Last_Order

select distinct Days_Since_Last_Order
from shopsmart_customers_2
order by Days_Since_Last_Order;



-- App_Sessions_Per_Week

select distinct App_Sessions_Per_Week
from shopsmart_customers_2
order by App_Sessions_Per_Week;

update shopsmart_customers_2
set App_Sessions_Per_Week= ABS(App_Sessions_Per_Week)
where App_Sessions_Per_Week < 0;



-- Wishlist_Items

select distinct Wishlist_Items
from project.shopsmart_customers_2
order by Wishlist_Items;



-- Support_Tickets  number of times a customer has contacted support.

select distinct Support_Tickets
from shopsmart_customers_2
order by Support_Tickets;



-- Library_Visits

select distinct Library_Visits
from shopsmart_customers_2
order by Library_Visits;

update shopsmart_customers_2
set Library_Visits = cast(Library_Visits as double);



-- School_Type

select distinct School_Type
from shopsmart_customers_2
order by School_Type;

select School_Type, trim( School_type)
from shopsmart_customers_2
order by School_Type;

update shopsmart_customers_2
set School_Type = trim( School_type);


update shopsmart_customers_2
set School_Type = 'Government'
where School_Type = 'gov'
	or School_Type = 'government'
	or School_Type = 'GOVT';

update shopsmart_customers_2
set School_Type = 'Private'
where School_Type = 'Priv'
	or School_Type = 'Private'
    or School_Type = 'pvt';

update shopsmart_customers_2
set School_Type = 'Private Ltd'
where School_Type = 'Private Ltd'
	or School_Type = 'pvt ltd';
    
update shopsmart_customers_2
set School_Type = 'Public'
where School_Type = 'public'
	or School_Type = 'PUBLIC'
	or School_Type = 'public';


-- Payment_Method

select Payment_Method, trim(Payment_Method)
from shopsmart_customers_2
order by Payment_Method;

update shopsmart_customers_2
set Payment_Method = trim(Payment_Method);

select Payment_Method
from shopsmart_customers_2
order by Payment_Method;


select  Payment_Method
from shopsmart_customers_2
where Payment_Method like "%cod%"
order by Payment_Method;

update shopsmart_customers_2
set Payment_Method = "Cash on Delivery"
where Payment_Method= "cod"
	or Payment_Method= "COD";


select  Payment_Method
from shopsmart_customers_2
where Payment_Method like "%credit%"
order by Payment_Method;

update shopsmart_customers_2
SET Payment_Method = 'Credit Card'
where Payment_Method= 'Credit card';

select  Payment_Method
from shopsmart_customers_2
where Payment_Method like "%debit%"
order by Payment_Method;


update shopsmart_customers_2
set Payment_Method = 'Debit Card'
where Payment_Method = 'DEBIT CARD'
	or Payment_Method = 'debit card';
    

select  Payment_Method
from shopsmart_customers_2
where Payment_Method like "%net%"
order by Payment_Method;


UPDATE shopsmart_customers_2 
SET 
    Payment_Method = 'Net Banking'
WHERE
    Payment_Method = 'NetBanking'
        OR Payment_Method = 'netbanking'
        OR Payment_Method = 'NETBANKING';
    

select  Payment_Method
from shopsmart_customers_2
where Payment_Method like "%upi%"
order by Payment_Method;


update shopsmart_customers_2
set Payment_Method = 'UPI'
where Payment_Method = 'upi';

select  Payment_Method
from shopsmart_customers_2
where Payment_Method like "%wal%"
order by Payment_Method;


update shopsmart_customers_2
set Payment_Method = 'Wallet'
where Payment_Method = 'WALLET'
	or Payment_Method = 'wallet';
    
    
    
-- Device_Type

select  Device_Type, trim(Device_Type)
from shopsmart_customers_2
order by Device_Type;

update shopsmart_customers_2
set Device_Type = trim(Device_Type);

update shopsmart_customers_2
set Device_Type = concat (
	Upper(Left(Device_Type,1)),
    Lower(Substring(Device_Type,2)));
select distinct Device_Type
from shopsmart_customers_2
order by Device_Type;



-- Browser_Language

select Browser_Language
from shopsmart_customers_2
order by Browser_Language;


Update shopsmart_customers_2
set Browser_Language = 'Bengali (India)'
where Browser_Language = 'bn-IN';

Update shopsmart_customers_2
set Browser_Language = 'English (India)'
where Browser_Language = 'en-IN';

Update shopsmart_customers_2
set Browser_Language = 'English (United States)'
where Browser_Language = 'en-US';

update shopsmart_customers_2
set Browser_Language = 'Gujarati (India)'
where Browser_Language = 'gu-IN';

update shopsmart_customers_2
set Browser_Language = 'Hindi (India)'
where Browser_Language = 'hi-IN';

update shopsmart_customers_2
set Browser_Language = 'Marathi (India)'
where Browser_Language = 'Marathi';

update shopsmart_customers_2
set Browser_Language = 'Tamil (India)'
where Browser_Language = 'ta-IN';


update shopsmart_customers_2
set Browser_Language = 'Telugu (India)'
where Browser_Language = 'te-IN';



-- Screen_Resolution

select Screen_Resolution, trim(Screen_Resolution)
from shopsmart_customers_2
order by Screen_Resolution;

update shopsmart_customers_2
set Screen_Resolution = trim(Screen_Resolution);



-- Signup_Source

select distinct Signup_Source
from shopsmart_customers_2
order by Signup_Source;



-- True_Segment

select distinct True_Segment
from shopsmart_customers_2
order by True_Segment;



-- STEP 3: REMOVE NULLS AND BLANKS

Select *
from project.shopsmart_customers_2
where age is Null
or age = ''
or age = 0;
UPDATE shopsmart_customers_2
SET Age = NULL
WHERE Age = 0;


Select distinct age
from project.shopsmart_customers_2
where age is null
or age > 65
order by age;

update shopsmart_customers_2
set age= Null 
where age >65;


Select *
from project.shopsmart_customers_2
where Discount_Usage_Pct is Null
or Discount_Usage_Pct = ''
or Discount_Usage_Pct < 0;

UPDATE shopsmart_customers_2
SET Discount_Usage_Pct = NULL
WHERE Discount_Usage_Pct = '';

UPDATE shopsmart_customers_2
SET Discount_Usage_Pct = 0
WHERE Discount_Usage_Pct IS NULL
AND Total_Orders > 0;

Select *
from project.shopsmart_customers_2
where Payment_Method is Null
or Payment_Method = '';

update shopsmart_customers_2
set Payment_method = Null
where Payment_method = '';

select Total_Orders, Total_Spend, payment_method
from shopsmart_customers_2
where Payment_Method is null;

UPDATE shopsmart_customers_2
SET Payment_Method = 'Unknown'
WHERE Payment_Method IS NULL;

SELECT Payment_Method, COUNT(*)
FROM shopsmart_customers_2
GROUP BY Payment_Method
order by COUNT(*);


Select *
from project.shopsmart_customers_2
where Device_Type is Null
or Device_Type = '';

update shopsmart_customers_2
set device_type = 'Unknown'
where device_type= NUll;


Select *
from project.shopsmart_customers_2
where Signup_Source is Null
or Signup_Source = '';

UPDATE shopsmart_customers_2 
SET 
    signup_source = 'Unknown'
WHERE
    Signup_Source IS NULL;

Select *
from project.shopsmart_customers_2
where True_Segment is Null
or True_Segment = '';

select *
from project.shopsmart_customers_2;


