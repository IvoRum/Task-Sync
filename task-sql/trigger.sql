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

            exec rollbackIfSubtaskIsNotFnished


            DECLARE @startDate DATE;

            Select top 1 @startDate = CONVERT(date, th.time_stamp)
            from Task_history th
            where th.task = @masterTask
            order by th.time_stamp asc;

            DECLARE @NumberOfDays INT;
            SET @NumberOfDays = DATEDIFF(DAY, @startDate, GETDATE());


            UPDATE Task
            set Task.work_time=@NumberOfDays
            from task t
                     inner join Task_history th on th.task = t.id
            where t.id = @masterTask
              and th.status = 4;
        end;
end;

    drop trigger areAllSubTasksClosed;

    UPDATE Task_history
    set status=4
    where task = 1
      and id = 15;

    UPDATE Task_history
    set status=1
    where task = 1
      and id = 15;

    select *
    from Task_history
    where task = 2;

    select *
    from Task_history;

    select *
    from Task_history
    where status = 4;