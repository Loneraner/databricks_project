-- Enable Change Data Feed
ALTER TABLE training.employee
SET TBLPROPERTIES (delta.enableChangeDataFeed = true);

-- Read Change Data
SELECT *
FROM table_changes('training.employee', 0)
ORDER BY _commit_timestamp;

-- CDC with Version Range
SELECT *
FROM table_changes('training.employee', 1, 5)
WHERE _change_type IN ('insert', 'update_postimage');

-- Apply Changes Pattern
MERGE INTO training.target_table tgt
USING (
    SELECT * FROM table_changes('training.source_table', 0)
    WHERE _change_type != 'update_preimage'
) src
ON tgt.id = src.id
WHEN MATCHED AND src._change_type = 'update_postimage' THEN UPDATE SET *
WHEN MATCHED AND src._change_type = 'delete' THEN DELETE
WHEN NOT MATCHED AND src._change_type = 'insert' THEN INSERT *;
