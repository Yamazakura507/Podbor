using Podbor.Classes;
using Podbor.Models;
using System.Text;

namespace Podbor
{
    public partial class MainPage : ContentPage
    {
        int count = 0;
        int f = 0;
        int s = 0;

        public MainPage()
        {
            InitializeComponent();
        }

        private void OnCounterClicked(object sender, EventArgs e)
        {
            count++;

            if (count == 1)
                CounterBtn.Text = $"Clicked {count} time";
            else
                CounterBtn.Text = $"Clicked {count} times";

            SemanticScreenReader.Announce(CounterBtn.Text);

            UserLable.Text = Users.GetModel<Users>().Name;

            img.Source = ConverFile.ToImageConvert(Podbor.Models.Image.GetModel<Podbor.Models.Image>().Data);

            Users.GetModel<Users>().Name = "Admin";
        }

        private void CounterBtn_Clicked(object sender, EventArgs e)
        {
            var user = Users.GetModel<Users>();
            user.Password = Encoding.UTF8.GetBytes("admin");
            user.Password = Encoding.UTF8.GetString(user.Password).RSAEcrypt();
            user.PKey = Encoding.UTF8.GetBytes(Encrypt.Key);
        }

        private void CounterBtn2_Clicked(object sender, EventArgs e)
        {
            var user = Users.GetModel<Users>();
            FtpLabel.Text = user.Password.RSADecrypt(Encoding.UTF8.GetString(user.PKey));
        }
    }

}
