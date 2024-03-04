import { Component, Input } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ProjectDTO } from '../../model/ProjecrDTO';
import { ProjectService } from '../../service/project/project.service';

@Component({
  selector: 'app-project-page',
  templateUrl: './project-page.component.html',
  styleUrl: './project-page.component.css',
})
export class ProjectPageComponent {
  projectId!: number;
  projects!: ProjectDTO[];

  constructor(
    private route: ActivatedRoute,
    private dataService: ProjectService,
    private router: Router
  ) {
    this.route.params.subscribe((params) => {
      this.projectId = params['projectId'];
    });
  }

  ngOnInit(): void {
    this.dataService.fetchProjectForWorker().subscribe((data: ProjectDTO[]) => {
      this.projects = data;
    });
    console.log(localStorage.getItem('workerID'));
  }
}
