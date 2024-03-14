using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using task_server.Model;
using task_server.Repository;

namespace task_server.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class TaskController : ControllerBase
    {
        [HttpGet("/Task/unfinished_sub_tasl/{masterTicket}")]
        public ActionResult<List<TaskDTO>> GetunfinishedSubtAks(int masterTicket)
        {
            TaskRepository workerRepository=new TaskRepository() ;
            return workerRepository.GetAllUnfinishedSubtasks(masterTicket);
        }
        
        [HttpGet("/Task/tasks_for_project/{projectId}")]
        public ActionResult<List<TaskDTO>> GetAllTasksInProject(int projectId)
        {
            TaskRepository workerRepository=new TaskRepository() ;
            return workerRepository.GetAllTasksForAProjectWitchArenNotDone(projectId);
        }
        
        [HttpGet("/Task/{taskId}")]
        public ActionResult<TaskDTO> GetTaskDetails(int taskId)
        {
            TaskRepository workerRepository=new TaskRepository() ;
            return workerRepository.GetTasksById(taskId);
        }
    }
}
