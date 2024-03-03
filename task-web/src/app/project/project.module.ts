import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TaskComponent } from './task/task.component';
import { ProjectComponent } from './project/project.component';
import { RouterModule } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { BrowserModule } from '@angular/platform-browser';
import { ProjectPageComponent } from './project-page/project-page.component';

@NgModule({
  declarations: [TaskComponent, ProjectComponent, ProjectPageComponent],
  imports: [CommonModule, RouterModule, HttpClientModule, BrowserModule],
  exports: [ProjectComponent, ProjectPageComponent],
})
export class ProjectModule {}
