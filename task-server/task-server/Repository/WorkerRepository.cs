using Microsoft.Data.SqlClient;
using task_server.Model;
namespace task_server.Repository;

public class WorkerRepository
{
    string connectionString = "Server=localhost; Database =TASK_SYNC; Username =SA; Password=Ivo123456;";
    
    public List<Worker> GetWorkerStats()
    {
        
        SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(connectionString);
        builder.DataSource = "<your_server.database.windows.net>";
        builder.UserID = "<your_username>";
        builder.Password = "<your_password>";
        builder.InitialCatalog = "<your_database>";

        using (SqlConnection connection = new SqlConnection(builder.ConnectionString))

        return null;
    }
}