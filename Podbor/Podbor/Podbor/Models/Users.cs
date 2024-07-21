using Podbor.Classes;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Podbor.Models
{
    public class Users : DBModel
    {
        private int id;
        private int idStatus;
        private int? idImage;
        private string phone;
        private string email;
        private string name;
        private string login;
        private byte[] password;
        private byte[] pkey;
        private bool flag;

        public delegate void MessageEventHandler(string message);
        public static event MessageEventHandler ErrorEvent;

        public int Id
        {
            get => !IsGet ? GetParametrs<int>("Id", this.GetType()) : id;
            set 
            {
                if (!IsGet)
                {
                    SetParametrs<Users>("Id", value);
                }
                id = value;
            } 
        }

        public int IdStatus
        {
            get => !IsGet ? GetParametrs<int>("IdStatus", this.GetType()) : idStatus;
            set 
            {
                if (!IsGet)
                {
                    SetParametrs<Users>("IdStatus", value);
                }
                idStatus = value;
            }
        }

        public int? IdImage
        {
            get => !IsGet ? GetParametrs<int>("IdImage", this.GetType()) : idImage;
            set
            {
                if (!IsGet)
                {
                    SetParametrs<Users>("IdImage", value is null ? DBNull.Value : value);
                }
                idImage = value;
            }
        }

        public string Phone
        {
            get => !IsGet ? GetParametrs<string>("Phone", this.GetType()) : phone;
            set
            {
                if (value.Length > 11)
                {
                    Users.ErrorEvent("Номер телефона не должен превышать 11 цифр!");
                }
                else 
                {
                    if (!IsGet)
                    {
                        SetParametrs<Users>("Phone", String.IsNullOrEmpty(value) ? DBNull.Value : value);
                    }
                    phone = value;
                }
            }
        }

        public string Email
        {
            get => !IsGet ? GetParametrs<string>("Email", this.GetType()) : email;
            set
            {
                if (value.Length > 200)
                {
                    Users.ErrorEvent("Email не должен превышать 200 символов!");
                }
                else
                {
                    if (!IsGet)
                    {
                        SetParametrs<Users>("Email", String.IsNullOrEmpty(value) ? DBNull.Value : value);
                    }
                    email = value;
                }
            }
        }

        public string Name
        {
            get => !IsGet ? GetParametrs<string>("Name", this.GetType()) : name;
            set 
            {
                if (value.Length > 100)
                {
                    Users.ErrorEvent("Имя не должно превышать 100 символов!");
                }
                else if (String.IsNullOrEmpty(value))
                {
                    Users.ErrorEvent("Имя это обязательное поле для заполнения!");
                }
                else
                {
                    if (!IsGet)
                    {
                        SetParametrs<Users>("Name", value);
                    }
                    name = value;
                } 
            }
        }

        public bool Flag
        {
            get => !IsGet ? GetParametrs<bool>("Flag", this.GetType()) : flag;
            set
            {
                if (!IsGet)
                {
                    SetParametrs<Users>("Flag", value);
                }
                flag = value;
            }
        }

        public string Login
        {
            get => !IsGet ? GetParametrs<string>("Login", this.GetType()) : login;
            set
            {
                if (value.Length > 100)
                {
                    Users.ErrorEvent("Логин не должен превышать 100 символов!");
                }
                else if (String.IsNullOrEmpty(value))
                {
                    Users.ErrorEvent("Логин это обязательное поле для заполнения!");
                }
                else
                {
                    if (!IsGet)
                    {
                        SetParametrs<Users>("Login", value);
                    }
                    login = value;
                }
            }
        }

        public byte[] Password
        {
            get => !IsGet ? GetParametrs<byte[]>("Password", this.GetType()) : password;
            set
            {
                if (!IsGet)
                {
                    SetParametrs<Users>("Password", value);
                }
                password = value;
            }
        }

        public byte[] PKey
        {
            get => !IsGet ? GetParametrs<byte[]>("PKey", this.GetType()) : pkey;
            set
            {
                if (!IsGet) 
                {
                    SetParametrs<Users>("PKey", value);
                }
                pkey = value;
            }
        }

        Status Status { get => GetModel<Status>(this.IdStatus); }
        Image Image { get => GetModel<Image>(this.IdImage); }

        public override T GetParametrs<T>(string param, Type typeTb, int? Id = null)
        {
            return base.GetParametrs<T>(param, typeTb, id);
        }

        public override void SetParametrs<T>(string param, object value, int? Id = null)
        {
            base.SetParametrs<T>(param, value, id);
        }

        public override void DeleteModel<T>(int? Id = null, Dictionary<string, object>? WhereCollection = null)
        {
            if (Id is null && WhereCollection is null)
            {
                base.DeleteModel<Users>(this.Id);
            }
            else
            {
                base.DeleteModel<Users>(Id, WhereCollection);
            }
        }

        public override void UpdateModel<T>(Dictionary<string, object> parametrs, int? Id = null, Dictionary<string, object>? WhereCollection = null)
        {
            if (Id is null && WhereCollection is null)
            {
                base.UpdateModel<Users>(parametrs, this.Id);
            }
            else
            {
                base.UpdateModel<Users>(parametrs, Id, WhereCollection);
            }
        }
    }
}
