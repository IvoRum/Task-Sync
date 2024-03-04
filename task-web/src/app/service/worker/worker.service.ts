import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { WorkerDTO } from '../../model/WorkerDTO';

@Injectable({
  providedIn: 'root',
})
export class WorkerService {
  constructor(private http: HttpClient) {}

  fetchAllWorkersInPorject(projectId: number): Observable<WorkerDTO[]> {
    return this.http.get<WorkerDTO[]>(
      `https://localhost:7012/project/workers/` + projectId
    );
  }

  fetchAllWorker(workerId: number): Observable<WorkerDTO> {
    return this.http.get<WorkerDTO>(
      `https://localhost:7012/worker/` + workerId
    );
  }
}
