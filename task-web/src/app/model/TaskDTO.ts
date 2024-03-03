export interface TaskDTO {
  taskName: string;
  dueData: Date;
  workerName: string | undefined;
  taskStatus: string;
}
