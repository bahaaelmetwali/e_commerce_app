import 'package:e_commerce_app/app/core/config/router/route_names.dart';
import 'package:e_commerce_app/app/features/Auth/presentation/widgets/new_password_screen.dart';
import 'package:e_commerce_app/app/features/home/presentation/all_product_page.dart';
import 'package:flutter/material.dart';

import '../../../features/Auth/presentation/forget_password_screen.dart';
import '../../../features/Auth/presentation/login_screen.dart';
import '../../../features/Auth/presentation/register_screen.dart';
import '../../../features/Auth/presentation/verification_code_screen.dart';
import '../../../features/home/presentation/product_details_page.dart';
import '../../../features/onboarding/presentation/on_boarding_screen.dart';

class AppRoutes {
  AppRoutes._();
  static Map<String, WidgetBuilder> get routes => {
    RouteNames.onBoarding: (context) => const OnBoardingScreen(),
    RouteNames.login: (context) => const LoginScreen(),
    RouteNames.register: (context) => const RegisterScreen(),
    RouteNames.forgetPassword: (context) => const ForgetPasswordScreen(),
    RouteNames.verificationCode: (context) => const VerificationCodeScreen(),
    RouteNames.newPassword: (context) => const NewPasswordScreen(),
    RouteNames.allProducts: (context) => const AllProductPage(),
    RouteNames.productDetails: (context) => const ProductDetailsPage(),
  };
}
