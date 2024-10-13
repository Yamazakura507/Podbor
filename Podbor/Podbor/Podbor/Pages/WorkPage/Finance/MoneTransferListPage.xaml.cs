using CommunityToolkit.Maui.Views;
using Podbor.Classes;
using Podbor.Classes.AppSettings;
using Podbor.Classes.Enums;
using Podbor.CustomControl;
using Podbor.Pages.FlyautPage;
using System.Collections.ObjectModel;

namespace Podbor.Pages.WorkPage.Finance;

public partial class MoneTransferListPage : ContentPage
{
    ObservableCollection<View.MoneyTransfers> ViewMoneyTransfer;
    Loading loading { get; set; }

    public MoneTransferListPage()
    {
        InitializeComponent();
    }

    private void ContentPage_Loaded(object sender, EventArgs e)
    {
        loading = new Loading();

        this.ShowPopup(loading);

        loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(async() =>
        {
            try
            {
                ViewMoneyTransfer = DBModel.GetCollectionModel<View.MoneyTransfers>($"SELECT mt.* FROM `MoneyTransfers` mt INNER JOIN `Assets` a ON a.`IdUser` = '{InfoAccount.IdUser}' AND a.`Id` = mt.`IdAssets` ORDER BY mt.`TimeTransfer` DESC");

                if (ViewMoneyTransfer is null || ViewMoneyTransfer.Count() == 0) throw new Exception("” вас отсутствуют денежные операции");
                else
                {
                    await MainThread.InvokeOnMainThreadAsync(() => BindableLayout.SetItemsSource(mtVSL, ViewMoneyTransfer));
                }
            }
            catch (Exception ex) 
            {
                await MainThread.InvokeOnMainThreadAsync(() => ErrProvider.WorkProvider(ProviderType.Error, ex.Message));
            }
        }));
    }
    private void DeleteAsset_Pressed(object sender, EventArgs e)
    {
        loading = new Loading();

        this.ShowPopup(loading);

        var moneyTransfer = (View.MoneyTransfers)((ImageButton)sender).BindingContext;

        loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(() => DBModel.GetModel<Models.MoneyTransfers>(moneyTransfer.Id).DeleteModel<Models.MoneyTransfers>()));

        ViewMoneyTransfer.Remove(moneyTransfer);
    }
}