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