
using System.Net;
using System.Net.Mail;

namespace Podbor.Classes
{
    public static class MessageMail
    {
        public static void Message(this Page page,string htmlMessege, string subject, string email, Dictionary<string, string> keyValuePairs, string answer = null)
        {
            foreach (var item in keyValuePairs)
            {
                htmlMessege = htmlMessege.Replace(item.Key, item.Value);
            }

            new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new NetworkCredential("kupcovdaniil763@gmail.com", "ygiw hrex jflu jztx"),
                EnableSsl = true
            }.Send(new MailMessage(new MailAddress("kupcovdaniil763@gmail.com"), new MailAddress(email))
            {
                Subject = subject,
                Body = htmlMessege,
                IsBodyHtml = true,
                From = new MailAddress("kupcovdaniil763@gmail.com", "Podbor")
            });

            if (answer != null)
            {
                page.Messege(answer, Enums.ProviderType.Info);
            }
        }

        public static string InputMessage(this Page page, string htmlMessege, string subject, string email, Dictionary<string, string> keyValuePairs, string answer)
        {
            foreach (var item in keyValuePairs)
            {
                htmlMessege = htmlMessege.Replace(item.Key, item.Value);
            }

            new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new NetworkCredential("kupcovdaniil763@gmail.com", "ygiw hrex jflu jztx"),
                EnableSsl = true
            }.Send(new MailMessage(new MailAddress("kupcovdaniil763@gmail.com"), new MailAddress(email))
            {
                Subject = subject,
                Body = htmlMessege,
                IsBodyHtml = true,
                From = new MailAddress("kupcovdaniil763@gmail.com", "Kontinental Plast")
            });

            return page.InputMessege(answer, "Введите код подтверждения");
        }
    }
}
