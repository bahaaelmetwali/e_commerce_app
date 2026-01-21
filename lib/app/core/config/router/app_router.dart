import 'package:mega/app/core/config/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:mega/app/core/data/domain/entities/cached_user_entity.dart';

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
        case RouteNames.profileScreen:
        final CachedUserEntity  cachedUserEntity = settings.arguments as CachedUserEntity ;
          return MaterialPageRoute(builder: (_) => ProfileScreen(cachedUserEntity: cachedUserEntity));
        default:
          return null;
      }
    };
  }
}
