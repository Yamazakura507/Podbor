namespace Podbor
{
    public partial class App : Application
    {
        public static AppShell  MyAppShell { get; set; }

        public App()
        {
            InitializeComponent();

            MyAppShell = new AppShell();
            MainPage = MyAppShell;
        }
    }
}
