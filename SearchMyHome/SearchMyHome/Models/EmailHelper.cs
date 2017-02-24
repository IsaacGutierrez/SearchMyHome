using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Threading.Tasks;
using System.Web;

namespace SearchMyHome.Models
{
    public class EmailHelper
    {
        private SmtpClient _client;
        private string _htmlBody;
        private string _recipient;
        private MailMessage _message;
        private Thread _SendingEmailThread;

        public EmailHelper(string mailRecipient, HttpContextBase context,string UserGuid)
        {
             this._recipient = mailRecipient;
            this._message = new MailMessage();
            this._message.From = new MailAddress(ConfigurationManager.AppSettings["SearchMyHomeEmailAccount"]);
            this._message.To.Add(new MailAddress(mailRecipient));
            this._message.Subject = "SearchMyHome-Confirmación de suscriptor";
            this._message.IsBodyHtml = true;


            string link = "https://localhost:44345/Account/EmailConfirmation?GuidCode=" + UserGuid;

            string fileUrl = context.Server.MapPath(@"~/Content/EmailConfirmation.html");
            string ConfirmationMail = System.IO.File.ReadAllText(fileUrl);
            this._message.Body = ConfirmationMail.Replace("{LINK-CONFIRMATION}", link);

        }

        private void SetupMailSendingThread() {
            _SendingEmailThread = new Thread(new ParameterizedThreadStart(SendMail));
            _SendingEmailThread.IsBackground = true;
            _SendingEmailThread.Start(this);
        }
        public void SendEmailAsync() {
            ////initlialize sending thread 
            SetupMailSendingThread();
        }

        private async void SendMail(object obj)
        {
            await send();
           
        }

        private async Task send() {

            using (this._client = new SmtpClient()) {
                this._client.Credentials = new NetworkCredential()
                {
                    UserName = ConfigurationManager.AppSettings["SearchMyHomeEmailAccount"],
                    Password = ConfigurationManager.AppSettings["SearchMyHomeEmailAccountPassword"]
                };

                this._client.Host = "smtp-mail.outlook.com";
                this._client.Port = 587;
                this._client.EnableSsl = true;
                
               await this._client.SendMailAsync(this._message);
            }
        }

       



    }
}