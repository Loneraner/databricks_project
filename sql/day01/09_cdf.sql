ALTER TABLE training.employee
SET TBLPROPERTIES
(
delta.enableChangeDataFeed = true
);
