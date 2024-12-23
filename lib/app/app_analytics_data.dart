//import 'package:firebase_analytics/firebase_analytics.dart';

class AppAnalyticsData {
  /// Log event
  static Future<void> logEvent({
    required String eventName,
    Map<String, Object>? eventParameters,
  }) async {
    // final instance = FirebaseAnalytics.instance;
    // // Log a custom event
    // await instance.logEvent(
    //   name: eventName,
    //   parameters: eventParameters,
    // );
  }

  /// Log screen view
  static Future<void> logScreenView({
    required String screenName,
  }) async {
    // final instance = FirebaseAnalytics.instance;
    // await instance.logScreenView(screenName: '$screenName screen');
  }
}
