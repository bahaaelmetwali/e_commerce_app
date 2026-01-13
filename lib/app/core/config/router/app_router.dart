import 'package:mega/app/core/config/router/route_names.dart';
import 'package:flutter/material.dart';

import '../../../features/main_layout.dart';

class AppRouter {
  AppRouter._();
  static Route<dynamic>? Function(RouteSettings) get onGenerateRoute {
    return (RouteSettings settings) {
      switch (settings.name) {
        case RouteNames.mainLayOut:
          return MaterialPageRoute(builder: (_) => const MainLayout());
        default:
          return null;
      }
    };
  }
}
