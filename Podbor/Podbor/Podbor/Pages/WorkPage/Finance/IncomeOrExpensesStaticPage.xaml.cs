using CommunityToolkit.Maui.Views;
using Podbor.Classes;
using Podbor.Classes.AppSettings;
using Podbor.CustomControl;
using Podbor.View;

namespace Podbor.Pages.WorkPage.Finance;

public partial class IncomeOrExpensesStaticPage : ContentPage
{
	public int IdDate;

    Loading loading { get; set; }

    public IncomeOrExpensesStaticPage()
	{
		InitializeComponent();
	}

    private void ContentPage_Loaded(object sender, EventArgs e)
    {
        loading = new Loading();

        this.ShowPopup(loading);

        loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(async () =>
        {
            var revenues = DBModel.GetCollectionModel<Revenues>(new Dictionary<string, object>() { { "IdDate", IdDate }, { "IdUser", InfoAccount.IdUser } });

            if (revenues is null || revenues.Count == 0) return;

            await MainThread.InvokeOnMainThreadAsync(() =>
            {
                Income.BindingContext = revenues.FirstOrDefault(i => i.IsRevenues);
                Expenses.BindingContext = revenues.FirstOrDefault(i => !i.IsRevenues);
            });
        }));
    }
}