import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_auth/utils/ads_manager.dart';

class InterstitialHelper {
  static InterstitialAd? _interstitialAd;

  static void load() {
    InterstitialAd.load(
      adUnitId: AdManager.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (_) => _interstitialAd = null,
      ),
    );
  }

  static void show() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null;
      load(); // preload next
    }
  }
}
