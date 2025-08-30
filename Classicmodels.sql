#  All records where customers last name is not Young

select *
from customers
where contactLastName <> 'Young';

# Show customername, firstname, lastname, phone, city & country, where firstname is julie and she is from USA

select customerName, contactFirstName, contactLastName, phone, city, country
from customers
where contactFirstName ='Julie' and country = 'USA';

# Firstname and lastname for customers from Norway and Sweden

select contactFirstName, contactLastName
from customers
where country = 'Norway' or country = 'Sweden';

# show all customers from the usa with surname brown

select *
from customers
where country = 'USA' and contactLastName = 'Brown';

# For employees who are sales rep, display their email

select email
from employees
where jobTitle = 'Sales Rep';

#Upper and lower

select  upper(firstName) as uppercasename
from employees;

#IN and NOT IN

select *
from employees
where upper(email) in ('DMURPHY@CLASSICMODELCARS.COM', 
'MPATTERSO@CLASSICMODELCARS.COM',
 'WPATTERSON@CLASSICMODELCARS.COM') ;
 
 select *
from employees
where upper(email) not in ('DMURPHY@CLASSICMODELCARS.COM', 
'MPATTERSO@CLASSICMODELCARS.COM',
 'WPATTERSON@CLASSICMODELCARS.COM') ;
 
 #Distinct, like & orderby
 
 select distinct country
 from customers;
 
 select city
 from customers
 where city like '%new%';
 
 select *
 from employees
 order by lastName desc, firstName desc;
 
 
 