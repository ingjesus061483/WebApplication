using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Factory
{
    public class Cliente
    {
		public int Id { get; set; }
		public string Identificacion { get; set; }
		public string Nombre { get; set; }
		public string Apellido { get; set; }
		public string Telefono { get; set; }
		public string Correo { get; set; }
		
		[Display(Name = "Departamento")]
		public int IdDepartamento { get; set; }
		
		public string Deepartamento { get; set; }
		
		[Display(Name = "Ciudad")]
		public int IdCiudad { get; set; }
		
		public string Ciudad { get; set; }
		
		[Display(Name = "Fecha nacimiento")]
		public DateTime FechaNacimento { get; set; }
		
		public int Edad { get; set; }

		[Display(Name = "Eventos asignados")]
		public int CantidadEventos { get; set; }

		public string NombreCompleto
		{
			get
			{
				return Nombre + " " + Apellido;
			}
		}
	}
}
