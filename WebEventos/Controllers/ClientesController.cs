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
    public class ClientesController : Controller
    {
        string url;
        public ClientesController()
        {
            url = ConfigurationManager.AppSettings["urlapi"];
        }        
        public async Task <ActionResult >ListarMunicipios(int? iddepartamento)
        {            
            Utilities.url = $"{url}/Municipio?iddepartamento={(iddepartamento !=null ? iddepartamento:0)}";
            List<Municipio> municipios = await Utilities.GetListDataAPIAsync<Municipio>();
            return Json(municipios , JsonRequestBehavior.AllowGet);
        }       
        public async Task<ActionResult> Index()
        {
            Utilities.url = $"{url}/Cliente";
            List<Cliente> cliente = await Utilities.GetListDataAPIAsync<Cliente >();
            return View(cliente);
        }
        // GET: Clientes
   
        // GET: Clientes/Details/5
        public async  Task< ActionResult> Details(int id)
        {
            Utilities.url = $"{url}/Cliente";
            List<Cliente> clientes = await Utilities.GetListDataAPIAsync<Cliente>();
            var cliente = clientes.Find(x => x.Id == id);
            Utilities.url = $"{url}/Eventos";
            List<Evento> eventos = await Utilities.GetListDataAPIAsync<Evento>();
            eventos = eventos.Where(x => x.IdCliente == id).ToList();
            ViewBag.eventos = eventos;
            return View(cliente );
        }
        SelectList listarDepartamentos( List <Departamento>departamentos)
        {
            List<SelectListItem> items = new List<SelectListItem>();
            foreach (var dpto in departamentos)
            {
                var item = new SelectListItem { Selected = false, Text = dpto.Nombre, Value = dpto.Id.ToString() };
                items.Add(item);
            }
            var select = new SelectList(items, "Value", "Text");
            return select;

        }
        // GET: Clientes/Create
        public async Task <  ActionResult> Create()
        {
            Utilities.url = $"{url}/Departamentos";
            List<Departamento> departamentos = await Utilities.GetListDataAPIAsync<Departamento>();
            ViewBag.selectlist = listarDepartamentos (departamentos );
            return View();
        }

        // POST: Clientes/Create
        [HttpPost]
        public async  Task< ActionResult> Create(Cliente  cliente )
        {
            try
            {
                Utilities.url = $"{url}/Cliente";
                await  Utilities.PostDataAPIAsync(cliente);
                TempData["tipo"] = 1;
                TempData["message"] = "Cliente registrado con exito ";

                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Clientes/Edit/5
        public async  Task< ActionResult> Edit(int id)
        {
            Utilities.url = $"{url}/Departamentos";
            List<Departamento> departamentos = await Utilities.GetListDataAPIAsync<Departamento>();
            ViewBag.selectlist = listarDepartamentos(departamentos);

            Utilities.url = $"{url}/Cliente";
            List<Cliente> clientes = await Utilities.GetListDataAPIAsync<Cliente>();
            var cliente = clientes.Find(x => x.Id == id) ;
            return View(cliente );
        }

        // POST: Clientes/Edit/5
        [HttpPost]
        public async Task < ActionResult> Edit( Cliente cliente )
        {
            try
            {
                Utilities.url = $"{url}/Cliente";
                await Utilities.PUTDataAPIAsync(cliente);
                TempData["tipo"] = 1;
                TempData["message"] = "Cliente actualizado con exito ";

                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Clientes/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Clientes/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
