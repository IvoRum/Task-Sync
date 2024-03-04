namespace task_server.Model;

public class Worker
{
    private string name;
    private string department;
    private string possition;

    public Worker(string name, string department, string possition)
    {
        this.name = name;
        this.department = department;
        this.possition = possition;
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