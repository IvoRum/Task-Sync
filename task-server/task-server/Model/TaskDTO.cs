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

    public string TaskName
    {
        get => taskName;
        set => taskName = value ?? throw new ArgumentNullException(nameof(value));
    }

    public DateTime Due
    {
        get => due;
        set => due = value;
    }

    public string WorkerName
    {
        get => workerName;
        set => workerName = value ?? throw new ArgumentNullException(nameof(value));
    }

    public string TaskStatus
    {
        get => taskStatus;
        set => taskStatus = value ?? throw new ArgumentNullException(nameof(value));
    }
}