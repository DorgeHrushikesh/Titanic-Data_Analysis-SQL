---Titanic-Data_Analysis

select * from titanic

--1.Show the first 10 rows of the database ?

select Top 10 * from titanic;


--2.Show the Last 10 rows of the database ?

SELECT TOP 10 *
FROM titanic
ORDER BY PassengerId DESC;


--3. Find the number of passengers who survived ?

select count(*) as "Passengers_survived"  from titanic where Survived = 1


--4. Find the average age of all passengers ?

select avg(age) from titanic


--5. Find the numbers of passengers in each class ?

select Pclass,count(*) as "No.of.Passengers" from titanic group by Pclass


--6. Find the first 10 rows of the dataset sorted by passenger class in desc order ?

select Pclass, count(*) from titanic group by Pclass order by Pclass asc;
--[ select Pclass,count(*) from titanic group by Pclass order by count(8) asc; ]


--7. Find the average fare paid by passengers in each class ?

select Pclass,avg(Fare) as "Avg_fare" from titanic group by Pclass;


--8.Find the name of the passenger with the highest fire ?

----[select max(Fare) from titanic]
select name, Fare from titanic where fare = (select max(Fare) from titanic);


--9. Find the name of the passengers who had the highest age among the survivors ?

----[select max(age) from titanic where Survived = 1]
select name from titanic where age = (select max(age) from titanic where Survived = 1)
and Survived = 1


--10. Find the number of passengers who paid more than the average fare ?

----[select avg(Fare) from titanic]
select count(*) as Num_passengers from titanic where Fare > (select avg(Fare) from titanic);


--11. Find the name of the passengers who had the most parents or children on board ?

----[select max (Parch) from titanic]
select name from titanic where Parch = (select max (Parch) from titanic)


--12. Find the Numbers of male and famale passengers who survived,
--and order the results by sex in ascending order ?

select Sex, count (*) as Num_Survived from titanic where Survived = 1
group by Sex
order by Sex asc;


--13. Find the Name,Age, and Fare of the Oldest passengers who survived.

----[select max (Age) from titanic where Survived = 1]
select name,Age,Fare from titanic where age = (select max (Age) from titanic where Survived = 1)
and Survived = 1


--14. Find the Name and Age of the youngest famale Passengers who survived in third class ?

--[select min(Age) from titanic where Sex= 'female' and Pclass = 3 and Survived = 1]

select name, age from titanic where sex =  'female' and Pclass = 3 and Survived =1 
and age =(select min(Age) from titanic where Sex= 'female' and Pclass = 3 and Survived = 1
)


--15. Find the Numbers Of male and female Passengers ?

----[SELECT sex,COUNT(*) as 'num_male','num_female' from titanic group by Sex;]
    
select
sum(case when Sex = 'male' then 1 else 0 end) as Num_male,
sum(case when Sex = 'female' then 1 else 0 end) as Num_female
 from titanic
	
--16. Select all passengers who traveled in a cabin than was shared by other Passengers ?

----[select Cabin from titanic group by cabin having count (*) = 1]
select * from titanic where cabin in
(select Cabin from titanic group by cabin having count (*) = 1);

