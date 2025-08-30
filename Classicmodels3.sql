# Subquery 
select avg(orderss)
from
(select orderDate, count(orderNumber) orderss
from orders
group by orderDate) t1;

#CTE 

with cte_orders as
(select orderDate, count(orderNumber) orderss
from orders
group by orderDate)

select avg(orderss)
from cte_orders;

#case statement

select
case when creditLimit < 75000 then 'a: Less tahn $75k'
when creditlimit between 75000 and 100000 then 'b: $75k-$100k'
when creditlimit between 100000 and 150000 then 'c:$100k-$150k'
when creditlimit > 150000 then 'd: over $150k'
else 'other' end as credit_limit_grp,

count(distinct c.customernumber) as customers
from classicmodels.customers c
group by credit_limit_grp;

#Flag Using Case steatement
#create a flag that displays 1 when an order of motorcycles is more than 40

with main_cte as
(
select
t1.ordernumber,
orderdate,
quantityordered,
productname,
productline,
case when quantityordered > 40 and productline = 'Motorcycles' then 1
else 0 end as ordered_over_40_motorcycles
from classicmodels.orders t1
join classicmodels.orderdetails t2 on t1.ordernumber = t2.ordernumber
join classicmodels.products t3 on t2.productcode = t3.productcode
)
select orderdate, sum(ordered_over_40_motorcycles) as over_40_bike_sale
from main_cte
group by orderdate;


#WINDOW FUNCTIONS
#ROW NUMBER

Select distinct
t3.customername,
t1.customernumber,
t1.ordernumber,
orderdate,
productcode,
row_number() over (partition by t3.customernumber order by orderdate) as
purchase_number
from classicmodels.orders t1
join classicmodels.orderdetails t2 on t1.ordernumber = t2.ordernumber
join classicmodels.customers t3 on t1.customernumber = t3.customernumber
order by t3.customername;

# Display each custmore and the second order they placed.

with main_cte as
(
select
customernumber,
t1.ordernumber,
row_number() over (partition by customernumber order by
orderdate) as purchase_number
from classicmodels.orders t1
order by customernumber, t1.ordernumber
)
select * from main_cte 
where purchase_number = 2;

# More on window functions: LEAD AND LAG

#LEAD

SELECT customernumber,
paymentdate,
amount,
lead(amount) over (partition by customernumber order by
paymentdate) as next_payment
FROM classicmodels.payments;

#LAG

SELECT customernumber,
paymentdate,
amount,
lag(amount) over (partition by customernumber order by
paymentdate) as Previous_payment
FROM classicmodels.payments;

#Display the orderdate, ordernumber, salesrepemployeenumber for each sales reps second order

with cte_main as
(
select orderdate, t1.orderNumber, salesRepEmployeeNumber,
row_number() over(partition by salesRepEmployeeNumber 
order by orderDate) as reporder_number
from orders t1
inner join customers t2
on t1.customerNumber = t2.customerNumber
inner join employees t3
on t2.salesRepEmployeeNumber = t3.employeeNumber
)

select *
from cte_main
where reporder_number = 2;

# DATE FUNCTION ( DATE DIFF, DATE ADD, DATE SUB)

select ordernumber,
orderdate,
year(orderdate) as year,
month(orderdate) as month,
day(orderdate) as day
from classicmodels.orders;

# show today's date

 select now() as current_date1;
 
 select ordernumber, requiredDate, orderDate,
datediff(requireddate, orderdate) days_until_required
from orders ;

# Add one year to required date

select ordernumber,
orderdate,
date_add(requireddate, interval 1 year) as one_year_from_order
from orders ;

# Exercise
select date_add(orderdate, interval 2 year ) as two_YEAR_AFTER,
date_sub(orderdate, interval 5 month) as five_months_ago
from orders;


# STRING FUNCTIONS (CAST, SUBSTRING, CONCAT)

#cast

select *,
cast(paymentDate as datetime) as payment_time
from payments;

# Substring

Select*,
substring(city,1,2) as city_code
from customers;

#CONCAT

select customerName,
city,
state,
concat(city,' ', state) as city_state
from customers;


