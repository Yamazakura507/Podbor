using SkiaSharp.Extended.UI.Controls;

namespace Podbor.Classes
{
    public class LottieAnimation
    {
        async public static void HideAnimationStart(SKLottieView lottie, int time = 1000)
        {
            lottie.IsAnimationEnabled = true;
            await Task.Delay(time);
            HideAnimationStop(lottie);
        }

        public static void HideAnimationStop(SKLottieView lottie)
        {
            lottie.IsAnimationEnabled = false;
        }
    }
}
