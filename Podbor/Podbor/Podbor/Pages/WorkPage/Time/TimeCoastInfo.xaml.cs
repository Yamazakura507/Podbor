using CommunityToolkit.Maui.Views;
using MySqlConnector;
using Podbor.Classes;
using Podbor.Classes.AppSettings;
using Podbor.Classes.Enums;
using Podbor.CustomControl;
using Podbor.Models;

namespace Podbor.Pages.WorkPage.Time;

public partial class TimeCoastInfo : ContentPage
{
    bool isLoad = false;
    Loading loading { get; set; }

    public TimeCoastInfo()
	{
		InitializeComponent();
	}

    private void ContentPage_Loaded(object sender, EventArgs e)
    {
        #if ANDROID || IOS
            colSPP.Width = GridLength.Auto;
        #else
            ToolbarItem toolbarItem = new ToolbarItem() { IconImageSource = ConverFiles.ToImageConvert(Properties.Resources.back) };
            toolbarItem.Clicked += Back_Clicked;
            this.ToolbarItems.Add(toolbarItem);
            colSPP.Width = 200;
        #endif

        if (this.BindingContext is null)
        {
            ToolbarItem toolbarItemSave = new ToolbarItem() { IconImageSource = ConverFiles.ToImageConvert(Properties.Resources.save), Text = "�������� ������� �������" };
            toolbarItemSave.Clicked += AddAssetsGroup_Clicked;
            this.ToolbarItems.Add(toolbarItemSave);
        }
        else
        {
            var span = TimeSpan.FromMinutes(((TimeCoast)this.BindingContext).Minute);

            DateStart.Date = DateTime.Now.AddDays(-span.Days);
            DateEnd.Date = DateTime.Now;

            TimeStart.Time = span - TimeSpan.FromDays(span.Days);
            isLoad = true;
        }
    }

    private void Back_Clicked(object? sender, EventArgs e) => this.BackButtonClick();

    private void num_TextChanged(object sender, TextChangedEventArgs e) => TextBoxRestrictions.IsIntNumberEntry((Entry)sender);

    private void AddAssetsGroup_Clicked(object? sender, EventArgs e)
    {
        try
        {
            DBModel.CheckPolice(false, typeof(Models.AssetsGroup));
            if (!CheckInsTime()) return;

            loading = new Loading();

            this.ShowPopup(loading);

            loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(async () =>
            {
                using (var ms = new Mysql())
                    await ms.ExecSqlAsync($"INSERT INTO `TimeCoast`(`Name`, `Commit`, `IdUser`, `Minute`) values ('{name.Text}','@Commit','{InfoAccount.IdUser}','{(DateEnd.Date - DateStart.Date).TotalMinutes + TimeStart.Time.TotalMinutes}')", new MySqlParameter[]
                    {
                        new MySqlParameter("@Commit", string.IsNullOrEmpty(commit.Text) ? DBNull.Value : commit.Text)
                    });
            }));

            this.BackButtonClick();
        }
        catch (Exception ex)
        {
            ErrProvider.WorkProvider(ProviderType.Error, ex.Message);
        }
    }

    private bool CheckInsTime()
    {
        bool result = true;

        if (!TextBoxRestrictions.TextEmptyTextBox(name))
        {
            nameProvider.WorkProvider(ProviderType.Alert,"������������ ������������ ���� ��� ����������");
            result = false;
        }

        return result;
    }

    private void TimeStart_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
    {
        if (this.BindingContext is null || !isLoad) return;
        TimeSelect();
    }

    private void DateStart_DateSelected(object sender, DateChangedEventArgs e)
    {
        if (this.BindingContext is null || !isLoad) return;
        TimeSelect();
    }

    private void TimeSelect()
    {
        ((TimeCoast)this.BindingContext).Minute = Convert.ToInt32((DateEnd.Date - DateStart.Date).TotalMinutes + TimeStart.Time.TotalMinutes);
    }
}