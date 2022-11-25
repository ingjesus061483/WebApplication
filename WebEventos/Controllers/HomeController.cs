using Factory;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace WebEventos.Controllers
{
    public class HomeController : Controller
    {
        string url;
        public HomeController()
        {
            url =ConfigurationManager.AppSettings["urlapi"];// "https://localhost:44396/api"; 
        }

        public  async Task<ActionResult> Index()
        {
            Utilities.url = $"{url}/Departamentos";
            List<Departamento> perfiles = await Utilities.GetListDataAPIAsync<Departamento >();
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}