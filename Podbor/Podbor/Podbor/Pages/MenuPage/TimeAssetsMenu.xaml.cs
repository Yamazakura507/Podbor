using CommunityToolkit.Maui.Views;
using Podbor.Classes;
using Podbor.Classes.AppSettings;
using Podbor.CustomControl;
using Podbor.Models;
using System.Collections.ObjectModel;

namespace Podbor.Pages.MenuPage;

public partial class TimeAssetsMenu : ContentPage
{
    ObservableCollection<DateUser> ViewDate;
    Loading loading { get; set; }


    public TimeAssetsMenu()
	{
		InitializeComponent();
	}

    private void ContentPage_Loaded(object sender, EventArgs e)
    {
        loading = new Loading();

        this.ShowPopup(loading);

        loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(async () =>
        {
            ViewDate = DBModel.GetCollectionModel<DateUser>(new Dictionary<string, object>() { { "IdUser", InfoAccount.IdUser } });

            if (ViewDate is null || ViewDate.Count == 0) return;

            await MainThread.InvokeOnMainThreadAsync(()=> this.BindingContext = ViewDate);
        }));
    }
}