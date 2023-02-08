using System;
using GoogleMobileAds.Api;

public class AppOpenAdLauncher : Singleton<AppOpenAdLauncher>
{
    //protected override void Awake()
    //{
    //    base.Awake();

    //    MobileAds.Initialize(status => { AppOpenAdManager.Instance.LoadAd(); });
    //}
    private void Start()
    {
        MobileAds.Initialize(status => { AppOpenAdManager.Instance.LoadAd(); });

    }

    private void OnApplicationPause(bool pause)
    {
        if (!pause && AppOpenAdManager.ConfigResumeApp && !AppOpenAdManager.ResumeFromAds)
        {
            AppOpenAdManager.Instance.ShowAdIfAvailable();
        }
    }
}