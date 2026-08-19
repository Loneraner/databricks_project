-- Create Share
CREATE SHARE IF NOT EXISTS my_share;

-- Add Table to Share
ALTER SHARE my_share ADD TABLE my_catalog.training.employee;

-- Create Recipient
CREATE RECIPIENT IF NOT EXISTS my_recipient;

-- Grant Access to Recipient
GRANT SELECT ON SHARE my_share TO RECIPIENT my_recipient;

-- List Shares
SHOW SHARES;
