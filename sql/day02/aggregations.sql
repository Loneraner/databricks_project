-- Basic Aggregations
SELECT 
    city,
    COUNT(*) as employee_count,
    AVG(salary) as avg_salary,
    MAX(salary) as max_salary,
    MIN(salary) as min_salary,
    SUM(salary) as total_salary
FROM training.employee
GROUP BY city;

-- Having Clause
SELECT city, AVG(salary) as avg_salary
FROM training.employee
GROUP BY city
HAVING AVG(salary) > 55000;

-- Group By with Multiple Columns
SELECT category, 
       COUNT(*) as product_count,
       AVG(price) as avg_price
FROM training.products
GROUP BY category;
