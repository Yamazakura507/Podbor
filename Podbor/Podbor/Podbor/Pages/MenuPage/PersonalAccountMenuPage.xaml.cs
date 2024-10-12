using Podbor.Classes;
using Podbor.Classes.AppSettings;

namespace Podbor.Pages.MenuPage;

public partial class PersonalAccountMenuPage : ContentPage
{
	public PersonalAccountMenuPage()
	{
		InitializeComponent();
	}

	private async void Exit_Pressed(object sender, EventArgs e)
	{
		StartParametrs.ClearParametr();
        this.BackButtonClick();
    } 

    private void LbExit_Tapped(object sender, TappedEventArgs e) => Exit_Pressed(null, null);
}