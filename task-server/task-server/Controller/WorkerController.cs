using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using task_server.Model;
using task_server.Repository;

namespace task_server.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class WorkerController : ControllerBase
    {
        [HttpGet("/project/workers")]
        public ActionResult<Worker> GetAllWorkers()
        {
            return null;
        }
        
        [HttpGet("/project/status")]
        public ActionResult<List<String>> GetStatus()
        {
            WorkerRepository workerRepository=new WorkerRepository();
            return workerRepository.GetStatus();
        }

    }
}
