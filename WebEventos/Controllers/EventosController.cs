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
    public class EventosController : Controller
    {
        string url;

        public EventosController()
        {
            url = ConfigurationManager.AppSettings["urlapi"];

        }
        // GET: Eventos
        public async  Task <ActionResult> Index(string  identificacion)
        {
            Utilities.url = $"{url}/Cliente";
            List<Cliente> clientes = await Utilities.GetListDataAPIAsync<Cliente>();
            var cliente = clientes.Find(x => x.Identificacion == identificacion);
            Utilities.url = $"{url}/Eventos";
            List<Evento >eventos  = await Utilities.GetListDataAPIAsync<Evento >();            

            if (cliente  !=null )
            {    
                eventos = eventos.Where(x => x.IdCliente == cliente.Id).ToList();
   
            }
            else
            {
                if (!string.IsNullOrEmpty(identificacion))
                {
                    TempData["tipo"] = 1;
                    TempData["message"] = "El cliente no se encuentra registrado ";
                }
              
            }
            ViewBag.cliente = cliente;
            return View(eventos );


        }
        public SelectList  ListarMotivos(List<Motivo > motivos )
        {
            List<SelectListItem> items = new List<SelectListItem>();
            foreach (var dpto in motivos )
            {
                var item = new SelectListItem { Selected = false, Text = dpto.Nombre, Value = dpto.Id.ToString() };
                items.Add(item);
            }
            var select = new SelectList(items, "Value", "Text");
            return select;

        }
        public SelectList ListarEstados(List<Estado > estados )
        {
            List<SelectListItem> items = new List<SelectListItem>();
            foreach (var dpto in estados )
            {
                var item = new SelectListItem { Selected = false, Text = dpto.Nombre, Value = dpto.Id.ToString() };
                items.Add(item);
            }
            var select = new SelectList(items, "Value", "Text");
            return select;

        }



        // GET: Eventos/Create
        public async Task<ActionResult> Create(int idCliente)
        {
            Utilities.url = $"{url}/Motivo";
            List<Motivo> motivos = await Utilities.GetListDataAPIAsync<Motivo>();
            Utilities.url = $"{url}/Estado";
            List<Estado> estados = await Utilities.GetListDataAPIAsync<Estado>();

            ViewBag.selectlistMotivos = ListarMotivos(motivos);
            ViewBag.selectlistEstados = ListarEstados(estados);
            if (idCliente != 0)
            {
                return View();
            }
            else
            {
                TempData["tipo"] = 1;
                TempData["message"] = "Debbe buscar un cliente amtes de crear un evento ";
                return RedirectToAction("Index");

            }

        }

        // POST: Eventos/Create
        [HttpPost]
        public async Task< ActionResult> Create(Evento evento )
        {
            try
            {
                // TODO: Add insert logic here
                Utilities.url = $"{url}/Eventos";
                await Utilities.PostDataAPIAsync(evento );
                TempData["tipo"] = 1;
                TempData["message"]= "Evento registrado con exito ";


                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Eventos/Edit/5
        public async Task < ActionResult> Edit(int id)
        {
            Utilities.url = $"{url}/Motivo";
            List<Motivo> motivos = await Utilities.GetListDataAPIAsync<Motivo>();
            Utilities.url = $"{url}/Estado";
            List<Estado> estados = await Utilities.GetListDataAPIAsync<Estado>();
            Utilities.url = $"{url}/Eventos";
            List<Evento> eventos = await Utilities.GetListDataAPIAsync<Evento>();
            var evento = eventos.Find(x => x.Id == id);

            ViewBag.selectlistMotivos = ListarMotivos(motivos);
            ViewBag.selectlistEstados = ListarEstados(estados);

            return View(evento );
        }

        // POST: Eventos/Edit/5
        [HttpPost]
        public async Task < ActionResult> Edit(Evento evento )
        {
            try
            {
                Utilities.url = $"{url}/Eventos";
                await Utilities.PUTDataAPIAsync(evento );
                TempData["tipo"] = 1;
                TempData["message"] = "Evento actualido con exito ";

                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Eventos/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Eventos/Delete/5
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
