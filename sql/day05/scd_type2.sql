-- Create Customer Dimension Table
CREATE TABLE IF NOT EXISTS training.customer_dim
(
    customer_id INT,
    customer_name STRING,
    city STRING,
    start_date DATE,
    end_date DATE,
    is_current BOOLEAN
)
USING DELTA;

-- SCD Type 2 Merge
MERGE INTO training.customer_dim tgt
USING training.customer_stage src
ON tgt.customer_id = src.customer_id
AND tgt.is_current = true

WHEN MATCHED
AND tgt.city <> src.city
THEN UPDATE SET
    tgt.end_date = current_date(),
    tgt.is_current = false

WHEN NOT MATCHED
THEN INSERT
(
    customer_id,
    customer_name,
    city,
    start_date,
    end_date,
    is_current
)
VALUES
(
    src.customer_id,
    src.customer_name,
    src.city,
    current_date(),
    NULL,
    true
);
