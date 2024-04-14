-- Retrieve the total number of orders placed.
SELECT 
    COUNT(*) AS Total_orders
FROM
    orders;

-- Calculate the total revenue generated from pizza sales.
SELECT 
    ROUND(SUM(order_details.qty * pizzas.price), 2) AS total_revenue
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;

-- Identify the highest-priced pizza.
select pizza_types.name, pizzas.price  
from pizza_types join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;

-- Identify the most common pizza size ordered the highest among 5 sizes.
select qty, count(order_details_id)
from order_details group by qty;

SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS Most_Common_Pizza_Size
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY Most_Common_Pizza_Size DESC
LIMIT 1;

/* List the top 5 most ordered pizza types!
Along with their quantities.*/
SELECT 
    pizza_types.name, SUM(order_details.qty) AS qty
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY qty DESC
LIMIT 5;
