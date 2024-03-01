/*
    Get All unfinished tasks
*/

Select t.name as taskName, t.due as taskDueDate, w.name as workerName, s.name as taskStatus from Sub_task st
         inner join Task t on st.id_sub_task=t.id
         inner join Task_history th on th.task=t.id
         left join Worker w on w.id = th.worker
         inner join Status s on s.id=th.status
where st.id_master_task=1
and th.status !=4

/*
    Get All unfinished tasks just number
*/

Select count(t.id) as unfinishedTasks  from Sub_task st
         inner join Task t on st.id_sub_task=t.id
         inner join Task_history th on th.task=t.id
         left join Worker w on w.id = th.worker
         inner join Status s on s.id=th.status
where st.id_master_task=1
and th.status !=4

/*
    Get all Workers in a project
*/

Select w.name as workerName, d.name as departmentName, p.name as possitionName, pj.name as projectName
from worker w
    inner join Department d on d.id=w.department
    inner join Position p on p.id=w.position
    inner join Worker_projects wp on wp.id_worker =w.id
    inner join Project pj on pj.id=wp.id_project
where pj.id=1

/*
    Get task start date
*/

Select top 1
     CONVERT(date, th.time_stamp)
     as taskCreationDate from Task_history th
where th.task=1
order by th.time_stamp asc;