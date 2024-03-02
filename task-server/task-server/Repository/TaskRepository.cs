using Microsoft.Data.SqlClient;
using task_server.Model;

namespace task_server.Repository;

public class TaskRepository
{
    string connectionString =
        "Data Source=localhost,1401;Initial Catalog=TASK_SYNC;User Id=SA;Password=Ivo123456;MultipleActiveResultSets=False;TrustServerCertificate=true;";

    public List<TaskDTO> GetAllUnfinishedSubtasks(int masterTask)
    {
        List<TaskDTO> foundStatus = new List<TaskDTO>();
        SqlConnectionStringBuilder conn = new SqlConnectionStringBuilder();


        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            try
            {
                String sql =
                    "Select t.name as taskName, t.due as taskDueDate, " +
                    "w.name as workerName, s.name as taskStatus " +
                    "from Sub_task st" +
                    "         inner join Task t on st.id_sub_task = t.id" +
                    "         inner join Task_history th on th.task = t.id" +
                    "         left join Worker w on w.id = th.worker" +
                    "         inner join Status s on s.id = th.status " +
                    "where st.id_master_task = " + masterTask +
                    "  and th.status != 4";
                connection.Open();
                using (SqlCommand sqlcommand = new SqlCommand(sql, connection))
                {
                    using (SqlDataReader reader = sqlcommand.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string taskName = reader["taskName"].ToString();
                            DateTime taskDueDate = reader.GetDateTime(reader.GetOrdinal("taskDueDate"));
                            string workerName = reader["workerName"].ToString();
                            string taskStatus = reader["taskStatus"].ToString();
                            
                            foundStatus.Add(new TaskDTO(taskName, taskDueDate, workerName, taskStatus));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }

        return foundStatus;
    }
}