import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/core/config/theme/text_styles.dart';
import 'package:mega/app/core/di/injection.dart';
import 'package:mega/app/features/menu/presentation/cubits/terms/terms_cubit.dart';
import 'package:mega/l10n/app_localizations.dart';

import '../../../core/constants/dimensions.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TermsCubit>()..loadTerms(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.termsAndConditions,
            style: TextStyles.semiBold17,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<TermsCubit, TermsState>(
          builder: (context, state) {
            if (state is TermsLoaded) {
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
                      Text(state.terms.content, style: TextStyles.regular12),
                    ],
                  ),
                ),
              );
            } else if (state is TermsLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            } else if (state is TermsError) {
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
