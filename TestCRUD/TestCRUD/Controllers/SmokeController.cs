using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Threading.Tasks;

namespace TestCRUD.Controllers
{
    [Produces("application/json")]
    [Route("api/Smoke")]
    [ApiController]
    [ExcludeFromCodeCoverage]
    public class SmokeController : Controller
    {
        [HttpGet("/"), AllowAnonymous]
        public IActionResult Index()
        {
            return Ok("running");
        }
    }
}
