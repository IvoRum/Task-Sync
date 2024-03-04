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
        [HttpGet("/project/workers/{projectId}")]
        public ActionResult<List<Worker>> GetAllWorkers(int projectId)
        {
            WorkerRepository workerRepository=new WorkerRepository();
            return workerRepository.GetWorkersByProject(projectId);
        }
        
        [HttpGet("/worker/{workerId}")]
        public ActionResult<Worker> GetAllWorker(int workerId)
        {
            WorkerRepository workerRepository=new WorkerRepository();
            return workerRepository.GetWorkersById(workerId);
        }


    }
}
