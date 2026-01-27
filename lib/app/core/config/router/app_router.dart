import 'package:mega/app/core/config/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:mega/app/core/data/domain/entities/cached_user_entity.dart';
import 'package:mega/app/features/products/presentation/product_details_screen.dart';
import 'package:mega/app/features/review/presentation/all_reviews_screen.dart';

import '../../../features/chat/presentation/chat_screen.dart';
import '../../../features/main_layout.dart';
import '../../../features/menu/presentation/profile_screen.dart';

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
        case RouteNames.productDetails:
          final String productId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(productId: productId),
          );
        case RouteNames.profileScreen:
          final CachedUserEntity cachedUserEntity =
              settings.arguments as CachedUserEntity;
          return MaterialPageRoute(
            builder: (_) => ProfileScreen(cachedUserEntity: cachedUserEntity),
          );
        case RouteNames.allReviews:
          final String productId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => AllReviewsScreen(productId: productId),
          );
        case RouteNames.chatScreen:
        final String userId = settings.arguments as String;
          return MaterialPageRoute(builder: (_) => ChatScreen(userId: userId));
        default:
          return null;
      }
    };
  }
}
