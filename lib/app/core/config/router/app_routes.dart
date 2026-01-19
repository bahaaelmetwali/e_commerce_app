import 'package:mega/app/core/config/router/route_names.dart';
import 'package:mega/app/features/home/presentation/all_product_page.dart';
import 'package:flutter/material.dart';
import 'package:mega/app/features/menu/presentation/menu_screen.dart';
import 'package:mega/main.dart';

import '../../../features/Auth/presentation/forget_password_screen.dart';
import '../../../features/Auth/presentation/login_screen.dart';
import '../../../features/Auth/presentation/register_screen.dart';
import '../../../features/Auth/presentation/reset_password_screen.dart';
import '../../../features/Auth/presentation/verification_code_screen.dart';
import '../../../features/Auth/presentation/verify_password_screen.dart';
import '../../../features/home/presentation/product_details_page.dart';
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
    RouteNames.allProducts: (context) => const AllProductPage(),
    RouteNames.productDetails: (context) => const ProductDetailsPage(),
    RouteNames.verifyCodeForResetPassword: (context) =>
        const VerifyPasswordScreen(),
    RouteNames.resetPassword: (context) => const ResetPasswordScreen(),
    RouteNames.menu: (context) => const MenuScreen(),
  };
}
