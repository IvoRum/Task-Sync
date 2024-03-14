select * from TASK_SYNC.dbo.Task
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

Insert Into Worker_projects(id_worker, id_project) values (1,1);
Insert Into Worker_projects(id_worker, id_project) values (2,1);
Insert Into Worker_projects(id_worker, id_project) values (3,1);
Insert Into Worker_projects(id_worker, id_project) values (4,1);
Insert Into Worker_projects(id_worker, id_project) values (5,1);
Insert Into Worker_projects(id_worker, id_project) values (6,1);
Insert Into Worker_projects(id_worker, id_project) values (7,1);
Insert Into Worker_projects(id_worker, id_project) values (8,1);
Insert Into Worker_projects(id_worker, id_project) values (9,1);
Insert Into Worker_projects(id_worker, id_project) values (10,1);
Insert Into Worker_projects(id_worker, id_project) values (11,1);


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


Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (1,1,1,6,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (2,2,1,6,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (3,3,1,7,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (4,4,1,7,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (5,5,1,6,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (6,6,1,7,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (7,7,1,11,2,1);

INSERT INTO Task(id, name, work_time, project, due) VALUES (8,'Creating log in Endpoint',0,1,'2024-03-25');
INSERT INTO Task(id, name, work_time, project, due) VALUES (9,'Creating register in Endpoint',0,1,'2024-03-12');
INSERT INTO Task(id, name, work_time, project, due) VALUES (10,'Creating web UI',0,1,'2024-03-13');
INSERT INTO Task(id, name, work_time, project, due) VALUES (11,'Test log in Endpoint',0,1,'2024-03-14');
INSERT INTO Task(id, name, work_time, project, due) VALUES (12,'Test register Endpoint',0,1,'2024-03-15');
INSERT INTO Task(id, name, work_time, project, due) VALUES (13,'Test web UI',0,1,'2024-03-16');
INSERT INTO Task(id, name, work_time, project, due) VALUES (14,'Deploy to server',0,1,'2024-04-01');

Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (8,8,1,6,3,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (9,9,1,5,3,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (10,10,1,5,3,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (11,11,1,10,3,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (12,12,1,10,4,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (13,13,1,11,4,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (14,14,1,2,4,1);

/*
    Second project
*/


INSERT INTO Worker(id, name, department, position) VALUES (12,'Iliqna',1,2);
INSERT INTO Worker(id, name, department, position) VALUES (13,'Koka',1,2);
INSERT INTO Worker(id, name, department, position) VALUES (14,'Plamena',1,2);
INSERT INTO Worker(id, name, department, position) VALUES (15,'Qno',1,3);
INSERT INTO Worker(id, name, department, position) VALUES (16,'Jordana',1,3);
INSERT INTO Worker(id, name, department, position) VALUES (17,'Jhona',1,3);
INSERT INTO Worker(id, name, department, position) VALUES (18,'Jhoan',1,4);
INSERT INTO Worker(id, name, department, position) VALUES (19,'Emmo',1,4);
INSERT INTO Worker(id, name, department, position) VALUES (20,'Luno',1,5);
INSERT INTO Worker(id, name, department, position) VALUES (21,'Oliv',1,5);

Insert Into Project(id, name, manager) VALUES (2,'Fitnnes application',12);

Insert Into Worker_projects(id_worker, id_project) values (12,2);
Insert Into Worker_projects(id_worker, id_project) values (13,2);
Insert Into Worker_projects(id_worker, id_project) values (14,2);
Insert Into Worker_projects(id_worker, id_project) values (15,2);
Insert Into Worker_projects(id_worker, id_project) values (16,2);
Insert Into Worker_projects(id_worker, id_project) values (17,2);
Insert Into Worker_projects(id_worker, id_project) values (18,2);
Insert Into Worker_projects(id_worker, id_project) values (19,2);
Insert Into Worker_projects(id_worker, id_project) values (20,2);
Insert Into Worker_projects(id_worker, id_project) values (21,2);

INSERT INTO Task(id, name, work_time, project, due) VALUES (15,'Creating runners routine',0,2,'2024-03-25');
INSERT INTO Task(id, name, work_time, project, due) VALUES (16,'Set up running track',0,2,'2024-03-12');
INSERT INTO Task(id, name, work_time, project, due) VALUES (17,'Set up looker room',0,2,'2024-03-13');
INSERT INTO Task(id, name, work_time, project, due) VALUES (18,'Clean out gum',0,2,'2024-03-14');

INSERT INTO Sub_task(id_master_task, id_sub_task) VALUES (15,16);
INSERT INTO Sub_task(id_master_task, id_sub_task) VALUES (15,17);
INSERT INTO Sub_task(id_master_task, id_sub_task) VALUES (15,18);

INSERT INTO Task(id, name, work_time, project, due) VALUES (19,'Creating lifter routine',0,2,'2024-03-15');
INSERT INTO Task(id, name, work_time, project, due) VALUES (20,'Set up dumbbells',0,2,'2024-03-16');
INSERT INTO Task(id, name, work_time, project, due) VALUES (21,'Set up barbell',0,2,'2024-03-24');
INSERT INTO Task(id, name, work_time, project, due) VALUES (22,'Set up roll machine',0,2,'2024-03-16');
INSERT INTO Task(id, name, work_time, project, due) VALUES (23,'Set squat rack',0,2,'2024-03-24');

INSERT INTO Sub_task(id_master_task, id_sub_task) VALUES (19,20);
INSERT INTO Sub_task(id_master_task, id_sub_task) VALUES (19,21);
INSERT INTO Sub_task(id_master_task, id_sub_task) VALUES (19,22);
INSERT INTO Sub_task(id_master_task, id_sub_task) VALUES (19,23);

Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (15,15,1,14,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (16,16,1,15,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (17,17,1,16,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (18,18,1,14,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (19,19,1,15,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (20,20,1,18,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (21,21,1,13,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (22,22,1,19,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (23,23,1,20,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (24,23,2,20,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (25,23,3,20,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (26,22,2,20,2,1);
Insert Into Task_history(id, task, status, worker, manager, history_status) VALUES (27,23,3,15,2,1);