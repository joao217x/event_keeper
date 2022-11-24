import 'package:event_keeper/features/home/tabs/soft_events/view/event_details/soft_event_info_tab.dart';
import 'package:event_keeper/features/home/view/tabs_home_screen.dart';
import 'package:event_keeper/features/login/view/login_screen.dart';
import 'package:event_keeper/features/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes(context) {
    return {
      '/splash': (context) => const SplashScreen(),
      '/login': (context) => LoginScreen(),
      '/tabs': (context) => TabsHomeScreen(),
      '/details': (context) => const SoftEventInfoTab(),
    };
  }
}
