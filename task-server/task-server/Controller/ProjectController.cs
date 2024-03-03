using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using task_server.Model;
using task_server.Repository;

namespace task_server.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProjectController : ControllerBase
    {
        [HttpGet("/project/worker/{workerId}")]
        public ActionResult<List<ProjectDTO>> GetAllTasksInProject(int workerId)
        {
            ProjectRepository workerRepository=new ProjectRepository() ;
            return workerRepository.GetWorkersProjects(workerId);
        }
    }
}
