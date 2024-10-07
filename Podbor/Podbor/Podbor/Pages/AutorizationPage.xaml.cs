using CommunityToolkit.Maui.Views;
using Podbor.Classes;
using Podbor.Classes.AppSettings;
using Podbor.Classes.Enums;
using Podbor.CustomControl;
using Podbor.Models;
using SkiaSharp.Extended.UI.Controls;

namespace Podbor.Pages;

public partial class AutorizationPage : ContentPage
{
    Loading loading;

    StartParametrs parametrs = new StartParametrs();
    private string rand = null;
    private Users users = null;

    public AutorizationPage()
    {
        InitializeComponent();
    }

    private new void Loaded(object sender, EventArgs e)
    {
        try
        {
            #if ANDROID || IOS
                colSA.Width = colSPL.Width = colSPP.Width = colSli.Width = colSPC.Width = GridLength.Auto;
            #else
                colSA.Width = colSPL.Width = colSPP.Width = colSli.Width = colSPC.Width = 200;
                GA.Margin = GP.Margin = GL.Margin = GCb.Margin = GPC.Margin = new Thickness(colSPL.Width.Value/2, 10, 0, 0);
                lbAvtorizte.Margin = new Thickness(0, 0, colSPL.Width.Value/2, 10);
                GA.MaximumWidthRequest = GP.MaximumWidthRequest = GL.MaximumWidthRequest = GCb.MaximumWidthRequest = GPC.MaximumWidthRequest = colSPL.Width.Value + 400;
            #endif

            LottieAnimation.HideAnimationStop(btlPass);
            LottieAnimation.HideAnimationStop(btlEmail);
            LottieAnimation.HideAnimationStop(btsRebasePassword);
            LottieAnimation.HideAnimationStop(btlCodeCont);
            cbStorageUser.IsChecked = true;

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
        LottieAnimation.HideAnimationStart(btlPass);
    }

    private bool CheckAutoAutorizate(int idUser)
    { 
        try 
        {
            return Convert.ToBoolean(DBModel.ResultRequest($"SELECT COUNT(*) <> 0 FROM `Users` u WHERE u.`Id` = '{idUser}'"));
            return true; //��������� ��������
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
                if(cbStorageUser.IsChecked) parametrs.IdAutorizateUser = idUser;
                errorProvider.WorkProvider(ProviderType.Info, "� ��� ������� ����� �����������");

                InfoAccount.IdUser = idUser;
                App.Current.MainPage = new NavigationPage(new FlyautPage.PersonalAccountPage());
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void AutorizationButtonOnPressed(object sender, EventArgs e)
    {
        bool isEmpty = false;
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
                        loginProvider.WorkProvider(ProviderType.Info, "����� ������������ ���� ��� ����������");
                        isEmpty = true;
                    }

                    if (!TextBoxRestrictions.TextEmptyTextBox(Password)) 
                    {
                        passwordProvaider.WorkProvider(ProviderType.Info, "������ ������������ ���� ��� ����������");
                        isEmpty = true;
                    }
                }));

                if (isEmpty) return;

                users = DBModel.GetModel<Users>(default, $"CALL autorization('{Login.Text}','{Password.Text}')", "������ � �������� ������� �� ������");

                MainThread.BeginInvokeOnMainThread(new Action(() => Autorizate(users.Id)));
            }
            catch (Exception ex)
            {
                MainThread.BeginInvokeOnMainThread(new Action(() => errorProvider.WorkProvider(ProviderType.Error, ex.Message)));
            } 
        }));

        GC.Collect();
    }

    private void LabelCbOnTapped(object sender, TappedEventArgs e) => cbStorageUser.IsChecked = !cbStorageUser.IsChecked;

    private void PasswordRebase_Pressed(object sender, TappedEventArgs e)
    {
        LottieAnimation.HideAnimationStart(btsRebasePassword, 3000);

        if (!TextBoxRestrictions.TextEmptyTextBox(Login))
        {
            loginProvider.WorkProvider(ProviderType.Info, "����� ������������ ���� ��� ����������");
        }
        else
        {
            try
            {
                loading = new Loading();

                loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(() =>
                {
                    try
                    {
                        users = DBModel.GetModel<Users>(default,$"SELECT * FROM `Users` u WHERE u.`Login` = '{Login.Text}'","������� � �������� ������� �� �����");
                    }
                    catch (Exception ex)
                    {
                        MainThread.BeginInvokeOnMainThread(new Action(() => throw ex));
                    }
                }));

                while (users is null) continue;

                rand = this.EmailTextBoxCheck(new Microsoft.Maui.Controls.Entry() { Text = users.Email }, Login.Text);
                GPC.IsVisible = true;
            }
            catch (Exception ex)
            {
                codeMailProvaider.WorkProvider(ProviderType.Error, ex.Message);
            }
        }
    }

    private void UpdatePassword_Tapped(object sender, TappedEventArgs e)
    {
        LottieAnimation.HideAnimationStart(btlCodeCont,2400);
        bool isEmpty = false;

        try
        {
            if (!TextBoxRestrictions.TextEmptyTextBox(Login))
            {
                loginProvider.WorkProvider(ProviderType.Info, "����� ������������ ���� ��� ����������");
                isEmpty = true;
            }

            if (!this.ContinueEmailTextBoxCheck(rand, CodeMail))
            {
                codeMailProvaider.WorkProvider(ProviderType.Info, "�� ������ ��� ������ ��� �������������");
                isEmpty = true;
            }

            if (isEmpty) return;

            loading = new Loading();

            loading.LoadingBackgorundWorker.RunWorkerAsync(new Thread(() =>
            {
                try
                {
                    rand = TextBoxRestrictions.GeneratorChufleString(new Random().Next(10, 20));

                    this.NewPassMail(users.Email, new Dictionary<string, string>()
                    { 
                        { "@Login", Login.Text },
                        { "@Code", rand } 
                    });

                    DBModel.ResultRequest($"SELECT ins_upd_user('{users.Login}','{rand}','{users.Email}','{users.Id}')");
                    rand = null;
                    CodeMail.Text = null;
                }
                catch (Exception ex)
                {
                    MainThread.BeginInvokeOnMainThread(new Action(() => codeMailProvaider.WorkProvider(ProviderType.Error, ex.Message)));
                }
            }));

            GPC.IsVisible = false;
        }
        catch (Exception ex)
        {
            codeMailProvaider.WorkProvider(ProviderType.Error, ex.Message);
        }
    }

    private void EmailSend_Tapped(object sender, TappedEventArgs e)
    {
        LottieAnimation.HideAnimationStart(btlEmail, 4100);

        try
        {
            if (users != null)
            {
                rand = this.EmailTextBoxCheck(new Microsoft.Maui.Controls.Entry() { Text = users.Email }, Login.Text);            
            }
            else
            {
                codeMailProvaider.WorkProvider(ProviderType.Alert, "Email �� ������!");
            }
        }
        catch (Exception ex)
        {
            codeMailProvaider.WorkProvider(ProviderType.Error, ex.Message);
        }
    }
}