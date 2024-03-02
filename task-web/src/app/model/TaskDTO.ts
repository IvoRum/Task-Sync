export interface TaskDTO {
  taskName: string;
  dueDate: Date;
  workerName: string | undefined;
  status: string;
}
