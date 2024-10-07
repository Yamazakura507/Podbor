//using Java.Util.Logging;
using MySqlConnector;
using Podbor.Classes.AppSettings;
using System;
using System.Collections.ObjectModel;
using System.Data;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Xml;
using System.Xml.Serialization;

namespace Podbor.Classes
{
    public class DBModel
    {
        private static bool isGet = false;
        protected static bool IsGet { get; set; } = false;

        public static void InsertModel<T>(Dictionary<string, object> parametrs)
        {
            try
            {
                CheckPolice(false, typeof(T));

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
                CheckPolice(false, typeof(T));

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

        public static ObservableCollection<T> GetCollectionModel<T>(Dictionary<string, object>? WhereCollection = null, int Limit = 0, int Offset = 0, Dictionary<string, bool>? OrderCollection = null) where T : new()
        {
            try
            {
                CheckPolice(true, typeof(T));

                ObservableCollection<T> collection = new ObservableCollection<T>();

                using (var ms = new Mysql())
                {
                    var sql = @$"SELECT * FROM `{typeof(T).Name}`
                    WHERE {(WhereCollection is null ? "true" : String.Join(" AND ", WhereCollection.Select(i => $"`{i.Key}` = '{i.Value}'")))} 
                    {(Limit == 0 ? null : $"LIMIT {Limit} OFFSET {Offset}")}
                    {(OrderCollection is null ? null : $" ORDER BY {String.Join(", ", OrderCollection.Select(i => $"`{i.Key}` {(i.Value ? "asc" : "desc")}"))}")}";
                        var dt = ms.GetTable(sql.Trim());

                    if (dt is null) return null;

                    IsGet = true;

                    Parallel.ForEach(dt.AsEnumerable(), dr => collection.Add(dr.ToObject<T>(new T())));

                    IsGet = false;
                }

                return collection;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static ObservableCollection<T> GetCollectionModel<T>(string sqlQuery) where T : new()
        {
            CheckPolice(true, typeof(T));

            try
            {
                ObservableCollection<T> collection = new ObservableCollection<T>();

                using (var ms = new Mysql())
                {
                    var dt = ms.GetTable(sqlQuery.Trim());

                    if (dt is null) return null;

                    IsGet = true;

                    Parallel.ForEach(dt.AsEnumerable(), dr => collection.Add(dr.ToObject<T>(new T())));

                    IsGet = false;
                }

                return collection;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static T GetModel<T>(int? Id = null, string proc_comm = null,string errMess = null, int numRow = 1) where T : new()
        {
            try
            {
                CheckPolice(true, typeof(T));

                if (Id is null && proc_comm is null && errMess != null)
                    throw new Exception(errMess);

                DataRow dr = null;

                using (var ms = new Mysql())
                {
                    dr = ms.GetRow(Id is null ? proc_comm : $"SELECT * FROM `{typeof(T).Name}` WHERE {(Id is null ? "true" : $"`Id` = '{Id}'")} LIMIT 1 OFFSET {numRow - 1}");
                }

                if (dr is null)
                    throw new Exception(errMess);

                isGet = IsGet;
                IsGet = true;

                T obj = dr.ToObject<T>(new T());

                IsGet = isGet;

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
                CheckPolice(false, typeof(T));

                using (var ms = new Mysql())
                {
                    ms.ExecSql(@$"DELETE FROM `{typeof(T).Name}`
                WHERE {(Id is null ? WhereCollection is null ? "true" : String.Join(", ", WhereCollection.Select(i => $"`{i.Key}` = '{i.Value}'")) : $"`Id` = '{Id}'")}");
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
                CheckPolice(true, typeTb);

                T obj = default(T);

                using (var ms = new Mysql())
                {
                    obj = (T)ms.GetValue($"SELECT `{param}` FROM `{typeTb.Name}` WHERE `Id` = '{Id}'");
                }

                return obj;
            }
            catch (Exception ex)
            {
                GC.Collect();
                throw ex;
            }
        }

        public static void CheckPolice(bool isRead, Type typeTb)
        {
            try
            {
                if (InfoAccount.IdUser > 0)
                {
                    DataTable dtPolice = new DataTable();

                    using (var ms = new Mysql())
                    {
                        dtPolice = ms.GetTable($@"SELECT tn.`ObjectName`, tn.`Name`, obr.`Name` PoliceName FROM `RestrictionsUser` ru 
                                                    INNER JOIN `GroupingRestriction` gr ON gr.`IdRestriction` = ru.`IdRestrictions` 
                                                    INNER JOIN `ObjectRestrict` obr ON obr.`Id` = gr.`IdObjectRestriction` 
                                                    INNER JOIN `GroupingObject` gro ON gr.`IdGroup` = gro.`IdGroup` 
                                                    INNER JOIN `TableName` tn ON tn.`Id` = gro.`IdObject`
                                                WHERE ru.`IdUser` = '{InfoAccount.IdUser}' AND tn.`ObjectName` = '{typeTb.Name}'", true);
                    }

                    if (dtPolice is null) throw new Exception($"Увас нет прав {(isRead ? "чтения" : "записи")} объекта {typeTb.Name}!\nДля получения прав обратитесь в подержку");
                    if (dtPolice.AsEnumerable().All(i => i["PoliceName"].ToString() == (isRead ? "W" : "R"))) throw new Exception($"Увас нет прав {(isRead ? "чтения" : "записи")} объекта {dtPolice.Rows[0]["Name"]}!\nДля получения прав обратитесь в подержку");
                }
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
                CheckPolice(false, typeof(T));

                using (var ms = new Mysql())
                {
                    if (value.GetType() == typeof(DateTime))
                    {
                        value = Convert.ToDateTime(value).ToString("yyyy-MM-dd HH:mm:ss").Replace(" ", "T");
                    }

                    if (value.GetType() == typeof(decimal) || value.GetType() == typeof(double))
                    {
                        value = value.ToString().Replace(",", ".");
                    }

                    if (value.GetType() == typeof(bool))
                    {
                        value = (bool)value ? "1" : "0";
                    }

                    if (value.GetType() != typeof(Byte[]))
                    {
                        ms.ExecSql($"UPDATE `{typeof(T).Name}` SET `{param}` = '{value}' WHERE `Id` = '{Id}'");
                    }
                    else
                    {
                        ms.UpdateBinaryColumn(typeof(T).Name, param, $"`Id` = '{Id}'", (byte[])value);
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

                return obj == DBNull.Value ? null : obj;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static string ToFirstUpper(string str) => char.ToUpper(str[0]) + str.Substring(1);
    }
}
