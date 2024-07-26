using Android.App;
using Android.Content.PM;
using Android.OS;

namespace Podbor
{
    [Activity(Theme = "@style/Maui.SplashTheme", MainLauncher = true, LaunchMode = LaunchMode.SingleTop, ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation, ScreenOrientation = ScreenOrientation.FullUser)]
    public class MainActivity : MauiAppCompatActivity
    {
    }
}
