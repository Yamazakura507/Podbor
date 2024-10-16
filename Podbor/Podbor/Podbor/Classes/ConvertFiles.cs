﻿namespace Podbor.Classes
{
    public static class ConverFile
    {
        public static ImageSource ToImageConvert(byte[] imageArr) => ImageSource.FromStream(() => new MemoryStream(imageArr));
       
        public static byte[] ToByteConvert(string path) => File.ReadAllBytes(path);

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

    }
}
