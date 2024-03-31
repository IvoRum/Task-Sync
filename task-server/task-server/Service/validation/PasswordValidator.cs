using System.Text.RegularExpressions;
using task_server.Model.input;

namespace task_server.Service.validation;

public class PasswordValidator:Ivalidator
{
    private string passwordToValidate;
    private List<Ivalidator> _validators;

    public PasswordValidator(string passwordToValidate)
    {
        this.passwordToValidate = passwordToValidate;
        string englishPattern = "^[a-zA-Z]+$";
        string passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[^\\da-zA-Z]).{8,}$\n";
        this._validators.Add(new StringValidator(passwordToValidate,englishPattern));
        this._validators.Add(new StringValidator(passwordToValidate,passwordPattern));
    }

    public string PasswordToValidate
    {
        get => passwordToValidate;
        set => passwordToValidate = value ?? throw new ArgumentNullException(nameof(value));
    }

    public void validate()
    {
        foreach (var validator in _validators)
        {
            validator.validate();
        }
    }
}