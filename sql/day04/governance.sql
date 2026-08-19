-- Add Table Comment
COMMENT ON TABLE training.employee IS 'Employee master data';

-- Add Column Comment
ALTER TABLE training.employee 
ALTER COLUMN salary COMMENT 'Employee salary in INR';

-- Add Tags
ALTER TABLE training.employee SET TAGS ('domain' = 'hr', 'pii' = 'true');

-- View Tags
DESCRIBE EXTENDED training.employee;
