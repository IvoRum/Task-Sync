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

EXEC allWorkerInProject 1;

create procedure getAllUnfinishedSubTasks(@masterTaskId as INT) as
begin
Select t.name as taskName, t.due as taskDueDate, w.name as workerName, s.name as taskStatus
from Sub_task st
         inner join Task t on st.id_sub_task = t.id
         inner join Task_history th on th.task = t.id
         left join Worker w on w.id = th.worker
         inner join Status s on s.id = th.status
where st.id_master_task = @masterTaskId
  and th.status != 4
end;
Exec getAllUnfinishedSubTasks 1;

create procedure hasUninishedSubTasks(@masterTaskId as INT) as
begin
Select count(t.id) as unfinishedTasks
from Sub_task st
         inner join Task t on st.id_sub_task = t.id
         inner join Task_history th on th.task = t.id
         left join Worker w on w.id = th.worker
         inner join Status s on s.id = th.status
where st.id_master_task = @masterTaskId
  and th.status != 4
end;
exec hasUninishedSubTasks 2
create procedure getTaskStastDate(@taskId as INT)
    as
begin
Select top 1 CONVERT(date, th.time_stamp)
                                 as taskCreationDate
from Task_history th
where th.task = @taskId
order by th.time_stamp asc;
end;

exec getTaskStastDate 1
create procedure getAllTasksInaProject(@projectId as INT) as
begin
Select t.name as taskName, t.due as taskDueDate, w.name as workerName, s.name as taskStatus
from Project pj
         inner join Task t on t.project = pj.id
         inner join Task_history th on th.task = t.id
         left join Worker w on w.id = th.worker
         inner join Status s on s.id = th.status
where pj.id = @projectId
  and th.status != 4
end;

exec getAllTasksInaProject 1;

/*
    Rollback Procedure
 */
create procedure rollbackIfSubtaskIsNotFnished(@masterTaskId as INT)
    as
begin
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

/*
                    View Procedure
 */

create procedure selectAllWorkerWhitTasks(@projectId as INT)
    as
begin
select *
from Task t
         join Task_history th on t.id = th.task
         join Worker w on th.worker = w.id
         join Worker_projects wp on wp.id_worker = w.id
where wp.id_project = @projectId
end;