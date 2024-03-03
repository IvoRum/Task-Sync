import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TaskComponent } from './task/task.component';
import { ProjectComponent } from './project/project.component';
import { ProjectRoutingModule } from './project-routing.module';
import { RouterModule } from '@angular/router';

@NgModule({
  declarations: [TaskComponent, ProjectComponent],
  imports: [CommonModule, RouterModule, ProjectRoutingModule],
  exports: [ProjectComponent],
})
export class ProjectModule {}
