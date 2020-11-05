use AdventureWorksDW2017;


--1)

select FirstName, LastName, EmailAddress as EmailId from DimEmployee
where Title = 'Database Administrator';

--2)

select cust.FirstName as FirstName, cust.LastName as LastName, 
geo.EnglishCountryRegionName as EnglishCountryRegionName
from (select * from DimCustomer where EnglishOccupation ='Skilled Manual') as cust
join (select * from DimGeography where EnglishCountryRegionName = 'France') as geo 
on cust.GeographyKey = geo.GeographyKey;

---3)
select distinct geo.City as City, geo.EnglishCountryRegionName as EnglishCountryRegionName
from DimGeography as geo
where geo.GeographyKey not in (select GeographyKey from DimCustomer);

select distinct geo.City as City, geo.EnglishCountryRegionName as EnglishCountryRegionName
from DimGeography as geo
left join DimCustomer as cust
on geo.GeographyKey = cust.GeographyKey
where cust.Geographykey is null;


