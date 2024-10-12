using CommunityToolkit.Maui.Views;
using Podbor.Classes;
using Podbor.Classes.AppSettings;
using Podbor.CustomControl;
using System.Collections.ObjectModel;

namespace Podbor.Pages.MenuPage;

public partial class AssetsGroupEditorMenu : ContentPage
{
    ObservableCollection<View.AssetsGroup> ViewGroupAssets;
    Loading loading { get; set; }


    public AssetsGroupEditorMenu()
	{
		InitializeComponent();
	}

    private void ContentPage_Loaded(object sender, EventArgs e)
    {
        loading = new Loading();

        this.ShowPopup(loading);

        loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(async () =>
        {
            ViewGroupAssets = DBModel.GetCollectionModel<View.AssetsGroup>(new Dictionary<string, object>() { { "IdUser", InfoAccount.IdUser } });

            if (ViewGroupAssets is null || ViewGroupAssets.Count == 0) return;

            await MainThread.InvokeOnMainThreadAsync(()=> this.BindingContext = ViewGroupAssets);
        }));
    }
}