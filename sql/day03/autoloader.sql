-- Auto Loader Example
CREATE OR REPLACE TABLE training.orders_bronze
AS SELECT * FROM cloud_files(
  '/databricks-datasets/orders',
  'csv',
  map('cloudFiles.inferColumnTypes', 'true',
      'cloudFiles.schemaHints', 'order_id INT, customer_id INT')
);
