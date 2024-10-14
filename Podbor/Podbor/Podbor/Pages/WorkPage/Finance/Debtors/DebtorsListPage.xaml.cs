using CommunityToolkit.Maui.Views;
using Podbor.Classes;
using Podbor.Classes.AppSettings;
using Podbor.Classes.Enums;
using Podbor.CustomControl;
using Podbor.Pages.FlyautPage;
using System.Collections.ObjectModel;

namespace Podbor.Pages.WorkPage.Finance.Debtors;

public partial class DebtorsListPage : ContentPage
{
    public int? IdDate { get; set; } = null;

    ObservableCollection<View.Debtor> ViewDebtors;
    Loading loading { get; set; }

    public DebtorsListPage()
    {
        InitializeComponent();
    }

    private void ContentPage_Loaded(object sender, EventArgs e)
    {
        loading = new Loading();

        this.ShowPopup(loading);

        loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(() =>
        {
            try
            {

                ViewDebtors = DBModel.GetCollectionModel<View.Debtor>(new Dictionary<string, object>() { { "IdUser", InfoAccount.IdUser } });

                if (ViewDebtors is null || ViewDebtors.Count() == 0) throw new Exception("� ��� ����������� ��������");
                else
                {
                    MainThread.BeginInvokeOnMainThread(() => BindableLayout.SetItemsSource(debVSL, ViewDebtors));
                }
            }
            catch (Exception ex) 
            {
                MainThread.BeginInvokeOnMainThread(() => ErrProvider.WorkProvider(ProviderType.Error, ex.Message));
            }
        }));
    }
    private void DeleteDebtor_Pressed(object sender, EventArgs e)
    {
        loading = new Loading();

        this.ShowPopup(loading);

        var debtor = (View.Debtor)((ImageButton)sender).BindingContext;

        loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(() => DBModel.GetModel<Models.Debtor>(debtor.Id).DeleteModel<Models.Debtor>()));

        ViewDebtors.Remove(debtor);
    }
    async private void AddDebtor_Pressed(object sender, EventArgs e) => await Navigation.PushAsync(new NavigationPage(new EditorDebtor() { BindingContext = null }));
    async private void Debtor_Tapped(object sender, TappedEventArgs e)
    {
        var debtor = (View.Debtor)((ContentView)sender).BindingContext;

        await Navigation.PushAsync(new NavigationPage(new EditorDebtor() { BindingContext = DBModel.GetModel<Models.Debtor>(debtor.Id) }));
    }
}