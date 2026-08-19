-- Delta Live Tables Bronze Layer
CREATE OR REFRESH STREAMING LIVE TABLE orders_bronze
AS SELECT * FROM cloud_files(
  '/data/orders',
  'csv',
  map('header', 'true')
);

-- Delta Live Tables Silver Layer
CREATE OR REFRESH STREAMING LIVE TABLE orders_silver
AS SELECT 
  order_id,
  customer_id,
  product_id,
  quantity,
  order_date
FROM STREAM(LIVE.orders_bronze)
WHERE order_id IS NOT NULL;

-- Delta Live Tables Gold Layer
CREATE OR REFRESH LIVE TABLE orders_gold
AS SELECT 
  customer_id,
  COUNT(*) as total_orders,
  SUM(quantity) as total_quantity
FROM LIVE.orders_silver
GROUP BY customer_id;
