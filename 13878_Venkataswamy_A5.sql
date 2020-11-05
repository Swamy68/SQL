use AdventureWorksDW2017;
---1)
select * from DimEmployee
where EmailAddress in 
(select EmailAddress from DimEmployee group by EmailAddress having count(EmailAddress) > 1);


---2)
select * from DimEmployee
where startdate in (select startdate from DimEmployee
where datediff(MONTH,startdate,(select max(startDate) from DimEmployee)) < 12);


