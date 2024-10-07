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
                var RstristionUsers = DBModel.GetCollectionModel<RestrictionsUser>(new Dictionary<string, object>() { { "IdUser", value } });

                User = RstristionUsers.FirstOrDefault().User;
                IsAdmin = RstristionUsers.Any(i => i.IdRestrictions == 2);
                idUser = value;
            }
        }

        public static Users User { get; set; }

        public static bool IsAdmin { get; set; } = false;
    }
}
