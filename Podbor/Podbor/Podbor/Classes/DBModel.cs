﻿using MySqlConnector;
using System.Collections.ObjectModel;
using System.Data;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Xml.Serialization;

namespace Podbor.Classes
{
    public class DBModel
    {
        protected static bool IsGet { get; set; } = false;

        public static void InsertModel<T>(Dictionary<string, object> parametrs)
        {
            using (var ms = new Mysql())
            {
                ms.Insert(typeof(T).Name, parametrs);
            }
        }
        
        public virtual void UpdateModel<T>(Dictionary<string, object> parametrs, int? Id = null, Dictionary<string, object>? WhereCollection = null)
        {
            using (var ms = new Mysql())
            {
                ms.Update(typeof(T).Name, parametrs, Id is null ? WhereCollection : new Dictionary<string, object>() { { "Id", Id } });
            }
        }

        public static ObservableCollection<T> GetCollectionModel<T>(Dictionary<string, object>? WhereCollection = null, int? Limit = null, int Offset = 0, Dictionary<string, string>? OrderCollection = null)
        {
            ObservableCollection<T> collection = new ObservableCollection<T>();

            using (var ms = new Mysql())
            {
                var dt = ms.GetTable(@$"SELECT * FROM {typeof(T).Name} 
                WHERE {(WhereCollection is null ? "true" : String.Join(", ", WhereCollection.Select(i => $"{i.Key} = {i.Value}")))} 
                {(Limit is null ? null : $"LIMIT {Limit} ")}OFFSET {Offset}
                {(OrderCollection is null ? null : $" ORDER BY {String.Join(", ", OrderCollection.Select(i => $"{i.Key} {i.Value}"))}")}");

                IsGet = true;

                foreach (DataRow dr in dt.Rows)
                {
                    collection.Add(ToObject<T>(dr));
                }

                IsGet = false;
            }

            return collection;
        }
       
        public static T GetModel<T>(int? Id = null, int numRow = 1)
        {
            DataRow dr = null;

            using (var ms = new Mysql())
            {
                dr = ms.GetRow($"SELECT * FROM {typeof(T).Name} WHERE {(Id is null ? "true" : $"Id = {Id}")} LIMIT 1 OFFSET {numRow-1}");
            }

            IsGet = true;

            T obj = ToObject<T>(dr);

            IsGet = false;

            return obj;
        }

        public virtual void DeleteModel<T>(int? Id = null, Dictionary<string, object>? WhereCollection = null)
        {
            using (var ms = new Mysql())
            {
                ms.ExecSql(@$"DELETE FROM {typeof(T).Name}
                WHERE {(Id is null ? WhereCollection is null ? "true" : String.Join(", ", WhereCollection.Select(i => $"{i.Key} = {i.Value}")) : $"Id = {Id}")}");
            }
        }

        public virtual T GetParametrs<T>(string param, Type typeTb, int? Id = null)
        {
            T obj = default(T);

            using (var ms = new Mysql())
            {
                obj = (T)ms.GetValue($"SELECT {param} FROM {typeTb.Name} WHERE Id = '{Id}'");
            }

            return obj;
        }

        public virtual void SetParametrs<T>(string param, object value, int? Id = null)
        {
            using (var ms = new Mysql())
            {
                ms.ExecSql($"UPDATE {typeof(T).Name} SET {param} = {value} WHERE Id = '{Id}'");
            }
        }

        private static string ToFirstUpper(string str) => char.ToUpper(str[0]) + str.Substring(1);

        private static T ToObject<T>(DataRow dataRow)
        {
            T item = default(T);
            string XMLstr = $"<{typeof(T).Name}>";

            foreach (DataColumn column in dataRow.Table.Columns)
            {
                var value = dataRow[column];
                string byteArr = value.ToString();

                if (value.GetType() == typeof(byte[]))
                {
                    byteArr = Convert.ToBase64String((byte[])value);
                }

                if (value.GetType() == typeof(bool))
                {
                    byteArr = (bool)value ? "1" : "0";
                }

                XMLstr += $"<{column.ColumnName}>{byteArr}</{column.ColumnName}>";
            }

            XMLstr += $"</{typeof(T).Name}>";

            using (StringReader readerXml = new StringReader(XMLstr))
            {
                item = (T)new XmlSerializer(typeof(T)).Deserialize(readerXml);
            }

            return item;
        }
    }
}