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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LanguageCubit>()..getSavedLanguage(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: AppRoutes.routes,
            initialRoute: RouteNames.onBoarding,
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
