import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/core/di/injection.dart';
import 'package:mega/app/features/menu/presentation/cubits/about_app/about_app_cubit.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../core/config/theme/text_styles.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AboutAppCubit>()..getAboutApp(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.aboutApp,
            style: TextStyles.semiBold17,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<AboutAppCubit, AboutAppState>(
          builder: (context, state) {
            if (state is AboutAppLoaded) {
              return Padding(
                padding: const EdgeInsets.all(Dimensions.paddingMedium),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcomeToMega,
                        style: TextStyles.bold14,
                      ),

                      const SizedBox(height: 12),

                      Text(
                        state.aboutAppEntity.content,
                        style: TextStyles.regular12,
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is AboutAppLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            } else if (state is AboutAppError) {
              return Center(child: Text(state.failure.toString()));
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
