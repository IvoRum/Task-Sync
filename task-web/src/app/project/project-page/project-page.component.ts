import { Component, Input } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-project-page',
  templateUrl: './project-page.component.html',
  styleUrl: './project-page.component.css',
})
export class ProjectPageComponent {
  projectId!: number;
  constructor(private route: ActivatedRoute) {
    this.route.params.subscribe((params) => {
      this.projectId = params['projectId'];
    });
  }
}
