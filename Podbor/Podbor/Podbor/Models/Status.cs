using Podbor.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Podbor.Models
{
    public class Status : DBModel
    {
        private int id;
        private string name;
        private string description;
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
                    SetParametrs<Status>("Id", value);
                }
                id = value;
            }
        }

        public string Name
        {
            get => !IsGet ? GetParametrs<string>("Name", this.GetType()) : name;
            set
            {
                if (value.Length > 100)
                {
                    Status.ErrorEvent("Имя не должно превышать 100 символов!");
                }
                else if (String.IsNullOrEmpty(value))
                {
                    Status.ErrorEvent("Имя это обязательное поле для заполнения!");
                }
                else
                {
                    if (!IsGet)
                    {
                        SetParametrs<Status>("Name", value);
                    }
                    name = value;
                }
            }
        }

        public string Description
        {
            get => !IsGet ? GetParametrs<string>("Description", this.GetType()) : description;
            set
            {
                if (value.Length > 500)
                {
                    Status.ErrorEvent("Описание не должно превышать 500 символов!");
                }
                else
                {
                    if (!IsGet)
                    {
                        SetParametrs<Status>("Description", String.IsNullOrEmpty(value) ? DBNull.Value : value);
                    }
                    description = value;
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
                    SetParametrs<Status>("Flag", value);
                }
                flag = value;
            }
        }

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
                base.DeleteModel<Status>(this.Id);
            }
            else
            {
                base.DeleteModel<Status>(Id, WhereCollection);
            }
        }

        public override void UpdateModel<T>(Dictionary<string, object> parametrs, int? Id = null, Dictionary<string, object>? WhereCollection = null)
        {
            if (Id is null && WhereCollection is null)
            {
                base.UpdateModel<Status>(parametrs, this.Id);
            }
            else
            {
                base.UpdateModel<Status>(parametrs, Id, WhereCollection);
            }
        }
    }
}
