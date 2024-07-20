using Podbor.Classes;
using Podbor.Models;

namespace Podbor
{
    public partial class MainPage : ContentPage
    {
        int count = 0;

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
        }
    }

}
