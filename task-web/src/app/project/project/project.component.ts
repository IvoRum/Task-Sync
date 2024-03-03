import { Component, OnInit } from '@angular/core';
import { ProjectService } from '../../service/project/project.service';
import { ProjectDTO } from '../../model/ProjecrDTO';

@Component({
  selector: 'app-project',
  templateUrl: './project.component.html',
  styleUrl: './project.component.css',
})
export class ProjectComponent implements OnInit {
  projects!: ProjectDTO[];
  constructor(private dataService: ProjectService) {
    localStorage.setItem('workerID', '1');
  }

  ngOnInit(): void {
    this.dataService.fetchProjectForWorker.call((data: ProjectDTO[]) => {
      this.projects = data;
    });
  }
}
