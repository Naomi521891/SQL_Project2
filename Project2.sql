USE NAOMI;

--Retriving  and displaying all data from two tables
SELECT * FROM [babyNamesUSYOB_full];
SELECT * FROM [babyNamesUSYOB_mostpopular];

--top 5 baby names
SELECT TOP 5 Name, SUM(Number) AS TotalBirths
FROM babyNamesUSYOB_full
GROUP BY Name
ORDER BY TotalBirths DESC;

--Least popular names
SELECT TOP 10 Name, SUM(Number) AS TotalBirths
FROM babyNamesUSYOB_full
GROUP BY Name
ORDER BY TotalBirths ASC;


--displaying top 1 name of high birth
SELECT TOP 1 Name, MAX(Number) AS HighestBirths
FROM babyNamesUSYOB_full
GROUP BY Name
ORDER BY HighestBirths DESC;

--remove duplicate names
SELECT DISTINCT bnf.Name
FROM babyNamesUSYOB_full bnf
INNER JOIN babyNamesUSYOB_mostpopular bnm
ON bnf.Name = bnm.Name;


--compare 2 tables
SELECT bnf.YearOfBirth, bnf.Name, bnf.Number
FROM babyNamesUSYOB_full bnf
INNER JOIN babyNamesUSYOB_mostpopular bnm
ON bnf.Name = bnm.Name AND bnf.YearOfBirth = bnm.YearOfBirth;



--most popular names by gender 
SELECT Sex, Name, SUM(Number) AS TotalBirths
FROM babyNamesUSYOB_full
GROUP BY Sex, Name
ORDER BY Sex, TotalBirths DESC;


/*joined two tables selecting the columns i want to display. i want to display year birth
that are < than 1000 and also display name alphabetically*/

SELECT DISTINCT bf.Name, bm.YearOfBirth, bf.Sex 
FROM [babyNamesUSYOB_full] bf
INNER JOIN [babyNamesUSYOB_mostpopular] bm
on bf.Number =bm.Number
WHERE bm.YearOfBirth > 1000
order by bf.Name;






--select statement that only shows female names
Select Name, Sex 
from [babyNamesUSYOB_full]
where Sex = 'f';

select sum(Number) as Total_number
from [babyNamesUSYOB_full] 
WHERE Sex= 'M'



select sum(Number) as Total_number
from [babyNamesUSYOB_full] ;

select COUNT(Number) as Total
from [babyNamesUSYOB_full] ;



--case statement
SELECT YearOfBirth,
SUM(CASE WHEN Sex = 'M' THEN Number ELSE 0 END) AS Male,
SUM(CASE WHEN Sex = 'F' THEN Number ELSE 0 END) AS Female
FROM babyNamesUSYOB_full
GROUP BY YearOfBirth
ORDER BY YearOfBirth;


--joining and displying all te data in one
SELECT *
FROM [babyNamesUSYOB_full] bf
INNER JOIN [babyNamesUSYOB_mostpopular] bm
on bf.Number =bm.Number;


--displaying the total birth, names and birt year by descending order
SELECT YearOfBirth, Name, SUM(Number) AS TotalBirths
FROM babyNamesUSYOB_full
GROUP BY YearOfBirth, Name
ORDER BY YearOfBirth, TotalBirths DESC;