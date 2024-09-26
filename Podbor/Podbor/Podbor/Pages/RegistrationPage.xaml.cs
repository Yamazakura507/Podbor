using CommunityToolkit.Maui.Views;
using Podbor.Classes;
using Podbor.Classes.AppSettings;
using Podbor.Classes.Enums;
using Podbor.CustomControl;
using Podbor.Models;
using SkiaSharp.Extended.UI.Controls;

namespace Podbor.Pages;

public partial class RegistrationPage : ContentPage
{
    Loading loading;
    StartParametrs parametrs = new StartParametrs();
    private string rand = null;

    public RegistrationPage()
	{
		InitializeComponent();
    }

    private void RegistrBtOnPressed(object sender, EventArgs e)
    {
        bool isEmpty = false;

        loginProvider.IsVisible = passwordProvaider.IsVisible = errorProvider.IsVisible = isEmpty;

        try
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

            if (!TextBoxRestrictions.TextEmptyTextBox(Email))
            {
                emailProvider.WorkProvider(ProviderType.Info, "Email обязательное поле для заполнения");
                isEmpty = true;
            }
            else
            {
                if (rand is null)
                {
                    rand = this.EmailTextBoxCheck(Email, Login.Text);
                    GPC.IsVisible = true;
                    RegistrBt.Text = "Продолжить";
                    isEmpty = true;
                }
                else
                {
                    if (!this.ContinueEmailTextBoxCheck(rand, CodeMail))
                    {
                        codeMailProvaider.WorkProvider(ProviderType.Info, "Не верный или пустой код подтверждения");
                        isEmpty = true;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            errorProvider.WorkProvider(ProviderType.Error, ex.Message);
            isEmpty = true;
        }

        if (isEmpty) return;

        loading = new Loading();

        this.ShowPopup(loading);

        loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(() =>
        {
            try
            {
                int idUser = Convert.ToInt32(DBModel.ResultRequest($"SELECT ins_upd_user('{Login.Text}','{Password.Text}','{Email.Text}',-1)"));
                if (cbStorageUser.IsChecked) parametrs.IdAutorizateUser = idUser;

                MainThread.BeginInvokeOnMainThread(new Action(() => this.Messege("Вы зарегестрированы!", ProviderType.Info)));
                //Авторизация

                if (idUser == -2)
                {
                    throw new Exception("Пользователь с указаным логином и паролем уже существует");
                }
            }
            catch (Exception ex)
            {
                MainThread.BeginInvokeOnMainThread(new Action(() => errorProvider.WorkProvider(ProviderType.Error, ex.Message)));
            }
        }));

        GC.Collect();
    }

    private void HideAnimationOnTapped(object sender, TappedEventArgs e)
    {
        Password.IsPassword = !Password.IsPassword;
        HideAnimationStart(btlPass);
    }

    private new void Loaded(object sender, EventArgs e)
    {
            #if ANDROID || IOS
                        colSA.Width = colSPL.Width = colSPP.Width = colSPE.Width = colSC.Width = colSPC.Width = GridLength.Auto;
            #else
                colSA.Width = colSPL.Width = colSPP.Width = colSPE.Width = colSC.Width = colSPC.Width = 200;
                GA.Margin = GP.Margin = GL.Margin = GE.Margin = GCb.Margin = GPC.Margin = new Thickness(colSPL.Width.Value / 2, 10, 0, 0);
                lbRegistr.Margin = new Thickness(0, 0, colSPL.Width.Value / 2, 10);
                GA.MaximumWidthRequest = GP.MaximumWidthRequest = GL.MaximumWidthRequest = GE.MaximumWidthRequest = GCb.MaximumWidthRequest = GPC.MaximumWidthRequest = colSPL.Width.Value + 400;
            #endif

        HideAnimationStop(btlPass);
        HideAnimationStop(btlEmail);
        cbStorageUser.IsChecked = true;
    }

    private void HideAnimationStop(SKLottieView view)
    {
        view.IsAnimationEnabled = false;
    }

    async private void HideAnimationStart(SKLottieView view,int time = 1000)
    {
        view.IsAnimationEnabled = true;
        await Task.Delay(time);
        HideAnimationStop(view);
    }

    private void LabelCbOnTapped(object sender, TappedEventArgs e) => cbStorageUser.IsChecked = !cbStorageUser.IsChecked;

    private void EmailButtonOnTapped(object sender, TappedEventArgs e)
    {
        rand = this.EmailTextBoxCheck(Email, Login.Text);
        HideAnimationStart(btlEmail,4100);
    }
}