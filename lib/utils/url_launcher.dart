import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtil {
  UrlLauncherUtil._();

  static Future<void> launchUrlSafely(
    String url, {
    LaunchMode mode = LaunchMode.externalApplication,
  }) async {
    try {
      final Uri uri = Uri.parse(url);

      if (!await canLaunchUrl(uri)) {
        throw 'Cannot launch URL: $url';
      }

      await launchUrl(uri, mode: mode);
    } catch (e) {
      if (kDebugMode) {
        debugPrint('URL launch failed: $e');
      }
    }
  }
}
