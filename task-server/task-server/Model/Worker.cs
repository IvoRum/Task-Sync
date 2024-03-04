namespace task_server.Model;

public class Worker
{
    private long id;
    private string name;
    private string department;
    private string possition;

    public Worker(long id,string name, string department, string possition)
    {
        this.id = id;
        this.name = name;
        this.department = department;
        this.possition = possition;
    }

    public long Id
    {
        get => id;
        set => id = value;
    }

    public string Name
    {
        get => name;
        set => name = value ?? throw new ArgumentNullException(nameof(value));
    }

    public string Department
    {
        get => department;
        set => department = value ?? throw new ArgumentNullException(nameof(value));
    }

    public string Possition
    {
        get => possition;
        set => possition = value ?? throw new ArgumentNullException(nameof(value));
    }
}