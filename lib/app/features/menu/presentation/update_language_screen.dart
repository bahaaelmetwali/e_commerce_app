import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/core/constants/dimensions.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../core/config/theme/text_styles.dart';
import '../../../core/data/domain/entities/language/app_language_code_enum.dart';
import '../../../core/localization/cubit/language_cubit.dart';

class UpdateLanguageScreen extends StatefulWidget {
  const UpdateLanguageScreen({super.key});

  @override
  State<UpdateLanguageScreen> createState() => _UpdateLanguageScreenState();
}

class _UpdateLanguageScreenState extends State<UpdateLanguageScreen> {
  int? selectedLanguageIndex;

  @override
  void initState() {
    super.initState();
    context.read<LanguageCubit>().getSavedLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.changeLanguage,
          style: TextStyles.semiBold17,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingMedium),
        child: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            if (selectedLanguageIndex == null && state.languageCode != null) {
              selectedLanguageIndex =
                  state.languageCode == AppLanguageCodeEnum.en ? 0 : 1;
            }

            return Column(
              children: [
                languageOption(0, AppLocalizations.of(context)!.english),
                const SizedBox(height: 10),
                languageOption(1, AppLocalizations.of(context)!.arabic),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget languageOption(int index, String language) {
    bool isSelected = selectedLanguageIndex == index;

    return GestureDetector(
      onTap: () async {
        setState(() {
          selectedLanguageIndex = index;
        });

        final languageCode = index == 0
            ? AppLanguageCodeEnum.en
            : AppLanguageCodeEnum.ar;

        await context.read<LanguageCubit>().changeLanguage(languageCode);
      },
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.greyBackGround : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingMedium,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              language,
              style: TextStyles.bold14.copyWith(
                color: isSelected ? AppColors.primaryColor : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
