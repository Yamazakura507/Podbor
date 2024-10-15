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

            await MainThread.InvokeOnMainThreadAsync(()=>
            { 
                this.BindingContext = ViewDate;
                collectionView.SelectedItem = ViewDate[0];
            });

            if (ViewDate.Last().DateJournal.Year == DateTime.Now.Year && ViewDate.Last().DateJournal.Month == DateTime.Now.Month)
                await MainThread.InvokeOnMainThreadAsync(() => addDate.IsVisible = false);
        }));
    }

    private void AddTime_Pressed(object sender, EventArgs e)
    {
        loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(() =>
        {
            int idDate = Convert.ToInt32(DBModel.ResultRequest($"SELECT new_date()"));

            var model = DBModel.GetModel<DateUser>(default, $"SELECT * FROM `DateUser` WHERE `IdUser` = '{InfoAccount.IdUser}' AND `IdDate` = '{idDate}'");
            ViewDate.Add(model);
        }));

        addDate.IsVisible = false;
    }
}