-- Window Function - Rank
SELECT
    emp_id,
    name,
    salary,
    RANK() OVER (ORDER BY salary DESC) salary_rank
FROM training.employee;

-- Running Total
SELECT
    order_date,
    quantity,
    SUM(quantity) OVER (ORDER BY order_date) running_total
FROM training.orders;

-- Lead Lag
SELECT
    order_date,
    quantity,
    LAG(quantity) OVER (ORDER BY order_date) previous_quantity,
    LEAD(quantity) OVER (ORDER BY order_date) next_quantity
FROM training.orders;

-- Row Number with Partition
SELECT
    city,
    name,
    salary,
    ROW_NUMBER() OVER (PARTITION BY city ORDER BY salary DESC) as rank_in_city
FROM training.employee;
