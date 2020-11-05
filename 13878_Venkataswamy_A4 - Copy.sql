use AdventureWorksDW2017;

select * from DimEmployee;

select  DepartmentName, max(BaseRate) as Maximum_Baserate from DimEmployee
group by DepartmentName;

select FirstName, LastName, DepartmentName, Title, Max(BaseRate) over (partition by DepartmentName) as Maximum_BaseRate
from DimEmployee;

select FirstName, LastName, DepartmentName, Title, Max(BaseRate) from DimEmployee
group by DepartmentName, FirstName, LastName, Title;

select FirstName, LastName, DepartmentName, Title, BaseRate from DimEmployee as e
where e.BaseRate in (select DepartmentName, Max(BaseRate) from DimEmployee group by DepartmentName)
order by DepartmentName;

select  distinct e.Firstname, e.LastName, e.DepartmentName, e.Title, e.BaseRate from DimEmployee as e
join (select DepartmentName, Max(BaseRate)as Max_BaseRate  from DimEmployee group by DepartmentName) as b
on e.DepartmentName = b.DepartmentName and e.BaseRate = b.Max_BaseRate;


select FirstName, BaseRate from DimEmployee
where FirstName = 'Rob';

with Total_sales_3 as
(select a.EnglishCountryregionName, a.city, a.Total_Sales_Amount, dense_rank() over (partition  by a.englishcountryregionname order by a.Total_sales_amount) as rank_sales from 
(select reg.EnglishCountryregionName, reg.City, Sum(Sales.SalesAmount) as Total_Sales_Amount from FactInternetSales as Sales
Join (select cust.Customerkey, geo.EnglishCountryregionName, geo.City from DimCustomer as cust
      join DimGeography as geo on cust.GeographyKey = geo.Geographykey) as reg
on Sales.CustomerKey = reg.CustomerKey 
Group by reg.EnglishCountryRegionName, reg.city) as a)
 select EnglishCountryRegionName, City, Total_Sales_Amount
 from Total_sales_3
 where rank_sales = 3; 