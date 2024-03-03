import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ProjectDTO } from '../../model/ProjecrDTO';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class ProjectService {
  constructor(private http: HttpClient) {}

  fetchProjectForWorker(): Observable<ProjectDTO[]> {
    return this.http.get<ProjectDTO[]>(
      `https://localhost:7012/project/worker/` +
        localStorage.getItem('workerID')
    );
  }
}
