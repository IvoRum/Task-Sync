using Microsoft.Data.SqlClient;
using task_server.Model;

namespace task_server.Repository;

public class ProjectRepository
{
    string connectionString =
        "Data Source=localhost,1401;Initial Catalog=TASK_SYNC;User Id=SA;Password=Ivo123456;MultipleActiveResultSets=False;TrustServerCertificate=true;";

    public List<ProjectDTO> GetWorkersProjects(int workerId)
    {
        List<ProjectDTO> foundProjects = new List<ProjectDTO>();
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            try
            {
                String sql =
                    "SELECT p.id as projectID,p.name,p.manager as projectManager from Project p" +
                    "        join Worker_projects wp on wp.id_project=p.id " +
                    "where wp.id_worker= " + workerId;
                connection.Open();
                using (SqlCommand sqlcommand = new SqlCommand(sql, connection))
                {
                    using (SqlDataReader reader = sqlcommand.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string name = reader["name"].ToString();
                            long id = reader.GetInt64(reader.GetOrdinal("projectID"));
                            long manager = reader.GetInt64(reader.GetOrdinal("projectManager"));

                            foundProjects.Add(new ProjectDTO(id, name, manager));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }
        return foundProjects;
    }
}