CREATE FUNCTION WorkersOnProject(@workerName as VARCHAR)
    RETURNS @Result TABLE
                    (
                        tickate_name varchar,
                        work_time    bigint,
                        due          DATE,
                        worker_name  varchar
                    )
AS
BEGIN
    INSERT INTO @Result
    select *
    from WrokerOnProjectWhitTasks wp
    where wp.worker_name = @workerName
    RETURN;
end;



CREATE FUNCTION WorkersOnProject(@workerName as VARCHAR(100))
    RETURNS table
        AS
        return
            (
                select *
                from WrokerOnProjectWhitTasks wp
                where wp.worker_name = @workerName
            )

drop function WorkersOnProject

select *
from WorkersOnProject('Jhon')

select *
from WrokerOnProjectWhitTasks wp
where wp.worker_name = 'Jhon'