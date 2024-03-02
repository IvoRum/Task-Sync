namespace task_server.Model;

public class TaskDTO
{
    private string taskName;
    private DateTime due;
    private string workerName;
    private string taskStatus;

    public TaskDTO(string taskName, DateTime due, string workerName, string taskStatus)
    {
        this.taskName = taskName;
        this.due = due;
        this.workerName = workerName;
        this.taskStatus = taskStatus;
    }
}