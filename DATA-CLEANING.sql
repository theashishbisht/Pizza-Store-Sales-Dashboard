-- :::: DATA CLEANING :::: --

/* 
We imported the CSV files for 'pizza_types' and 'pizzas' directly since they contain less complex data. 
However, for the 'orders' and 'order_details' tables, we first need to create tables in SQL. 
We'll insert the data into these tables while characterizing the correct data types for each column and setting primary keys.
*/ 

SELECT * FROM pizzastore.pizza_types;

create table orders (
order_id int not null,
order_date date not null,
order_time time not null,
primary key(order_id));

create table order_details (
order_details_id int not null,
order_id int not null,
pizza_id text not null,
qty int not null,
primary key(order_details_id));

SELECT * FROM pizzastore.pizzas;
SELECT * FROM pizzastore.pizza_types;


-- :::: Problem Statements :::: --
/* 
1. Retrieve the total number of orders placed.
2. Calculate the total revenue generated from pizza sales.
3. Identify the highest-priced pizza.
4. Identify the most common pizza size ordered.
5. List the top 5 most ordered pizza types along with their quantities.

Intermediate:
1. Join the necessary tables to find the total quantity of each pizza ordered.
2. Determine the distribution of orders by hour of the day.
3. Join relevant tables to find the category-wise distribution of pizzas.
4. Group the orders by date and calculate the average number of pizzas ordered per day.
5. Determine the top 3 most ordered pizza types based on revenue.

Advanced:
1. Calculate the percentage contribution of each pizza type to total revenue.
2. Analyze the cumulative revenue generated over time.
3. Determine the top 3 most ordered pizza types based on revenue for each pizza category.
*/

