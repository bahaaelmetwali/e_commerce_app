import 'package:mega/app/core/config/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:mega/app/features/Auth/presentation/verify_password_screen.dart';

import '../../../features/Auth/presentation/reset_password_screen.dart';
import '../../../features/main_layout.dart';

class AppRouter {
  AppRouter._();
  static Route<dynamic>? Function(RouteSettings) get onGenerateRoute {
    return (RouteSettings settings) {
      switch (settings.name) {
        case RouteNames.mainLayout:
          final bool isGuest = settings.arguments as bool;
          return MaterialPageRoute(builder: (_) => MainLayout(isGuest: isGuest));
        case RouteNames.verifyCodeForResetPassword:
          final String email = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => VerifyPasswordScreen(email: email),
          );
        case RouteNames.resetPassword:
          final args = settings.arguments as Map<String, dynamic>;
          final email = args['email'] as String;
          final otpCode = args['otpCode'] as String;

          return MaterialPageRoute(
            builder: (_) => ResetPasswordScreen(email: email, code: otpCode),
          );
        default:
          return null;
      }
    };
  }
}
