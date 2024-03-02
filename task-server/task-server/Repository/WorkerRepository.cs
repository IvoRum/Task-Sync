using Microsoft.Data.SqlClient;
using task_server.Model;

namespace task_server.Repository;

public class WorkerRepository
{
    //string connectionString = "Server=localhost; Database =TASK_SYNC; Username =SA; Password=Ivo123456; MultipleActiveResultSets=True;";
    //string connectionString = "Data Source=localhost,1401;Initial Catalog=TASK_SYNC;User Id=SA;Password=Ivo123456;MultipleActiveResultSets=True;";
    string connectionString = "Data Source=localhost,1401;Initial Catalog=TASK_SYNC;User Id=SA;Password=Ivo123456;MultipleActiveResultSets=False;TrustServerCertificate=true;";

    public List<String> GetStatus()
    {
        /*
        SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(connectionString);
        builder.DataSource = "localhost";
        builder.UserID = "<your_username>";
        builder.Password = "<your_password>";
        builder.InitialCatalog = "<your_database>";
        */
        List<String> foundStatus = new List<string>();
        SqlConnectionStringBuilder conn = new SqlConnectionStringBuilder();


        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            try
            {
                String sql = "Select * from Status;";
                connection.Open();
                using (SqlCommand sqlcommand = new SqlCommand(sql, connection))
                {
                    using (SqlDataReader reader = sqlcommand.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            foundStatus.Add(reader["name"].ToString());
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions that occur during connection
                Console.WriteLine("Error: " + ex.Message);
            }
        }
        return foundStatus;
    }
}