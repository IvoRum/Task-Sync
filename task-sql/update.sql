/*
  Creating a new history when a worker is switched
    1. Changing the history status
    2. Create the new history
 */
update Task_history set history_status=0 where id =1
Insert Into Task_history(id, task, status, worker, history_status) VALUES (15,1,1,3,1);