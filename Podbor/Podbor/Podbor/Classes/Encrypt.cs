
using System.Security.Cryptography;
using System.Text;

namespace Podbor.Classes
{
    public static class Encrypt
    {
        public static string Key = null;

        public static string RSADecrypt(this byte[] messege, string key)
        {
            RSACryptoServiceProvider RSA = new RSACryptoServiceProvider();
            RSA.FromXmlString(key); 

            return Encoding.UTF8.GetString(RSA.Decrypt(messege, true));
        }

        public static byte[] RSAEcrypt(this string messege)
        {
            RSACryptoServiceProvider RSA = new RSACryptoServiceProvider();

            Key = RSA.ToXmlString(true);
            RSA.FromXmlString(Key);

            return RSA.Encrypt(Encoding.UTF8.GetBytes(messege), true);
        }
    }
}
