using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Factory
{
    public class Evento
    {
        public int Id { get; set; }
        public string Identificacion { get; set; }
        public int IdCliente { get; set; }

        [Display(Name = "Motivo")]
        public int IdMotivo { get; set; }
        
        public string Motivo { get; set; }

        [Display(Name = "Fecha de evento")]
        public DateTime FechaEvento { get; set; }

        [Display(Name = "Cantidad personas")]
        public int CantidadPersonas { get; set; }

        public string Observaciones { get; set; }

        [Display(Name = "Estado")]
        public int IdEstado { get; set; }
        public string Estado { get; set; }
    }
}
