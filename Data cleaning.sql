create database TECHNOVA;

use TECHNOVA;

select * from technova_sales;

describe technova_sales;

SELECT Order_ID, COUNT(*) AS counts
FROM technova_sales
GROUP BY Order_ID
HAVING COUNT(*) > 1;

create table sales select * from (
select *, 
row_number() OVER(partition by Order_ID order by Order_Date) as rn
from technova_sales
) t
where rn = 1;

select * from sales;

SELECT Order_ID, COUNT(*) AS counts
FROM sales
GROUP BY Order_ID
HAVING COUNT(*) > 1;

alter table sales
drop column rn;

select * from sales
where City = "";

UPDATE sales
SET City = 'Unknown'
WHERE City = '';
SET SQL_SAFE_UPDATES = 0;

select * from sales
where Discount = "";
 
UPDATE sales
SET Discount = '0%'
WHERE Discount = '';

alter table sales
add column Modified_Discount decimal(5,2);

UPDATE sales
SET Modified_Discount = CAST(REPLACE(Discount, '%', '') AS DECIMAL(5,2));

select * from sales;

alter table sales add column Profit Decimal(10, 10);

update sales set profit = revenue * 0.25;

ALTER TABLE sales
MODIFY profit DECIMAL(15,2);

alter table sales
add column Order_day INT;

update sales
set Order_day = day(Order_Date);

alter table sales
add column Order_Month INT;

update sales
set Order_Month = month(Order_Date);

alter table sales
add column Order_Year int;

update sales
Set Order_Year = year(Order_Date);

select * from sales;

