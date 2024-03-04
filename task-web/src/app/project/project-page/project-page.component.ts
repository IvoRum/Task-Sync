import { Component, Input } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ProjectDTO } from '../../model/ProjecrDTO';
import { ProjectService } from '../../service/project/project.service';
import { WorkerService } from '../../service/worker/worker.service';
import { WorkerDTO } from '../../model/WorkerDTO';

@Component({
  selector: 'app-project-page',
  templateUrl: './project-page.component.html',
  styleUrl: './project-page.component.css',
})
export class ProjectPageComponent {
  projectId!: number;
  projects!: ProjectDTO[];
  coworkers!: WorkerDTO[];
  worker!: WorkerDTO;

  constructor(
    private route: ActivatedRoute,
    private projectService: ProjectService,
    private workerService: WorkerService,
    private router: Router
  ) {
    this.route.params.subscribe((params) => {
      this.projectId = params['projectId'];
    });
  }

  ngOnInit(): void {
    this.projectService
      .fetchProjectForWorker()
      .subscribe((data: ProjectDTO[]) => {
        this.projects = data;
      });
    this.workerService
      .fetchAllWorkersInPorject(this.projectId)
      .subscribe((data: WorkerDTO[]) => {
        this.coworkers = data;
      });
    this.workerService
      .fetchAllWorker(localStorage.getItem('workerID'))
      .subscribe((data: WorkerDTO) => {
        this.worker = data;
      });
  }
}
