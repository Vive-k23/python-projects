# Use bank_inventory, cricket_1 and cricket_2 tables from Online_Day1_InClass and Online_Day2_InClass to solve the queries.

# # Question 1:
# Q1.Write MySQL query to find highest priced product
use bank;
select product,price from bank_inventry
order by price desc limit 1;
# Question 2:

# Q2.Write MySQL query to find third lowest run scorer.
select Player_Name,Runs from cricket_1
order by Runs asc limit 2,1;
# Question 3:
# Q3. Write MySQL query to find player_ID and Player_name which contains “D”.
select Player_Id,Player_Name from cricket_2 where Player_Name like '%D%';
# Question 4:

# Q4.Write MySQL query to extract Player_Name whose name is having second character as 'R'
select * from cricket_2 where substr(Player_Name,2,1)='r';
# Question 5:

# Q5.Write MySQL query to extract Player_Name whose name whose popularity is grater than 10 or charisma is greater than 50
# from tables cricket_1 and cricket_2 using set operator
select Player_Name from cricket_1 where popularity>10 union
select Player_Name from cricket_2 where Charisma>50;
/* Prerequisites */
-- Use the bank_inventory table from Online_Day1_Inclass file to answer the below questions
# Question 6:
# 6) Display the Geo_locations in capital letters from the table Bank_inventory.
select upper(geo_location) from bank_inventry;
# Question 7:
# 7) Display the position of occurance of the string ‘City’ in the column  Geo_location from the table Bank_Inventory.
select instr(geo_location,'CITY') from bank_inventry;
# Question 8:
# 8) Display the column Quantity from the table Bank_Inventory by applying the below formatting: 
-- a) convert the data type from numeric to character 
-- b) Pad the column with 0's  
alter table bank_inventry modify quantity varchar(10);
desc bank_inventry;
select lpad(quantity,3,'0') from bank_inventry;
# To answer 9th question there are few prerquisites to be followed
# PRE - REQUISITE:
Insert into bank_inventry values ( 'MaxGain',    6 , 220.39, 4690.67, 4890 , 'Riverdale-village' ) ;
Insert into bank_inventry values ( 'SuperSave', 7 , 290.30, NULL, 3200.13 ,'Victoria-Town') ;


# Question 9:
# 9) Display the column Geo_location by replacing the underscores with spaces (" ").
select *, replace(geo_location,'-', ' ') as geolocation from bank_inventry;
-- Use the cricket2 table to answer the below questions

# Question 10:

# Q10. Display the columns Player_Name, charisma and Runs by combining into a single comma seperated output. (Name the column as : 'Details')
select*, concat(Player_Name , Charisma, Runs)as Details from cricket_2;