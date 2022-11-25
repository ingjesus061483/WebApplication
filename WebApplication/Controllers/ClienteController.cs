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
    public class ClienteController : ApiController
    {
        [HttpGet]
        public IEnumerable<Cliente> Get()
        {
            List<Cliente> clientes = new List<Cliente>();
            try
            {
                Datos datos = new Datos();
                clientes = datos.ListarClientes();
                return clientes;
            }
            catch
            {
                return clientes;
            }
            
        }

    

      [HttpPost]
        public void Post([FromBody] Cliente cliente )
        {
            try
            {
                Datos datos = new Datos();
                datos.InsertarClientes (cliente .Identificacion ,cliente .Nombre ,cliente .Apellido ,
                    cliente .Telefono ,cliente .Correo ,cliente .IdDepartamento ,cliente .IdCiudad ,
                    cliente .FechaNacimento );
            }
            catch (Exception ex)
            {

            }

        }

        [HttpPut ]
        public void Put( [FromBody]Cliente cliente )
        {
            try
            {
                Datos datos = new Datos();
                datos.ActualizarClientes (cliente.Identificacion, cliente.Nombre, cliente.Apellido,
                cliente.Telefono, cliente.Correo, cliente.IdDepartamento, cliente.IdCiudad,
                cliente.FechaNacimento,cliente.Id);
            }
            catch (Exception ex)
            {

            }
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}