/*
    Get All unfinished tasks
*/

Select t.name as taskName, t.due as taskDueDate, w.name as workerName, s.name as taskStatus
from Sub_task st
         inner join Task t on st.id_sub_task = t.id
         inner join Task_history th on th.task = t.id
         left join Worker w on w.id = th.worker
         inner join Status s on s.id = th.status
where st.id_master_task = 1
  and th.status != 4

/*
    Get All unfinished tasks just number
*/

Select count(t.id) as unfinishedTasks
from Sub_task st
         inner join Task t on st.id_sub_task = t.id
         inner join Task_history th on th.task = t.id
         left join Worker w on w.id = th.worker
         inner join Status s on s.id = th.status
where st.id_master_task = 1
  and th.status != 4

/*
    Get all Workers in a project
*/

Select w.name as workerName, d.name as departmentName, p.name as possitionName, pj.name as projectName
from worker w
         inner join Department d on d.id = w.department
         inner join Position p on p.id = w.position
         inner join Worker_projects wp on wp.id_worker = w.id
         inner join Project pj on pj.id = wp.id_project
where pj.id = 1

/*
    Get task start date
*/

Select top 1 CONVERT(date, th.time_stamp)
                 as taskCreationDate
from Task_history th
where th.task = 1
order by th.time_stamp asc;

Select top 1 CONVERT(date, th.time_stamp)
from Task_history th
where th.task = 2
order by th.time_stamp asc;

begin
    DECLARE @startDate DATE;

    Select top 1 @startDate = CONVERT(date, th.time_stamp)
    from Task_history th
    where th.task = 2
    order by th.time_stamp asc;
    DECLARE @NumberOfDays INT;
    SET @NumberOfDays = DATEDIFF(DAY, @startDate, GETDATE());


    select @startDate as theDate;

end


/*
    Otcheti
 */

select SUM(t.work_time) as task_worked_time from Task t
    inner join Project p on t.project=p.id
where p.id=1;


select (SUM(t.work_time)/COUNT(t.id)) as avarage_task_worked_time from Task_history th
    inner join Task t on t.id=th.task
    inner join Project p on t.project=p.id
where th.worker=1
and history_status!=0;

select count(t.id) as all_sub_tasks from Sub_task st
inner join Task t on t.id=st.id_sub_task
where st.id_master_task=1;
/*
    Repository selects
 */
select * from Status

Select t.name as taskName, t.due as taskDueDate, w.name as workerName, s.name as taskStatus
from  Task t
         inner join Task_history th on th.task = t.id
         left join Worker w on w.id = th.worker
         inner join Status s on s.id = th.status
where t.project=1 and th.status != 4

SELECT p.id,p.name,p.manager from Project p
where p.id=1;

SELECT p.id,p.name,p.manager from Project p
        join Worker_projects wp on wp.id_project=p.id
where wp.id_worker=1
