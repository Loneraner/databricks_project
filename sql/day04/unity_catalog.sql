-- Create Catalog
CREATE CATALOG IF NOT EXISTS my_catalog;

-- Use Catalog
USE CATALOG my_catalog;

-- Create Schema in Catalog
CREATE SCHEMA IF NOT EXISTS my_catalog.training;

-- Create Table with Full Path
CREATE TABLE my_catalog.training.employee
(
 emp_id INT,
 name STRING,
 city STRING,
 salary INT
)
USING DELTA;

-- Grant Permissions
GRANT SELECT ON TABLE my_catalog.training.employee TO `user@example.com`;
