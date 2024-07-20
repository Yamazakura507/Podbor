using Podbor.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Podbor.Models
{
    public class Image : DBModel
    {
        private int id;
        private byte[] data;

        public delegate void MessageEventHandler(string message);
        public static event MessageEventHandler ErrorEvent;

        public int Id
        {
            get => !IsGet ? GetParametrs<int>("Id", this.GetType()) : id;
            set
            {
                if (!IsGet)
                {
                    SetParametrs<Image>("Id", value);
                }
                id = value;
            }
        }

        public byte[] Data
        {
            get => !IsGet ? GetParametrs<byte[]>("Data", this.GetType()) : data;
            set
            {
                if (value.Length > 1e7)
                {
                    Image.ErrorEvent("Размер файла не должен превышать 10МБ!");
                }
                else
                {
                    if (!IsGet)
                    {
                        SetParametrs<Image>("Data", value);
                    }
                    data = value;
                }
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
                base.DeleteModel<Image>(this.Id);
            }
            else
            {
                base.DeleteModel<Image>(Id, WhereCollection);
            }
        }

        public override void UpdateModel<T>(Dictionary<string, object> parametrs, int? Id = null, Dictionary<string, object>? WhereCollection = null)
        {
            if (Id is null && WhereCollection is null)
            {
                base.UpdateModel<Image>(parametrs, this.Id);
            }
            else
            {
                base.UpdateModel<Image>(parametrs, Id, WhereCollection);
            }
        }
    }
}
