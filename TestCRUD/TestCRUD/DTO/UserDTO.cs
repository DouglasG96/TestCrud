﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TestCRUD.DTO
{
    public class UserDTO
    {
        public int CodUsuario { get; set; }
        public string TxtUser { get; set; }
        public string TxtPassword { get; set; }
        public string TxtNombre { get; set; }
        public string TxtApellido { get; set; }
        public string NroDoc { get; set; }
        public int? CodRol { get; set; }
        public int? SnActivo { get; set; }
    }
}
