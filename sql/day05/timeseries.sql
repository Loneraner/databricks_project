-- Generate Date Series
SELECT sequence(
  to_date('2025-01-01'), 
  to_date('2025-12-31'), 
  interval 1 day
) as date_range;

-- Moving Average
SELECT 
    order_date,
    quantity,
    AVG(quantity) OVER (
        ORDER BY order_date 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) as moving_avg_3day
FROM training.orders;

-- Year over Year Comparison
SELECT 
    year(order_date) as year,
    month(order_date) as month,
    SUM(quantity) as total_quantity
FROM training.orders
GROUP BY year(order_date), month(order_date)
ORDER BY year, month;
