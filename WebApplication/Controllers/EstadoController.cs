using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Factory;
using DataAccess;

namespace WebApplication.Controllers
{
    public class EstadoController : ApiController
    {
        [HttpGet]
        public IEnumerable<Estado > Get()
        {
            List<Estado > estados = new List<Estado >();
            try
            {
                Datos datos = new Datos();
                estados  = datos.ListarEstados ();
                return estados ;
            }
            catch
            {
                return estados ;
            }
        }      
    }
}