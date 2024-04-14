-- Intermediate:
 -- Join the necessary tables to find the total quantity of each pizza ordered.
 SELECT 
    distinct(pizza_types.category), SUM(order_details.qty) AS qty
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY qty DESC;

--  Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(order_time) AS per_hour, COUNT(order_id) AS order_count
FROM
    orders
GROUP BY per_hour;

--  Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category;

--  Group the orders by date and calculate the average number of pizzas ordered per day.
--  we have used sub query here.!
SELECT 
    ROUND(AVG(sum_qty), 0) as average_pizza_oredered_per_day
FROM
    (SELECT 
        orders.order_date AS order_date,
            SUM(order_details.qty) AS sum_qty
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY order_date) AS order_qty;

--  Determine the top 3 most ordered pizza types based on revenue.
SELECT pizza_types.name, sum(order_details.qty * pizzas.price) AS total_revenue
FROM pizza_types JOIN
pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by total_revenue desc limit 3;