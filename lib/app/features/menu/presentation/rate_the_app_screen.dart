import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/core/di/injection.dart';
import 'package:mega/app/material/buttons/custom_button.dart';
import 'package:mega/app/material/snakbars/show_custom_snack_bar.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../core/config/theme/text_styles.dart';
import '../../../material/sliders/custom_slider.dart';
import '../domain/use_cases/rate_app_use_case.dart';
import 'cubits/rate_app/rate_app_cubit.dart';

class RateTheAppScreen extends StatefulWidget {
  const RateTheAppScreen({super.key});

  @override
  State<RateTheAppScreen> createState() => _RateTheAppScreenState();
}

class _RateTheAppScreenState extends State<RateTheAppScreen> {
  double rating = 0;
  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RateAppCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.rateTheApp,
            style: TextStyles.semiBold17,
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          height: 60,
          child: BlocConsumer<RateAppCubit, RateAppState>(
            listener: (context, state) {
              if (state is RateAppSuccess) {
                showCustomSnackBar(
                  context,
                  message: AppLocalizations.of(
                    context,
                  )!.yourResponseSubmittedSuccessfully,
                );
                Navigator.pop(context);
              } else if (state is RateAppError) {
                showCustomSnackBar(
                  context,
                  message: state.failure.toString(),
                  isError: true,
                );
              }
            },
            builder: (context, state) {
              if (state is RateAppLoading) {
                return CustomButton(
                  onPressed: () {},
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  isLoading: true,
                  child: AppLocalizations.of(context)!.submit,
                );
              }

              return CustomButton(
                onPressed: () {
                  final params = RateAppParams(
                    rating: rating,
                    comment: commentController.text,
                  );
                  context.read<RateAppCubit>().rateApp(params);
                },
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: AppLocalizations.of(context)!.submit,
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              CustomSliderRating(
                onChanged: (value) {
                  rating = value;
                },
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.howWasYourExperience,
                style: TextStyles.bold17,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: commentController,
                maxLines: 6,
                decoration: InputDecoration(
                  filled: true,

                  fillColor: AppColors.greyBackGround,
                  hintText: AppLocalizations.of(
                    context,
                  )!.describeYourExperience,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
