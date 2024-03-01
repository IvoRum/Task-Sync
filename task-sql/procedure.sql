create procedure allWorkerInProject(@projectId as INT) as
begin
    Select w.name as workerName, d.name as departmentName, p.name as possitionName, pj.name as projectName
    from worker w
        inner join Department d on d.id=w.department
        inner join Position p on p.id=w.position
        inner join Worker_projects wp on wp.id_worker =w.id
        inner join Project pj on pj.id=wp.id_project
    where pj.id=@projectId
end

EXEC allWorkerInProject 1