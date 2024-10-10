using CommunityToolkit.Maui.Views;
using Podbor.Classes;
using Podbor.Classes.Enums;
using Podbor.CustomControl;
using Podbor.View.CALL;
using System.Collections.ObjectModel;

namespace Podbor.Pages.WorkPage.Credit;

public partial class FuturePaymentsPage : ContentPage
{
    ObservableCollection<view_future_payments_tmp> ViewLoanPayments;
    Loading loading;

    public FuturePaymentsPage()
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
                ViewLoanPayments = DBModel.GetCollectionModel<view_future_payments_tmp>($"CALL future_payments_auto_time('{((Models.Credit)this.BindingContext).Id}');SELECT * FROM `view_future_payments_tmp`;");

                if (ViewLoanPayments is null || ViewLoanPayments.Count() == 0) throw new Exception("У вас отсутствуют платежи");
                else
                {
                    try { ViewLoanPayments = new ObservableCollection<view_future_payments_tmp>(ViewLoanPayments.AsParallel().OrderBy(i => i.DatePay)); }
                    catch (Exception) { }
                    
                    MainThread.BeginInvokeOnMainThread(() => BindableLayout.SetItemsSource(loanVSL, ViewLoanPayments));
                }
            }
            catch (Exception ex)
            {
                MainThread.BeginInvokeOnMainThread(() => ErrProvider.WorkProvider(ProviderType.Error, ex.Message));
            }
        }));
    }
}