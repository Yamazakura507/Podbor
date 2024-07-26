
using System.Runtime.CompilerServices;
using System.Security.Cryptography;
using System.Text;

namespace Podbor.Classes
{
    public static class Encrypt
    {
        public static string Key = null;

        public static string RSADecrypt(this byte[] messege, byte[] key)
        {
            RSACryptoServiceProvider RSA = new RSACryptoServiceProvider();
            RSA.FromXmlString(Encoding.UTF8.GetString(key));

            return Encoding.UTF8.GetString(RSA.Decrypt(messege, true));
        }

        public static byte[] RSAEcrypt(this byte[] messege, byte[]? key = null)
        {
            RSACryptoServiceProvider RSA = new RSACryptoServiceProvider();

            Key = key is null ? RSA.ToXmlString(true) : Encoding.UTF8.GetString(key);
            RSA.FromXmlString(Key);

            return RSA.Encrypt(messege, true);
        }
    }
}
