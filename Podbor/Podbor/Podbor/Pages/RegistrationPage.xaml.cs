using Podbor.Classes;

namespace Podbor.Pages;

public partial class RegistrationPage : ContentPage
{
	public RegistrationPage()
	{
		InitializeComponent();
        
    }

    private void RegistrBtOnPressed(object sender, EventArgs e)
    {

    }

    private void HideAnimationOnTapped(object sender, TappedEventArgs e)
    {
        Password.IsPassword = !Password.IsPassword;
        HideAnimationStart();
    }

    private new void Loaded(object sender, EventArgs e)
    {
        #if ANDROID || IOS
                        colSA.Width = colSPL.Width = colSPP.Width = GridLength.Auto;
        #else
                colSA.Width = colSPL.Width = colSPP.Width = colSPE.Width = 200;
                GA.Margin = GP.Margin = GL.Margin = GE.Margin = new Thickness(colSPL.Width.Value / 2, 10, 0, 0);
                lbRegistr.Margin = new Thickness(0, 0, colSPL.Width.Value / 2, 10);
                GA.MaximumWidthRequest = GP.MaximumWidthRequest = GL.MaximumWidthRequest = GE.MaximumWidthRequest = colSPL.Width.Value + 400;
        #endif

        HideAnimationStop();
    }

    private void HideAnimationStop()
    {
        btlPass.IsAnimationEnabled = false;
    }

    async private void HideAnimationStart(int time = 1000)
    {
        btlPass.IsAnimationEnabled = true;
        await Task.Delay(time);
        HideAnimationStop();
    }
}