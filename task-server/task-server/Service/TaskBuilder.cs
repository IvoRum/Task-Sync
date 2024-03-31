using task_server.Model;

namespace task_server.Service;

public interface TaskBuilder
{
    public TaskDTO CreteTaskDto(string worker,string status);
}