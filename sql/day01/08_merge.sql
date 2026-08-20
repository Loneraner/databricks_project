MERGE INTO training.employee tgt
USING employee_updates src
ON tgt.emp_id = src.emp_id


WHEN MATCHED THEN
UPDATE SET *


WHEN NOT MATCHED THEN
INSERT *;
