CREATE DATABASE TASK_SYNC;
CREATE TABLE Status(
                         id BIGINT NOT NULL,
                         name VARCHAR(255) NOT NULL
);
ALTER TABLE
    Status ADD CONSTRAINT status_id_primary PRIMARY KEY(id);
CREATE TABLE Position(
                           id BIGINT NOT NULL,
                           name VARCHAR(255) NOT NULL
);
ALTER TABLE
    Position ADD CONSTRAINT position_id_primary PRIMARY KEY(id);
CREATE TABLE Task(
                       id BIGINT NOT NULL,
                       name VARCHAR(255) NOT NULL,
                       work_time BIGINT NOT NULL,
                       project BIGINT NOT NULL,
                       due DATE NOT NULL
);
ALTER TABLE
    Task ADD CONSTRAINT task_id_primary PRIMARY KEY(id);
CREATE TABLE Project(
                          id BIGINT NOT NULL,
                          name VARCHAR(255) NOT NULL,
                          manager BIGINT NOT NULL
);
ALTER TABLE
    Project ADD CONSTRAINT project_id_primary PRIMARY KEY(id);
CREATE TABLE Sub_task(
                           id_master_task BIGINT NULL,
                           id_sub_task BIGINT NOT NULL
);
CREATE TABLE Task_history(
                               id BIGINT NOT NULL,
                               task BIGINT NOT NULL,
                               status BIGINT NOT NULL,
                               worker BIGINT NOT NULL,
                               time_stamp TIMESTAMP NOT NULL,
                               history_status BIGINT NOT NULL
);
ALTER TABLE
    Task_history ADD CONSTRAINT task_history_id_primary PRIMARY KEY(id);
CREATE TABLE Department(
                             id BIGINT NOT NULL,
                             name VARCHAR(255) NOT NULL
);
ALTER TABLE
    Department ADD CONSTRAINT department_id_primary PRIMARY KEY(id);
CREATE TABLE Worker(
                         id BIGINT NOT NULL,
                         name VARCHAR(255) NOT NULL,
                         department BIGINT NOT NULL,
                         position BIGINT NOT NULL
);
CREATE TABLE Worker_projects(
                           id_worker BIGINT NULL,
                           id_project BIGINT NOT NULL
);

ALTER TABLE
    Worker_projects ADD CONSTRAINT worker_id_projects FOREIGN KEY(id_worker) REFERENCES Worker(id);
ALTER TABLE
    Worker_projects ADD CONSTRAINT project_id_workers FOREIGN KEY(id_project) REFERENCES Project(id);

ALTER TABLE
    Worker ADD CONSTRAINT worker_id_primary PRIMARY KEY(id);
ALTER TABLE
    Task_history ADD CONSTRAINT task_history_worker_foreign FOREIGN KEY(worker) REFERENCES Worker(id);
ALTER TABLE
    Task_history ADD CONSTRAINT task_history_status_foreign FOREIGN KEY(status) REFERENCES Status(id);
ALTER TABLE
    Project ADD CONSTRAINT project_manager_foreign FOREIGN KEY(manager) REFERENCES Worker(id);
ALTER TABLE
    Sub_task ADD CONSTRAINT sub_task_id_sub_task_foreign FOREIGN KEY(id_sub_task) REFERENCES Task(id);
ALTER TABLE
    Task ADD CONSTRAINT task_project_foreign FOREIGN KEY(project) REFERENCES Project(id);
ALTER TABLE
    Worker ADD CONSTRAINT worker_department_foreign FOREIGN KEY(department) REFERENCES Department(id);
ALTER TABLE
    Worker ADD CONSTRAINT worker_position_foreign FOREIGN KEY(position) REFERENCES Position(id);
ALTER TABLE
    Sub_task ADD CONSTRAINT sub_task_id_master_task_foreign FOREIGN KEY(id_master_task) REFERENCES Task(id);
ALTER TABLE
    Task_history ADD CONSTRAINT task_history_task_foreign FOREIGN KEY(task) REFERENCES Task(id);