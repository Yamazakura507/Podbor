using CommunityToolkit.Maui.Views;
using Podbor.Classes;
using Podbor.Classes.AppSettings;
using Podbor.Classes.Enums;
using Podbor.CustomControl;
using Podbor.Pages.Tabbed;
using System.Collections.ObjectModel;

namespace Podbor.Pages.WorkPage.Planing;

public partial class TasksListPage : ContentPage
{
    ObservableCollection<View.Tasks> ViewTasks;
    Loading loading { get; set; }

    public TasksListPage()
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

                ViewTasks = DBModel.GetCollectionModel<View.Tasks>($"SELECT t.* FROM `Tasks` t INNER JOIN `PlanningTasks` pt ON (pt.`IdPlan`,pt.`IdTask`) = ('{((Models.PlanningJournal)this.BindingContext).Id}',t.`Id`)");

                if (ViewTasks is null || ViewTasks.Count() == 0) throw new Exception("� ��� ����������� ������");
                else
                {
                    MainThread.BeginInvokeOnMainThread(() => BindableLayout.SetItemsSource(debVSL, ViewTasks));
                }
            }
            catch (Exception ex) 
            {
                MainThread.BeginInvokeOnMainThread(() => ErrProvider.WorkProvider(ProviderType.Error, ex.Message));
            }
        }));
    }
    private void DeleteTask_Pressed(object sender, EventArgs e)
    {
        loading = new Loading();

        this.ShowPopup(loading);

        var plan = (View.Tasks)((ImageButton)sender).BindingContext;

        loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(() => DBModel.GetModel<Models.Tasks>(plan.Id).DeleteModel<Models.Tasks>()));

        ViewTasks.Remove(plan);
    }
    async private void AddTask_Pressed(object sender, EventArgs e) => await Navigation.PushAsync(new NavigationPage(new TaskInfoPage() { BindingContext = null, IdPlan = ((Models.PlanningJournal)this.BindingContext).Id }));
    async private void Task_Tapped(object sender, TappedEventArgs e)
    {
        var task = (View.Tasks)((ContentView)sender).BindingContext;

        await Navigation.PushAsync(new NavigationPage(new TaskInfoPage() { BindingContext = DBModel.GetModel<Models.Tasks>(task.Id), IdPlan = ((Models.PlanningJournal)this.BindingContext).Id }));
    }
}