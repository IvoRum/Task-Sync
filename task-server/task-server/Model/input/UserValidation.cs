namespace task_server.Model.input;

public class UserValidation
{
    private string email;
    private string password;

    public UserValidation(string email, string password)
    {
        this.email = email;
        this.password = password;
    }

    public string Email
    {
        get => email;
        set => email = value ?? throw new ArgumentNullException(nameof(value));
    }

    public string Password
    {
        get => password;
        set => password = value ?? throw new ArgumentNullException(nameof(value));
    }
}