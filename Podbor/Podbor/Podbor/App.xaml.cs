using Podbor.Pages.Tabbed;

namespace Podbor
{
    public partial class App : Application
    {
        public static Page  MyAppShell { get; set; }

        public App()
        {
            InitializeComponent();

            MyAppShell = new MainTabbedPage();
            MainPage = MyAppShell;
        }
    }
}
