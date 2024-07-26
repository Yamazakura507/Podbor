using CommunityToolkit.Maui.Views;
using SkiaSharp.Extended.UI.Controls;
using System.ComponentModel;

namespace Podbor.CustomControl;

public partial class Loading : Popup
{

    public BackgroundWorker LoadingBackgorundWorker = new BackgroundWorker();

    private SKFileLottieImageSource[] loadingsFiles = 
		{ 
			new SKFileLottieImageSource() { File = "Loading.json" },
			new SKFileLottieImageSource() { File = "Loading2.json" },
			new SKFileLottieImageSource() { File = "Loading3.json" },
			new SKFileLottieImageSource() { File = "Loading4.json" },
			new SKFileLottieImageSource() { File = "Loading5.json" }
		};

    public Loading()
	{
		InitializeComponent();

        Loaded();
	}

    private void Loaded()
    {
        loadingLottie.Source = loadingsFiles[new Random().Next(0, loadingsFiles.Length)];

        LoadingBackgorundWorker.DoWork += new DoWorkEventHandler(bw_DoWork);
        LoadingBackgorundWorker.RunWorkerCompleted += new RunWorkerCompletedEventHandler(bw_RunWorkerCompleted);
    }

    void bw_DoWork(object sender, DoWorkEventArgs e)
    {
        Thread thread = (Thread)e.Argument;

        thread.Start();
        thread.Join();
    }

    void bw_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
    {
        this.Close();
    }
}