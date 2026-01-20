import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/features/menu/presentation/cubits/privacy/privacy_cubit.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/theme/text_styles.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/di/injection.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PrivacyCubit>()..loadPrivacy(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.privacyPolicy,
            style: TextStyles.semiBold17,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<PrivacyCubit, PrivacyState>(
          builder: (context, state) {
            if (state is PrivacyLoaded) {
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
                      Text(state.privacy.content, style: TextStyles.regular12),
                    ],
                  ),
                ),
              );
            } else if (state is PrivacyLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            } else if (state is PrivacyError) {
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
