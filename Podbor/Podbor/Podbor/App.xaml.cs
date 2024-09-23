using CommunityToolkit.Maui.Views;
using Podbor.CustomControl;
using Podbor.Pages.Tabbed;

namespace Podbor
{
    public partial class App : Application
    {
        public static Page  MyAppShell { get; set; }
        public static NetworkAccess network { get; set; }

        public App()
        {
            InitializeComponent();

            MyAppShell = new MainTabbedPage();
            Connectivity.ConnectivityChanged += Connectivity_ConnectivityChanged;
            Connectivity_ConnectivityChanged(null, null);
            MainPage = MyAppShell;
        }

        private void Connectivity_ConnectivityChanged(object? sender, ConnectivityChangedEventArgs e)
        {
            network = e is null ? Connectivity.NetworkAccess : e.NetworkAccess;

            if (network != NetworkAccess.Internet) 
            {
                var logingNoNetwork = new Loading(true);
                ((MainTabbedPage)MyAppShell).CurrentPage.ShowPopup(logingNoNetwork);

                logingNoNetwork.LoadingBackgorundWorker.RunWorkerAsync(new Thread(() =>
                 {
                     while (network != NetworkAccess.Internet) 
                     {
                         Thread.Sleep(500);
                     }
                 }));

                GC.Collect();
            }
        }
    }
}
