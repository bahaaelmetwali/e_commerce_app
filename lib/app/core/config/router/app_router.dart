import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();
  static Route<dynamic>? Function(RouteSettings) get onGenerateRoute {
    return (RouteSettings settings) {
      switch (settings.name) {

        default:
          return null;
      }
    };
  }
}
