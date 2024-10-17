using CommunityToolkit.Maui.Views;
using MySqlConnector;
using Podbor.Classes;
using Podbor.Classes.AppSettings;
using Podbor.Classes.Enums;
using Podbor.CustomControl;

namespace Podbor.Pages.WorkPage.Planing;

public partial class PlanInfo : ContentPage
{
    Loading loading { get; set; }

    public PlanInfo()
    {
        InitializeComponent();
    }

    private void ContentPage_Loaded(object sender, EventArgs e)
    { 
        #if ANDROID || IOS
            colSPP.Width = GridLength.Auto;
        #else
            colSPP.Width = 200;
        #endif

        if (this.BindingContext is null)
        {
            ToolbarItem toolbarItemSave = new ToolbarItem() { IconImageSource = ConverFiles.ToImageConvert(Properties.Resources.save), Text = "�������� ����" };
            toolbarItemSave.Clicked += AddPlan_Clicked;
            this.ToolbarItems.Add(toolbarItemSave);
        }
    }

    private void AddPlan_Clicked(object? sender, EventArgs e)
    {
        try
        {
            DBModel.CheckPolice(false, typeof(Models.PlanningJournal));
            if (!CheckInsPlan()) return;

            loading = new Loading();

            this.ShowPopup(loading);

            loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(async () =>
            {
                using (var ms = new Mysql())
                    ms.ExecSql($"INSERT INTO `PlanningJournal`(`Name`, `Commit`, `TargetAmount`, `IdUser`) VALUES ('{AsName.Text}',@Commit,@Sum,'{InfoAccount.IdUser}')", new[]
                    {
                        new MySqlParameter("@Commit", String.IsNullOrEmpty(AsCommit.Text) ? DBNull.Value : AsCommit.Text),
                        new MySqlParameter("@Sum", AsSum.Text)
                    });

                await MainThread.InvokeOnMainThreadAsync(() => ((Page)this.Parent).BackButtonInNavClick());
            }));
        }
        catch (Exception ex)
        {
            ErrProvider.WorkProvider(ProviderType.Error, ex.Message);
        }
    }

    private void sum_TextChanged(object sender, TextChangedEventArgs e) => TextBoxRestrictions.IsDecimalNumberEntry((Entry)sender);

    private bool CheckInsPlan()
    {
        bool result = true;

        if (String.IsNullOrEmpty(AsName.Text))
        {
            AsNameProvider.WorkProvider(ProviderType.Alert, "������������ ������������ ���� ��� ����������");

            result = false;
        }

        if (String.IsNullOrEmpty(AsSum.Text) || Convert.ToDecimal(AsSum.Text.Replace('.', ',')) <= 0)
        {
            AsSumProvider.WorkProvider(ProviderType.Alert, "����� ������ ��������� ������� ��������");

            result = false;
        }

        return result;
    }
}