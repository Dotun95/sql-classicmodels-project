#JOINS
#INNER JOINS

select *
from orders T1
inner join customers t2
on t1.customernumber = t2.customerNumber;

#left and right joins

SELECT 
FIRSTNAME, 
LASTNAME, 
CUSTOMERNAME 
from EMPLOYEES T1
 left join CUSTOMERS T2 
 on T1.EMPLOYEENUMBER = T2.SALESREPEMPLOYEENUMBER;
 
 SELECT 
FIRSTNAME, 
LASTNAME, 
CUSTOMERNAME 
from customers T1
 right join employees T2 
 on T1.SALESREPEMPLOYEENUMBER = T2.EMPLOYEENUMBER;
 
 #Show the customer firstname, last name,orderdate and status for each order in the orders table with a matching customer in the customer table.
 
 select customers.contactFirstName,
 customers.contactLastName,
 orders.orderDate,
 orders.status
 from orders
inner join customers
 on customers.customerNumber = orders.customerNumber;
 
 # Display the firstname and last name of all customers and the order date and ordernumber of all their orders even if the customer made no orders
 
 select t1.contactFirstName,
 t1.contactLastName,
 t2.orderDate,
 t2.orderNumber
 from customers t1
 left join orders t2
 on t1.customerNumber = t2.customerNumber
 where t2.orderNumber is null;

#UNION AND UNION ALL

select *
from customers;

select *
from employees;

select 'customer' as type,
contactFirstName as firstname,
contactLastName as lastname
from customers

union

select 'employee' as type,
firstname,
lastname
from employees;

#SUM

select paymentDate, sum(amount) as total_payment
from payments
group by paymentDate
order by paymentDate;

#Round

select paymentDate, round( sum(amount),1) as total_payment
from payments
group by paymentDate
order by paymentDate;

# Having

select paymentDate, round( sum(amount),1) as total_payment
from payments
group by paymentDate
having total_payment
order by paymentDate;

#COUNT, MIN, MAX & AVG

select count(ordernumber) 
from orders;

# DISPLAY THE HIGHEST AND LOWEST PAYMENT RECEIVED ON THE 9TH OF DECEMBER 2003

select paymentDate,
min(amount) as lowest_payment,
max(amount) as highest_payment
from payments
group by paymentDate
having paymentDate = '2003-12-09';

select avg(amount) as average_payment
from payments;

#Show the customer name of the company which made the most amount of orders
select customername, count(ordernumber) as orderss
from orders a
join customers b
on a.customerNumber = b.customerNumber
group by customerName
order by orderss desc
limit 1;

# Display each customers first and last orderdate

select customers.customerName, min(orderDate) as first_orderdate, max(orderDate) as last_orderdate
from orders
join customers
on orders.customerNumber = customers.customerNumber
group by customerName
order by first_orderdate, last_orderdate;

 





 
 