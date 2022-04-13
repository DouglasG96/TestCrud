using System;
using System.Collections.Generic;

#nullable disable

namespace TestCRUD.Models
{
    public partial class TUser
    {
        public TUser()
        {
            TAlquilers = new HashSet<TAlquiler>();
            TCompras = new HashSet<TCompra>();
        }

        public int CodUsuario { get; set; }
        public string TxtUser { get; set; }
        public string TxtPassword { get; set; }
        public string TxtNombre { get; set; }
        public string TxtApellido { get; set; }
        public string NroDoc { get; set; }
        public int? CodRol { get; set; }
        public int? SnActivo { get; set; }

        public virtual TRol CodRolNavigation { get; set; }
        public virtual ICollection<TAlquiler> TAlquilers { get; set; }
        public virtual ICollection<TCompra> TCompras { get; set; }
    }
}
