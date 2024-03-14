export interface TaskDTO {
  id: number;
  taskName: string;
  due: Date;
  workerName: string | undefined;
  taskStatus: string;
}
