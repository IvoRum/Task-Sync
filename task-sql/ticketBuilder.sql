INSERT INTO Task(id, name, work_time, project, due) VALUES (18,'Clean out gum',0,2,'2024-03-14');


select TOP 1 t.id from Task t
order by t.id desc;
