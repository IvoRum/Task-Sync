namespace task_server.Model;

public class ProjectDTO
{
    private long projectId;
    private string name;
    private long managerId;

    public ProjectDTO(long projectId, string name, long managerId)
    {
        this.projectId = projectId;
        this.name = name;
        this.managerId = managerId;
    }

    public long ProjectId
    {
        get => projectId;
        set => projectId = value;
    }

    public string Name
    {
        get => name;
        set => name = value ?? throw new ArgumentNullException(nameof(value));
    }

    public long ManagerId
    {
        get => managerId;
        set => managerId = value;
    }
}