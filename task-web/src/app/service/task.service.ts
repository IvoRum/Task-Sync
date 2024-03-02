import { Injectable } from '@angular/core';
import { TaskDTO } from '../model/TaskDTO';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class TaskService {
  constructor(private http: HttpClient) {}

  fetchTasksForAPRoject(projectId: number): Observable<TaskDTO[]> {
    return this.http.get<TaskDTO[]>(
      `https://localhost:7012/Task/tasks_for_project/` + projectId
    );
  }

  fetchSubTasksForATask(masterTicketId: number): Observable<TaskDTO[]> {
    return this.http.get<TaskDTO[]>(
      `https://localhost:7012/Task/unfinished_sub_tasl/` + masterTicketId
    );
  }

  fetchTask(taskId: number): Observable<TaskDTO> {
    return this.http.get<TaskDTO>(
      `https://localhost:7012/Task/unfinished_sub_tasl/` + taskId
    );
  }
}
