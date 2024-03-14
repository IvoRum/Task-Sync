CREATE FUNCTION WorkersOnProject(@projectId as INT)

    RETURNS table
    AS
        RETURN
            (
                select *
                from Task t
                         join Task_history th on t.id = th.task
                         join Worker w on th.worker = w.id
                         join Worker_projects wp on wp.id_worker = w.id
                where wp.id_project = @projectId
            )