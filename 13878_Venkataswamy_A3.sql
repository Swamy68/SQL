use AdventureWorksDW2017;

select * from AdventureWorksDW2017.sys.tables;

select * from FactInternetSales;
--1)
select reg.EnglishCountryregionName, Sum(sales.SalesAmount) as Total_Sales_Amount
from FactInternetSales as sales
Join (select cust.Customerkey, geo.EnglishCountryregionName from DimCustomer as cust
      join DimGeography as geo on cust.GeographyKey = geo.Geographykey) as reg
on sales.CustomerKey = reg.CustomerKey
group by reg.EnglishCountryRegionName;


--2)

select reg.EnglishCountryregionName, reg.City, Sum(sales.SalesAmount) as Total_Sales_Amount
from FactInternetSales as sales
Join (select cust.Customerkey, geo.EnglishCountryregionName, geo.City from DimCustomer as cust
      join DimGeography as geo on cust.GeographyKey = geo.Geographykey where geo.EnglishCountryRegionName = 'Australia') as reg
on sales.CustomerKey = reg.CustomerKey
group by reg.EnglishCountryRegionName, reg.city
having Sum(Sales.SalesAmount) > 300000;


--3)

select AD.AccountDescription, PAD.AccountDescription as Parent_Account_Description
from DimAccount as AD
left join DimAccount as PAD
on AD.ParentAccountKey = PAD.AccountKey; 
