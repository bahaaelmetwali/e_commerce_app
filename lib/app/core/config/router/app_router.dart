import 'package:mega/app/core/config/router/route_names.dart';
import 'package:flutter/material.dart';

import '../../../features/main_layout.dart';

class AppRouter {
  AppRouter._();
  static Route<dynamic>? Function(RouteSettings) get onGenerateRoute {
    return (RouteSettings settings) {
      switch (settings.name) {
        case RouteNames.mainLayout:
          final bool isGuest = settings.arguments as bool;
          return MaterialPageRoute(
            builder: (_) => MainLayout(isGuest: isGuest),
          );

        default:
          return null;
      }
    };
  }
}
