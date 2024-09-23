using CommunityToolkit.Maui.Views;
using Microsoft.Maui.Controls.PlatformConfiguration.TizenSpecific;
using Microsoft.Maui.Storage;
using Podbor.Classes;
using Podbor.Classes.AppSettings;
using Podbor.Classes.Enums;
using Podbor.CustomControl;
using Podbor.Models;
using SkiaSharp.Extended.UI.Controls;
using System.ComponentModel;
using System.Text;
using System.Text.Json;
using System.Windows.Input;

namespace Podbor.Pages;

public partial class AutorizationPage : ContentPage
{
    Loading loading;

    StartParametrs parametrs = new StartParametrs();

    public AutorizationPage()
    {
        InitializeComponent();
    }

    private new void Loaded(object sender, EventArgs e)
    {
        try
        {
            #if ANDROID || IOS
                colSA.Width = colSPL.Width = colSPP.Width = GridLength.Auto;
            #else
                colSA.Width = colSPL.Width = colSPP.Width = 200;
                GA.Margin = GP.Margin = GL.Margin = new Thickness(colSPL.Width.Value/2, 10, 0, 0);
                lbAvtorizte.Margin = new Thickness(0, 0, colSPL.Width.Value/2, 10);
                GA.MaximumWidthRequest = GP.MaximumWidthRequest = GL.MaximumWidthRequest = colSPL.Width.Value + 400;
            #endif

            HideAnimationStop();
            Autorizate(parametrs.IdAutorizateUser);
        }
        catch (Exception ex)
        {
            errorProvider.WorkProvider(ProviderType.Error, ex.Message);
        }
    }

    private void HideAnimationOnTapped(object sender, TappedEventArgs e)
    {
        Password.IsPassword = !Password.IsPassword;
        HideAnimationStart();
    }

    private bool CheckAutoAutorizate(int idUser)
    { 
        try 
        {
            return Convert.ToBoolean(DBModel.ResultRequest($"SELECT COUNT(*) <> 0 FROM `Users` u WHERE u.`Id` = '{idUser}'"));
        }
        catch (Exception ex) 
        {
            throw ex;
        }
    }

    public void Autorizate(int idUser)
    {
        try
        {
            if (CheckAutoAutorizate(idUser))
            {
                parametrs.IdAutorizateUser = idUser;
                errorProvider.WorkProvider(ProviderType.Info, "У вас имеется раняя авторизация");
                //Переход...
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    async private void HideAnimationStart(int time = 1000)
    {
        btlPass.IsAnimationEnabled = true;
        await Task.Delay(time);
        HideAnimationStop();
    }

    private void HideAnimationStop()
    {
        btlPass.IsAnimationEnabled = false;
    }

    private void AutorizationButtonOnPressed(object sender, EventArgs e)
    {
        bool isEmpty = false;
        Users user = null;
        loading = new Loading();

        loginProvider.IsVisible = passwordProvaider.IsVisible = errorProvider.IsVisible = isEmpty;

        this.ShowPopup(loading);

        loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(() => 
        {
            try
            {
                MainThread.BeginInvokeOnMainThread(new Action(() => 
                {
                    if (!TextBoxRestrictions.TextEmptyTextBox(Login)) 
                    {
                        loginProvider.WorkProvider(ProviderType.Info, "Логин обязательное поле для заполнения");
                        isEmpty = true;
                    }

                    if (!TextBoxRestrictions.TextEmptyTextBox(Password)) 
                    {
                        passwordProvaider.WorkProvider(ProviderType.Info, "Пароль обязательное поле для заполнения");
                        isEmpty = true;
                    }
                }));

                if (isEmpty) return;

                user = DBModel.GetModel<Users>(default, $"CALL autorization('{Login.Text}','{Password.Text}')", "Акаунт с указаным логином не найден");

                MainThread.BeginInvokeOnMainThread(new Action(() => Autorizate(user.Id)));
            }
            catch (Exception ex)
            {
                MainThread.BeginInvokeOnMainThread(new Action(() => errorProvider.WorkProvider(ProviderType.Error, ex.Message)));
            } 
        }));

        GC.Collect();
    }
}