import { Component, OnInit } from '@angular/core';
import { ProjectService } from '../../service/project/project.service';
import { ProjectDTO } from '../../model/ProjecrDTO';
import { Router } from '@angular/router';

@Component({
  selector: 'app-project',
  templateUrl: './project.component.html',
  styleUrl: './project.component.css',
})
export class ProjectComponent implements OnInit {
  projects!: ProjectDTO[];
  constructor(private dataService: ProjectService, private router: Router) {
    localStorage.setItem('workerID', '1');
  }

  ngOnInit(): void {
    this.dataService.fetchProjectForWorker().subscribe((data: ProjectDTO[]) => {
      this.projects = data;
    });
    console.log(localStorage.getItem('workerID'));
  }

  goProject(projectId: any) {
    this.router.navigate(['/project/', projectId]);
    //this.router.navigate(['/project/' + projectId]);
  }
}
