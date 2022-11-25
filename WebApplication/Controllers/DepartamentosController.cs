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
    public class DepartamentosController : ApiController
    {
        [HttpGet]
        public IEnumerable<Departamento > Get()
        {
            List<Departamento> departamentos;
            try
            {
                Datos Datos = new Datos();
                departamentos = Datos.Listardepartamentos();

                return departamentos;
            }
            catch
            {
                departamentos = new List<Departamento>();
                return departamentos;
            }
        }
      
    }
}