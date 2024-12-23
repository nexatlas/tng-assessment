import 'dart:developer';

import 'package:chef_wizz/app/app_analytics_data.dart';
import 'package:chef_wizz/extensions/extensions.dart';
import 'package:flutter/material.dart';

class LoggerNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppAnalyticsData.logScreenView(screenName: '');
    _logNavigation(route.settings.name, 'push');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logNavigation(route.settings.name, 'pop');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) {
      _logNavigation(newRoute.settings.name, 'replace');
    }
  }

  /// Log navigation action
  void _logNavigation(String? routeName, String action) {
    if (routeName != null) {
      log('Screen $action: $routeName', name: 'Navigation');
      AppAnalyticsData.logScreenView(
        screenName: routeName
            .trim()
            .replaceAll(RegExp('[-/]'), ' ')
            .capitalizeFirstLetters(),
      );
    } else {
      log('Null Screen $action: $routeName', name: 'Navigation');
    }
  }
}
