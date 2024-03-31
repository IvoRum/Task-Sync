using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using task_server.Model;
using task_server.Repository;
using task_server.Service.validation;

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
                
        [HttpGet("/worker/lgin/{password}/{workerId}")]
        public ActionResult<Worker> Login(string password,int workerId)
        {
            WorkerRepository workerRepository=new WorkerRepository();
            Ivalidator validator = new PasswordValidator(password);
            validator.validate();
            return workerRepository.GetWorkersById(workerId);
        }

    }
}
