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
    public class ReportesController : Controller
    {
        string url;

        public ReportesController()
        {
            url = ConfigurationManager.AppSettings["urlapi"];


        }
        // GET: Reportes
        public async Task< ActionResult> Index(DateTime? fechainicio ,DateTime? fechafin)
        {
          if ( fechainicio ==null)
            {
                fechainicio = DateTime.Now;
            }
            if (fechafin == null)
            {
                fechafin= DateTime.Now;
            }

            Utilities.url = $"{url}/Eventos";
            List<Evento> eventos = await Utilities.GetListDataAPIAsync<Evento>();
           eventos = eventos.Where(x => x.FechaEvento >= fechainicio  && x.FechaEvento <= fechafin).ToList();
            

            return View(eventos );
        }
        public async Task < ActionResult > Export(int id)

        {
            Utilities.url = $"{url}/Eventos";
            List<Evento> eventos = await Utilities.GetListDataAPIAsync<Evento>();
           var evento= eventos.Find (x => x.Id == id);
            Utilities.url = $"{url}/Cliente";
            List<Cliente> clientes = await Utilities.GetListDataAPIAsync<Cliente>();
            var cliente = clientes.Find(x => x.Id == evento .IdCliente );
            ViewBag.Cliente = cliente;
            ViewBag.Evento = evento;
            return View();
        }       
    }
}
