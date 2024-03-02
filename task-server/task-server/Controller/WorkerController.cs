using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using task_server.Model;

namespace task_server.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class WorkerController : ControllerBase
    {
        [HttpGet("/project/workers")]
        public ActionResult<Worker> GetHiestSalary()
        {
            return null;
        }

    }
}
