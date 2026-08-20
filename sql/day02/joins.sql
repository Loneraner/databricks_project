-- Inner Join
SELECT o.order_id, c.customer_name, p.product_name, o.quantity
FROM training.orders o
INNER JOIN training.customers c ON o.customer_id = c.customer_id
INNER JOIN training.products p ON o.product_id = p.product_id;

-- Left Join
SELECT c.customer_id, c.customer_name, o.order_id
FROM training.customers c
LEFT JOIN training.orders o ON c.customer_id = o.customer_id;

-- Cross Join
SELECT c.customer_name, p.product_name
FROM training.customers c
CROSS JOIN training.products p;
