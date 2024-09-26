using MailKit.Net.Smtp;
using MailKit.Security;
using MimeKit;
using Podbor.Properties;
using System.Net;
using System.Text;

namespace Podbor.Classes
{
    public static class MessageMail
    {
        async public static void InputMessage(this Page page, string htmlMessege, string subject, string email, Dictionary<string, string> keyValuePairs, string answer)
        {
            foreach (var item in keyValuePairs)
            {
                htmlMessege = htmlMessege.Replace(item.Key, item.Value);
            }

            using (var client = new SmtpClient())
            {
                var msg = new MimeMessage();

                msg.From.Add(new MailboxAddress("FINANCE", "no-reply@fond29.ru"));
                //msg.To.Add(new MailboxAddress("", "daniil.kuptsov.05@mail.ru"));

                msg.To.Add(new MailboxAddress("", email));

                msg.Subject = "Подтверждение Email";

                BodyBuilder builder = new BodyBuilder();
                builder.HtmlBody = htmlMessege;

                //вложить файл к письму
                //string fileName = Environment.CurrentDirectory + $@"\kr-1-3.{DateTime.Now.ToString("yyyyMMddHHmm")}.xlsx";
                //DTToExcel(fileName);
                //builder.Attachments.Add(fileName);

                msg.Body = builder.ToMessageBody();
                client.ServerCertificateValidationCallback = (mysender, certificate, chain, sslPolicyErrors) => { return true; };
                client.CheckCertificateRevocation = false;

                await client.ConnectAsync("smtp.mail.ru", 465, SecureSocketOptions.Auto).ConfigureAwait(false);
                await client.AuthenticateAsync("no-reply@fond29.ru", "2yxaXk7a4V1hJrtgTN2q").ConfigureAwait(false);

                var task = await client.SendAsync(msg).ConfigureAwait(false);
                await client.DisconnectAsync(false).ConfigureAwait(false);

                //File.Delete(fileName);
            }
        }
    }
}
