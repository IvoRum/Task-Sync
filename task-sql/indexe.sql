CREATE
UNIQUE
CLUSTERED INDEX IX_MyIndexedView ON WrokerOnProjectWhitTasks (worker_name,due);

-- Check if the view is schema-bound
SELECT OBJECTPROPERTY(OBJECT_ID('dbo.WrokerOnProjectWhitTasks'), 'IsSchemaBound') AS IsSchemaBound;

