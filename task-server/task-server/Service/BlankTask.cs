using task_server.Model;
using task_server.Repository;

namespace task_server.Service;

public class BlankTask:TaskBuilder
{
    public TaskDTO CreteTaskDto(string worker,string status)
    {
        TaskRepository taskRepository=new TaskRepository();
        DateTime currentTime = DateTime.Now;
        return new TaskDTO(taskRepository.GetTasksNewId(), "Blank", currentTime, worker, status);
    }
}