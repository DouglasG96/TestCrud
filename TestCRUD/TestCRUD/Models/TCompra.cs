using System;
using System.Collections.Generic;

#nullable disable

namespace TestCRUD.Models
{
    public partial class TCompra
    {
        public int CodCompras { get; set; }
        public int? CodPelicula { get; set; }
        public int? CodUsuario { get; set; }
        public decimal? Precio { get; set; }
        public DateTime? FechaHora { get; set; }
        public int? Estado { get; set; }

        public virtual TPelicula CodPeliculaNavigation { get; set; }
        public virtual TUser CodUsuarioNavigation { get; set; }
    }
}
