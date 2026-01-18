import 'package:mega/app/features/Auth/domain/repos/auth_repo.dart';
import 'package:mega/app/features/Auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:mega/app/features/Auth/presentation/cubits/auth/auth_state.dart';
import 'package:mega/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'app/core/config/router/app_router.dart';
import 'app/core/config/router/app_routes.dart';
import 'app/core/config/router/route_names.dart';
import 'app/core/config/theme/app_theme.dart';
import 'app/core/di/injection.dart';
import 'app/core/localization/cubit/language_cubit.dart';
import 'app/core/utils/my_bloc_observer.dart';
import 'app/features/main_layout.dart';
import 'app/features/onboarding/presentation/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await configureDependencies();
  getIt<AuthRepo>().logout();
  runApp(const Mega());
}

class Mega extends StatelessWidget {
  const Mega({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LanguageCubit>()..getSavedLanguage(),
        ),
        BlocProvider(create: (context) => getIt<AuthCubit>()..initApp()),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: AppRoutes.routes,
            initialRoute: RouteNames.initialRoute,
            theme: AppTheme.lightTheme,
            onGenerateRoute: AppRouter.onGenerateRoute,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            locale: state.languageCode != null
                ? Locale(state.languageCode!.code)
                : null,
            builder: (context, child) => ResponsiveBreakpoints.builder(
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
              child: child ?? const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}

class InitialRoute extends StatefulWidget {
  const InitialRoute({super.key});

  @override
  State<InitialRoute> createState() => _InitialRouteState();
}

class _InitialRouteState extends State<InitialRoute> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          return const MainLayout(isGuest: false);
        } else if (state is AuthGuest) {
          return const MainLayout(isGuest: true);
        } else if (state is AuthUnauthenticated) {
          return const OnBoardingScreen();
        } else {
          return const Scaffold();
        }
      },
    );
  }
}
