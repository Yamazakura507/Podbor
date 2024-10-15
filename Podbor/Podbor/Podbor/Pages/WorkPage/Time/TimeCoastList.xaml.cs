using CommunityToolkit.Maui.Views;
using Podbor.Classes;
using Podbor.Classes.AppSettings;
using Podbor.Classes.Enums;
using Podbor.CustomControl;
using System.Collections.ObjectModel;

namespace Podbor.Pages.WorkPage.Time;

public partial class TimeCoastList : ContentPage
{
    Loading loading { get; set; }
    ObservableCollection<View.TimeCoast> ViewTime;

    public TimeCoastList()
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
                ViewTime = DBModel.GetCollectionModel<View.TimeCoast>(new Dictionary<string, object>() { { "IdUser", InfoAccount.IdUser } });

                if (ViewTime is null || ViewTime.Count() == 0) throw new Exception("������ ������� ����");
                else MainThread.BeginInvokeOnMainThread(() => BindableLayout.SetItemsSource(timeVSL, ViewTime));
            }
            catch (Exception ex)
            {
                ErrProvider.WorkProvider(ProviderType.Error,ex.Message);
            }
        }));

    }

    private void DeleteButton_Pressed(object sender, EventArgs e)
    {
        var support = ((View.TimeCoast)((ContentView)((Grid)((ImageButton)sender).Parent).Parent).BindingContext);
        loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(() => DBModel.GetModel<Models.TimeCoast>(support.Id).DeleteModel<Models.TimeCoast>()));

        ViewTime.Remove(support);
    }

    async private void Time_Tapped(object sender, TappedEventArgs e)
    {
        var view = (View.TimeCoast)((ContentView)sender).BindingContext;

        loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(() =>
        {
            var model = DBModel.GetModel<Models.TimeCoast>(view.Id);
            MainThread.BeginInvokeOnMainThread(async() => await Navigation.PushAsync(new TimeCoastInfo() { BindingContext = model }));
        }));
    }

    async private void btAddTime_Pressed(object sender, EventArgs e) => await Navigation.PushAsync(new TimeCoastInfo());
}