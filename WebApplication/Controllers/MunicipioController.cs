using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DataAccess;
using Factory;
namespace WebApplication
{
    public class MunicipioController : ApiController
    {
        [HttpGet]
        public IEnumerable<Municipio > Get(int iddepartamento)
        {
            List<Municipio> municipios = new List<Municipio>();
            try
            {
                Datos datos = new Datos();
                municipios = datos.ListarMunicipiosPorDepartamento(iddepartamento);
                return municipios;
            }
            catch 
            {
                return municipios;
            }          
        }
    }
}