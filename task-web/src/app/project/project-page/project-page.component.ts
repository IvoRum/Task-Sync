import { Component, Input } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ProjectDTO } from '../../model/ProjecrDTO';
import { ProjectService } from '../../service/project/project.service';
import { WorkerService } from '../../service/worker/worker.service';
import { WorkerDTO } from '../../model/WorkerDTO';
import { TaskService } from '../../service/task/task.service';
import { TaskDTO } from '../../model/TaskDTO';

@Component({
  selector: 'app-project-page',
  templateUrl: './project-page.component.html',
  styleUrl: './project-page.component.css',
})
export class ProjectPageComponent {
  projectId!: number;
  coworkers!: WorkerDTO[];
  worker!: WorkerDTO;
  projectTasks!: TaskDTO[];
  task!: TaskDTO;

  constructor(
    private route: ActivatedRoute,
    private workerService: WorkerService,
    private taskService: TaskService,
    private router: Router
  ) {
    this.route.params.subscribe((params) => {
      this.projectId = params['projectId'];
    });
  }

  ngOnInit(): void {
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
    this.taskService
      .fetchTasksForAPRoject(this.projectId)
      .subscribe((data: TaskDTO[]) => {
        this.projectTasks = data;
      });
  }

  onTaskUpdate(taskId: number) {
    this.taskService.fetchTask(taskId).subscribe((data: TaskDTO) => {
      this.task = data;
    });
  }
}
