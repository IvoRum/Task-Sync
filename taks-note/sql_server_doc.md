# Using SQL-Server whit practicle example

The implementation of the server in the exaple is set up using docker deckstop.

## Create

```
CREATE TABLE Worker(
                         id BIGINT NOT NULL,
                         name VARCHAR(255) NOT NULL,
                         department BIGINT NOT NULL,
                         position BIGINT NOT NULL
);
ALTER TABLE
    Worker ADD CONSTRAINT worker_id_primary PRIMARY KEY(id);

/* Foreign key */
ALTER TABLE
    Task_history ADD CONSTRAINT task_history_worker_foreign FOREIGN KEY(worker) REFERENCES Worker(id);
ALTER TABLE
    Task_history ADD CONSTRAINT task_history_manager_foreign FOREIGN KEY(manager) REFERENCES Worker(id);
```

## Insert

```
INSERT INTO Worker(id, name, department, position) VALUES (6,'Jordan',1,3);
```

## Procedure

SQL Server, a stored procedure is a named collection of SQL statements and procedural logic that is stored in the database and can be executed on demand. Stored procedures are typically used to encapsulate a set of operations or tasks to be performed on the database, providing a way to modularize and reuse code.

`````
create procedure allWorkerInProject(@projectId as INT) as
begin
Select w.name as workerName, d.name as departmentName, p.name as possitionName, pj.name as projectName
from worker w
         inner join Department d on d.id = w.department
         inner join Position p on p.id = w.position
         inner join Worker_projects wp on wp.id_worker = w.id
         inner join Project pj on pj.id = wp.id_project
where pj.id = @projectId
end;
````

Procedure that rollbacks transaction

````
    create procedure rollbackIfSubtaskIsNotFnished(@masterTaskId as INT)
    as begin
        DECLARE
            @subtasks DECIMAL
        Select @subtasks = count(t.id)
        from Sub_task st
                 inner join Task t on st.id_sub_task = t.id
                 inner join Task_history th on th.task = t.id
                 left join Worker w on w.id = th.worker
                 inner join Status s on s.id = th.status
        where st.id_master_task = @masterTaskId
          and th.status != 4

        IF @subtasks > 0
            BEGIN
                RAISERROR
                    ('All sub tasks must be finished before closing ticket.', 16, 1)
                ROLLBACK TRANSACTION
            END
    end;

`````

## Trigger

In SQL Server, a trigger is a special type of stored procedure that automatically executes in response to certain events on a table or view. These events include INSERT, UPDATE, and DELETE operations. Triggers can be used to enforce business rules, perform auditing, maintain referential integrity, or implement complex data validation logic.

Thay are two type: DDL & DML

```
CREATE TRIGGER areAllSubTasksClosed
    ON Task_history
    after UPDATE
    AS
begin
    if UPDATE(status)
        begin
            DECLARE @masterTask DECIMAL;

            select @masterTask = id
            from inserted;

            exec rollbackIfSubtaskIsNotFnished @masterTask;


            DECLARE @startDate DATE;

            Select top 1 @startDate = CONVERT(date, th.time_stamp)
            from Task_history th
            where th.task = @masterTask
            order by th.time_stamp asc;

            DECLARE @NumberOfDays INT;
            SET @NumberOfDays = DATEDIFF(DAY, @startDate, GETDATE());


            UPDATE Task
            set work_time=@NumberOfDays
            from task t
                     inner join Task_history th on th.task = t.id
            where t.id = @masterTask
              and th.status = 4;
        end;
end;
```

## View

When creating a view all field names must be unique.
So in this case where all of the tables have their pk column name be 'id' we need to specify all names for all id columns.

```
create view WorkerOnProjectWhitTasks
as
select t.name as tickate_name, t.work_time, t.due, w.name as worker_name
from Task t
         join Task_history th on t.id = th.task
         join Worker w on th.worker = w.id
         join Worker_projects wp on wp.id_worker = w.id

```

## Functions

In SQL Server, a function is a named, reusable set of Transact-SQL statements that accepts parameters, performs actions, and returns a value or a table. Functions can be used to encapsulate logic and perform calculations or data manipulations within SQL queries, stored procedures, or other functions.

Example a fuction that returns a view

```
CREATE FUNCTION WorkersOnProject(@workerName as VARCHAR(100))
    RETURNS table
        AS
        return
            (
                select *
                from WrokerOnProjectWhitTasks wp
                where wp.worker_name = @workerName
            )
```

Executiong fuction

```
select *
from WorkersOnProject('Jhon')
```

Different way of reiting the same thing but whit the colums that you whant. Can be used to return custom view and mish mash of columns.

```
CREATE FUNCTION dbo.GetWorkerOnProjectWithTasks(@param_value VARCHAR(100))
RETURNS @Result TABLE (
    -- Define the columns same as the columns in your view
    Column1 DATATYPE1,
    Column2 DATATYPE2,
    -- Add more columns as needed
)
AS
BEGIN
    -- Insert data into the result table based on the parameter
    INSERT INTO @Result
    SELECT Column1, Column2 -- Select the columns from your view
    FROM WrokerOnProjectWhitTasks
    WHERE SomeColumn = @param_value; -- Use the parameter in your query

    RETURN;
END;
```

## Indexes

When creating a intex they are two Types:

### Clustered Index:

A clustered index determines the physical order of data in a table. There can only be one clustered index per table, and typically it's created on the primary key column(s). If no clustered index is explicitly defined, SQL Server creates a clustered index on the primary key by default.

```
CREATE CLUSTERED INDEX IX_ClusteredIndex ON TableName (PrimaryKeyColumn);
```

### Non-Clustered Index:

A non-clustered index creates a separate structure from the data and stores the index key values along with pointers to the actual rows. Unlike clustered indexes, there can be multiple non-clustered indexes per table.

```
CREATE NONCLUSTERED INDEX IX_NonClusteredIndex ON TableName (IndexedColumn);
```

### Unique Index:

A unique index ensures that the indexed columns do not contain any duplicate values. Both clustered and non-clustered indexes can be unique.

```
CREATE UNIQUE INDEX IX_UniqueIndex ON TableName (UniqueColumn);
```

### Filtered Index:

A filtered index is an optimized non-clustered index that contains only rows that meet a defined filter condition. It can improve query performance by reducing the index size and maintenance overhead.

```
CREATE NONCLUSTERED INDEX IX_FilteredIndex ON TableName (IndexedColumn)
WHERE FilterCondition;
```

### Index on Computed Columns:

SQL Server allows you to create indexes on computed columns, which are virtual columns whose values are calculated based on other columns' values. These indexes can improve query performance when filtering or sorting based on the computed column.

```
ALTER TABLE TableName
ADD ComputedColumn AS (Column1 + Column2) PERSISTED;

CREATE INDEX IX_ComputedIndex ON TableName (ComputedColumn);
```

### Spatial Index:

Spatial indexes are used for optimizing queries that involve spatial data types, such as geometry and geography. They allow efficient spatial queries, such as searching for points within a certain distance or within a specified region.

```
CREATE SPATIAL INDEX IX_SpatialIndex ON SpatialTableName (SpatialColumn);
```

### XML Index:

XML indexes are used to optimize queries that involve XML data type columns. They improve query performance by storing a preprocessed representation of the XML data.

```
CREATE XML INDEX IX_XMLIndex ON TableName (XMLColumn);
```

### Full-Text Index:

Full-text indexes are used for efficiently searching and querying large amounts of text data. They enable advanced search capabilities, such as proximity searches, stemming, and thesaurus support.

```
CREATE FULLTEXT INDEX ON TableName (TextColumn) KEY INDEX IX_ClusteredIndex;
```

### Columnstore Index:

Columnstore indexes store and manage data in columnar format, which can significantly improve query performance for analytical and reporting workloads, especially for large datasets.

```
CREATE CLUSTERED COLUMNSTORE INDEX IX_ColumnstoreIndex ON TableName;
```
