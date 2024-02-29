select * from TASK_SYNC.dbo.Department
INSERT INTO Department(id, name) VALUES (1,'Development');
INSERT INTO Department(id, name) VALUES (2,'Marketing');
INSERT INTO Department(id, name) VALUES (3,'Human Resources');
INSERT INTO Department(id, name) VALUES (4,'Research and Development');

Insert Into Position(id, name) VALUES (1,'Project Manager');
Insert Into Position(id, name) VALUES (2,'Manager');
Insert Into Position(id, name) VALUES (3,'Programmer');
Insert Into Position(id, name) VALUES (4,'QA');
Insert Into Position(id, name) VALUES (5,'Tester');

INSERT INTO Worker(id, name, department, position) VALUES (1,'Ivan',1,1);
INSERT INTO Worker(id, name, department, position) VALUES (2,'Iliq',1,2);
INSERT INTO Worker(id, name, department, position) VALUES (3,'Koko',1,2);
INSERT INTO Worker(id, name, department, position) VALUES (4,'Plamen',1,2);
INSERT INTO Worker(id, name, department, position) VALUES (5,'Qna',1,3);
INSERT INTO Worker(id, name, department, position) VALUES (6,'Jordan',1,3);
INSERT INTO Worker(id, name, department, position) VALUES (7,'Jhon',1,3);
INSERT INTO Worker(id, name, department, position) VALUES (8,'Jhoana',1,4);
INSERT INTO Worker(id, name, department, position) VALUES (9,'Emma',1,4);
INSERT INTO Worker(id, name, department, position) VALUES (10,'Luna',1,5);
INSERT INTO Worker(id, name, department, position) VALUES (11,'Olivia',1,5);

Insert Into Project(id, name, manager) VALUES (1,'Bulgerian Trains',1);

INSERT INTO Task(id, name, work_time, project, due) VALUES (1,'Creating database',0,1,'2024-03-25');
INSERT INTO Task(id, name, work_time, project, due) VALUES (2,'Creating creation scripts',0,1,'2024-03-12');
INSERT INTO Task(id, name, work_time, project, due) VALUES (3,'Creating insertion script',0,1,'2024-03-13');
INSERT INTO Task(id, name, work_time, project, due) VALUES (4,'Creating drop scripts',0,1,'2024-03-14');
INSERT INTO Task(id, name, work_time, project, due) VALUES (5,'Creating Triggers',0,1,'2024-03-15');
INSERT INTO Task(id, name, work_time, project, due) VALUES (6,'Creating Procedures',0,1,'2024-03-16');
INSERT INTO Task(id, name, work_time, project, due) VALUES (7,'Test database',0,1,'2024-03-24');


INSERT INTO Sub_task(id_master_task, id_sub_task) VALUES (1,2);
INSERT INTO Sub_task(id_master_task, id_sub_task) VALUES (1,3);
INSERT INTO Sub_task(id_master_task, id_sub_task) VALUES (1,4);
INSERT INTO Sub_task(id_master_task, id_sub_task) VALUES (1,5);
INSERT INTO Sub_task(id_master_task, id_sub_task) VALUES (1,6);
INSERT INTO Sub_task(id_master_task, id_sub_task) VALUES (1,7);


Insert Into Status(id, name) VALUES (1,'Undefined');
Insert Into Status(id, name) VALUES (2,'To do');
Insert Into Status(id, name) VALUES (3,'Doing');
Insert Into Status(id, name) VALUES (4,'Done');


Insert Into Task_history(id, task, status, worker, history_status) VALUES (1,1,1,6,1);
Insert Into Task_history(id, task, status, worker, history_status) VALUES (2,2,1,6,1);
Insert Into Task_history(id, task, status, worker, history_status) VALUES (3,3,1,7,1);
Insert Into Task_history(id, task, status, worker, history_status) VALUES (4,4,1,7,1);
Insert Into Task_history(id, task, status, worker, history_status) VALUES (5,5,1,6,1);
Insert Into Task_history(id, task, status, worker, history_status) VALUES (6,6,1,7,1);
Insert Into Task_history(id, task, status, worker, history_status) VALUES (6,6,1,11,1);




