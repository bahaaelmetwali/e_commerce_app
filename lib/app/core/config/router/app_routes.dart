import 'package:mega/app/core/config/router/route_names.dart';
import 'package:mega/app/features/products/presentation/all_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:mega/app/features/menu/presentation/menu_screen.dart';
import 'package:mega/app/features/menu/presentation/privacy_policy_screen.dart';
import 'package:mega/app/features/menu/presentation/rate_the_app_screen.dart';
import 'package:mega/main.dart';
import '../../../features/Auth/presentation/forget_password_screen.dart';
import '../../../features/Auth/presentation/login_screen.dart';
import '../../../features/Auth/presentation/register_screen.dart';
import '../../../features/Auth/presentation/reset_password_screen.dart';
import '../../../features/Auth/presentation/verification_code_screen.dart';
import '../../../features/Auth/presentation/verify_password_screen.dart';
import '../../../features/notification/presentation/notification_screen.dart';
import '../../../features/menu/presentation/about_app_screen.dart';
import '../../../features/menu/presentation/terms_and_conditions_screen.dart';
import '../../../features/menu/presentation/update_email_screen.dart';
import '../../../features/menu/presentation/update_language_screen.dart';
import '../../../features/menu/presentation/update_password_screen.dart';
import '../../../features/onboarding/presentation/on_boarding_screen.dart';

class AppRoutes {
  AppRoutes._();
  static Map<String, WidgetBuilder> get routes => {
    RouteNames.initialRoute: (context) => const InitialRoute(),
    RouteNames.onBoarding: (context) => const OnBoardingScreen(),
    RouteNames.login: (context) => const LoginScreen(),
    RouteNames.register: (context) => const RegisterScreen(),
    RouteNames.forgetPassword: (context) => const ForgetPasswordScreen(),
    RouteNames.verificationCode: (context) => const VerificationCodeScreen(),
    RouteNames.allProducts: (context) => const AllProductScreen(),
    RouteNames.verifyCodeForResetPassword: (context) =>
        const VerifyPasswordScreen(),
    RouteNames.resetPassword: (context) => const ResetPasswordScreen(),
    RouteNames.menu: (context) => const MenuScreen(),
    RouteNames.termsAndConditions: (context) =>
        const TermsAndConditionsScreen(),
    RouteNames.rateApp: (context) => const RateTheAppScreen(),
    RouteNames.aboutApp: (context) => const AboutAppScreen(),
    RouteNames.privacyPolicy: (context) => const PrivacyPolicyScreen(),
    RouteNames.updatePassword: (context) => const UpdatePasswordScreen(),
    RouteNames.updateEmail: (context) => const UpdateEmailScreen(),
    RouteNames.updateLanguage: (context) => const UpdateLanguageScreen(),
    RouteNames.notificationsScreen: (context) => const NotificationScreen(),
  };
}
