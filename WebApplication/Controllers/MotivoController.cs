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
    public class MotivoController : ApiController
    {
        [HttpGet]
        public IEnumerable<Motivo > Get()
        {
            List<Motivo> motivos = new List<Motivo>(); 
            try
            {
                Datos datos = new Datos();
                motivos = datos.ListarMotivos();
                return motivos;

            }
            catch
            {
                return motivos;
            }
            
        }

    }
}