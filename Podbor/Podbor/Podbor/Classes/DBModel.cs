using MySqlConnector;
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
            try
            {
                using (var ms = new Mysql())
                {
                    ms.Insert(typeof(T).Name, parametrs);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        public virtual void UpdateModel<T>(Dictionary<string, object> parametrs, int? Id = null, Dictionary<string, object>? WhereCollection = null)
        {
            try
            {
                using (var ms = new Mysql())
                {
                    ms.Update(typeof(T).Name, parametrs, Id is null ? WhereCollection : new Dictionary<string, object>() { { "Id", Id } });
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static ObservableCollection<T> GetCollectionModel<T>(Dictionary<string, object>? WhereCollection = null, int Limit = 0, int Offset = 0, Dictionary<string, bool>? OrderCollection = null)
        {
            try
            {
                ObservableCollection<T> collection = new ObservableCollection<T>();

                using (var ms = new Mysql())
                {
                    var sql = @$"SELECT * FROM {typeof(T).Name} 
                    WHERE {(WhereCollection is null ? "true" : String.Join(" AND ", WhereCollection.Select(i => $"{i.Key} = '{i.Value}'")))} 
                    {(Limit == 0 ? null : $"LIMIT {Limit} OFFSET {Offset}")}
                    {(OrderCollection is null ? null : $" ORDER BY {String.Join(", ", OrderCollection.Select(i => $"{i.Key} {(i.Value ? "asc" : "desc")}"))}")}";
                        var dt = ms.GetTable(sql);

                    IsGet = true;

                    foreach (DataRow dr in dt.Rows)
                    {
                        collection.Add(ToObject<T>(dr));
                    }

                    IsGet = false;
                }

                return collection;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }
       
        public static T GetModel<T>(int? Id = null,string errMess = null, int numRow = 1)
        {
            try
            {
                if (Id is null && errMess != null)
                    throw new Exception(errMess);

                DataRow dr = null;

                using (var ms = new Mysql())
                {
                    dr = ms.GetRow($"SELECT * FROM {typeof(T).Name} WHERE {(Id is null ? "true" : $"Id = '{Id}'")} LIMIT 1 OFFSET {numRow - 1}");
                }

                IsGet = true;

                T obj = ToObject<T>(dr);

                IsGet = false;

                return obj;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }

        public virtual void DeleteModel<T>(int? Id = null, Dictionary<string, object>? WhereCollection = null)
        {
            try
            {
                using (var ms = new Mysql())
                {
                    ms.ExecSql(@$"DELETE FROM {typeof(T).Name}
                WHERE {(Id is null ? WhereCollection is null ? "true" : String.Join(", ", WhereCollection.Select(i => $"{i.Key} = '{i.Value}'")) : $"Id = '{Id}'")}");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }

        public virtual T GetParametrs<T>(string param, Type typeTb, int? Id = null)
        {
            try
            {
                T obj = default(T);

                using (var ms = new Mysql())
                {
                    obj = (T)ms.GetValue($"SELECT {param} FROM {typeTb.Name} WHERE Id = '{Id}'");
                }

                return obj;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public virtual void SetParametrs<T>(string param, object value, int? Id = null)
        {
            try
            {
                using (var ms = new Mysql())
                {
                    if (value.GetType() != typeof(Byte[]))
                    {
                        ms.ExecSql($"UPDATE {typeof(T).Name} SET {param} = '{value}' WHERE Id = '{Id}'");
                    }
                    else
                    {
                        ms.UpdateBinaryColumn(typeof(T).Name, param, $"Id = '{Id}'", (byte[])value);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static object ResultRequest(string sql, Dictionary<string, object> whereClause = null)
        {
            try
            {
                object obj;

                using (var ms = new Mysql())
                {
                    obj = ms.GetValue(sql, whereClause);
                }

                return obj;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static string ToFirstUpper(string str) => char.ToUpper(str[0]) + str.Substring(1);

        private static T ToObject<T>(DataRow dataRow)
        {
            try
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
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
