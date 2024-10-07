namespace Podbor.Classes
{
    public static class ConverFiles
    {
        public static ImageSource ToImageConvert(byte[] imageArr) => ImageSource.FromStream(() => new MemoryStream(imageArr));
       
        public static byte[] ToByteConvert(string path) => File.ReadAllBytes(path);

<<<<<<< HEAD
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
=======
        //public static byte[] Mp3ToWavConvert(byte[] mp3file)
        //{
        //    using (var stream = new MemoryStream())
        //    using (var ms = new MemoryStream(mp3file))
        //    using (var reader = new Mp3FileReader(ms))
        //    {
        //        WaveFileWriter.WriteWavFileToStream(stream, reader);
        //        return stream.ToArray();
        //    }
        //}

        //public static string VirtualStreamVideo(Messeges mp4file)
        //{
        //    string fileName = mp4file.IdMessege.ToString() + ".mp4";

        //    using (SafeFileHandle fileHandle =
        //       new SafeFileHandle(
        //           BoxedAppSDK.NativeMethods.BoxedAppSDK_CreateVirtualFileBasedOnIStream(
        //               fileName,
        //               BoxedAppSDK.NativeMethods.EFileAccess.GenericWrite,
        //               BoxedAppSDK.NativeMethods.EFileShare.Read,
        //               IntPtr.Zero,
        //               BoxedAppSDK.NativeMethods.ECreationDisposition.New,
        //               BoxedAppSDK.NativeMethods.EFileAttributes.Normal,
        //               IntPtr.Zero,
        //               new VirtualFileStream(new MemoryStream(mp4file.Data))
        //           ),
        //           true
        //       )
        //   ) { }

        //    return fileName;
        //}
>>>>>>> main

    }
}
