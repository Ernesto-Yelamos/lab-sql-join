# Lab | SQL Join
# In this lab, you will be using the Sakila database of movie rentals.
use sakila;
set sql_safe_updates=0;

### Instructions
	-- 1. List number of films per `category`.
select count(a.film_id) as 'Amount of films', b.name as 'Category' from sakila.film_category as a
join sakila.category as b on a.category_id = b.category_id
group by b.name;
    
	-- 2. Display the first and last names, as well as the address, of each staff member.
select a.first_name as 'First name', a.last_name as 'Last name', b.address as 'Address' from sakila.staff as a
join sakila.address as b on a.address_id = b.address_id
group by a.first_name, a.last_name;    
    
	-- 3. Display the total amount rung up by each staff member in August of 2005.
select count(a.amount) as 'Total amount', b.first_name as 'First name', b.last_name as 'Last name' from sakila.payment as a
join sakila.staff as b on a.staff_id = b.staff_id
where a.payment_date >= 20050801 and a.payment_date <= 20050831
group by b.first_name, b.last_name;

	-- 4. List each film and the number of actors who are listed for that film.
select a.title as 'Title', count(b.actor_id) as 'Amount of actors' from sakila.film as a
join sakila.film_actor as b on a.film_id = b.film_id
group by a.title;
    
	-- 5. Using the tables `payment` and `customer` and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select a.first_name as 'First name', a.last_name as 'Last name', count(b.amount) as 'Amount paid' from sakila.customer as a
join sakila.payment as b on a.customer_id = b.customer_id
group by a.first_name, a.last_name
order by a.last_name;    
    