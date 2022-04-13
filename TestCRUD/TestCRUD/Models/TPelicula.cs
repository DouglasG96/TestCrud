using System;
using System.Collections.Generic;

#nullable disable

namespace TestCRUD.Models
{
    public partial class TPelicula
    {
        public TPelicula()
        {
            TAlquilers = new HashSet<TAlquiler>();
            TCompras = new HashSet<TCompra>();
        }

        public int CodPelicula { get; set; }
        public string TxtDesc { get; set; }
        public int? CantDisponiblesAlquiler { get; set; }
        public int? CantDisponiblesVenta { get; set; }
        public decimal? PrecioAlquiler { get; set; }
        public decimal? PrecioVenta { get; set; }
        public int? CodGenero { get; set; }

        public virtual ICollection<TAlquiler> TAlquilers { get; set; }
        public virtual ICollection<TCompra> TCompras { get; set; }
    }
}
