using System.Text.RegularExpressions;
using task_server.Model.input;

namespace task_server.Service.validation;

public class StringValidator : Ivalidator
{
    private string stringToValidat;
    private Regex regex;

    public StringValidator(string stringToValidat, string pattern)
    {
        this.stringToValidat = stringToValidat;
        Regex regex = new Regex(pattern);
    }

    public string StringToValidat
    {
        get => stringToValidat;
        set => stringToValidat = value ?? throw new ArgumentNullException(nameof(value));
    }

    public void validate()
    {



        if (regex.IsMatch(stringToValidat))
        {
            Console.WriteLine("Input string contains only English letters.");
        }
        else
        {
            Console.WriteLine("Input string contains non-English letters.");
            throw new NotImplementedException();
        }
    }
}