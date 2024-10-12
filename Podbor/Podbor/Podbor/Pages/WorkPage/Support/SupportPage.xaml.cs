using CommunityToolkit.Maui.Views;
using Podbor.Classes;
using Podbor.Classes.AppSettings;
using Podbor.Classes.Enums;
using Podbor.CustomControl;
using System.Collections.ObjectModel;

namespace Podbor.Pages.WorkPage.Support;

public partial class SupportPage : ContentPage
{
    Loading loading { get; set; }
    ObservableCollection<View.Support> ViewSupport;

    public SupportPage()
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
                if (InfoAccount.IsAdmin)
                    ViewSupport = DBModel.GetCollectionModel<View.Support>(default,default,default,new Dictionary<string, bool>() { { "DateOfAcess", false }, { "IsAnswer", false } });
                else
                    ViewSupport = DBModel.GetCollectionModel<View.Support>(new Dictionary<string, object>() { { "IdUser", InfoAccount.IdUser } },default,default, new Dictionary<string, bool>() { { "DateOfAccess", false }, { "IsAnswer", true } });

                if (ViewSupport is null || ViewSupport.Count() == 0) return;
                else MainThread.BeginInvokeOnMainThread(() => BindableLayout.SetItemsSource(supportVSL, ViewSupport));
            }
            catch (Exception ex){}
        }));

        LottieAnimation.HideAnimationStop(btlSendSupport);
    }

    private void SendSupport_Tapped(object sender, TappedEventArgs e)
    {
        LottieAnimation.HideAnimationStart(btlSendSupport, 2400);

        loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(async() =>
        {
            try
            {
                if (String.IsNullOrEmpty(NewSupport.Text)) throw new Exception();

                using (var ms = new Mysql())
                {
                    int idSupport = Convert.ToInt32(DBModel.ResultRequest($"INSERT INTO `Support`(`AppealMessage`, `IdUser`) VALUES ('{NewSupport.Text}','{InfoAccount.IdUser}');SELECT LAST_INSERT_ID();"));
                    var support = DBModel.GetModel<View.Support>(idSupport);

                    await MainThread.InvokeOnMainThreadAsync(() => ViewSupport.Add(support));
                }
            }
            catch (Exception ex) { this.Messege("�� ������� ��������� ���������",ProviderType.Error); }
        }));
    }

    private void DeleteButton_Pressed(object sender, EventArgs e)
    {
        var support = ((View.Support)((ContentView)((Grid)((ImageButton)sender).Parent).Parent).BindingContext);
        loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(() => DBModel.GetModel<Models.Support>(support.Id).DeleteModel<Models.Support>()));

        ViewSupport.Remove(support);
    }

    async private void SupportPress_Tapped(object sender, TappedEventArgs e)
    {
            try
            {
                await Navigation.PushAsync(new NavigationPage(new SupportInfoPage(((View.Support)((ContentView)sender).BindingContext).Id)));
            }
            catch (Exception ex)
            {
                this.Messege(ex.Message,ProviderType.Info);
            }
    }
}