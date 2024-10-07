using Podbor.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Podbor.Classes.AppSettings
{
    public static class InfoAccount
    {
        private static int idUser;

        public static int IdUser 
        { 
            get 
            { 
                return idUser; 
            }
            set 
            {
                User = DBModel.GetModel<Users>(value);
                idUser = value;
            }
        }

        public static Users User { get; set; }
    }
}
