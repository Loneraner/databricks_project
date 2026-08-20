-- Create Streaming Table
CREATE OR REPLACE TEMP VIEW streaming_orders AS
SELECT * FROM cloud_files(
  '/path/to/orders',
  'csv',
  map('header', 'true')
);

-- Streaming Aggregation
SELECT window.start, window.end, COUNT(*) as order_count
FROM streaming_orders
GROUP BY window(order_date, '1 day');
