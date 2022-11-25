using DataAccess;
using Factory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApplication.Controllers
{
    public class EventosController : ApiController
    {
        Datos datos;
        [HttpGet]        
        public IEnumerable<Evento> Get()
        {
            List<Evento> eventos = new List<Evento>();
            try
            {
                datos = new Datos();
                eventos = datos.ListarEventos();
                return eventos;
            }
            catch
            {
                return eventos;
            }
           
        }

        

        // POST api/<controller>
        public void Post([FromBody] Evento evento )
        {
            try
            {
                datos = new Datos();
                datos.InsertarEventos(evento.IdCliente, evento.FechaEvento, evento.CantidadPersonas, evento.IdMotivo,
                    evento.Observaciones, evento.IdEstado);
            }
            catch
            {

            }

        }

        // PUT api/<controller>/5
        public void Put( [FromBody]Evento evento )
        {
            try
            {
                datos = new Datos();
                datos.ActualizarEventos  (evento.Id, evento.FechaEvento, evento.CantidadPersonas, evento.IdMotivo,
                    evento.Observaciones, evento.IdEstado);
            }
            catch
            {

            }
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}