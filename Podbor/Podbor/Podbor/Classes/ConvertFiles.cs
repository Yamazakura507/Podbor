using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Reflection;

namespace Podbor.Classes
{
    public static class ConverFiles
    {
        public static ImageSource ToImageConvert(byte[] imageArr) => ImageSource.FromStream(() => new MemoryStream(imageArr));
       
        public static byte[] ToByteConvert(string path) => File.ReadAllBytes(path);

        public static T ToObject<T>(this DataRow dataRow, T obj)
        {
            T item = obj;

            Parallel.ForEach(dataRow.Table.Columns.Cast<DataColumn>(), column =>
            {
                PropertyInfo property = GetProperty(typeof(T), column.ColumnName);

                if (property != null && dataRow[column] != DBNull.Value && dataRow[column].ToString() != "NULL")
                {
                    property.SetValue(item, ChangeType(dataRow[column], property.PropertyType), null);
                }
            });

            return item;
        }

        private static PropertyInfo GetProperty(Type type, string attributeName)
        {
            PropertyInfo property = type.GetProperty(attributeName);

            if (property != null)
            {
                return property;
            }

            return type.GetProperties()
                 .Where(p => p.IsDefined(typeof(DisplayAttribute), false) && p.GetCustomAttributes(typeof(DisplayAttribute), false).Cast<DisplayAttribute>().Single().Name == attributeName)
                 .FirstOrDefault();
        }

        public static object ChangeType(object value, Type type)
        {
            if (type.IsGenericType && type.GetGenericTypeDefinition().Equals(typeof(Nullable<>)))
            {
                if (value == null)
                {
                    return null;
                }

                return Convert.ChangeType(value, Nullable.GetUnderlyingType(type));
            }

            return Convert.ChangeType(value, type);
        }

    }
}
