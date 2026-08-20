-- Z-Ordering
OPTIMIZE training.employee
ZORDER BY (city);

-- Vacuum
VACUUM training.employee RETAIN 168 HOURS;

-- Analyze Table
ANALYZE TABLE training.employee COMPUTE STATISTICS;

-- Cache Table
CACHE TABLE training.employee;
