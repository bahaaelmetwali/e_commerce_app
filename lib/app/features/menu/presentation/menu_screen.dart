import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/core/config/theme/text_styles.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/core/di/injection.dart';
import 'package:mega/app/features/menu/presentation/cubits/get_cached_data/get_cached_data_cubit.dart';
import 'package:mega/constants/assets.dart';
import 'package:mega/l10n/app_localizations.dart';
import '../../../core/config/router/route_names.dart';
import 'widgets/custom_grey_card.dart';
import 'widgets/main_data_section.dart';
import 'widgets/row_section.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetCachedDataCubit>()..getCachedData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.menu,
            style: TextStyles.semiBold17,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingMedium),
            child: Column(
              children: [
                MainDataSection(),
                SizedBox(height: 20),
                CustomGreyCard(
                  title: AppLocalizations.of(context)!.becameStoreOwner,
                  icon: Assets.iconsShop,
                ),
                SizedBox(height: 20),

                CustomGreyCard(
                  title: AppLocalizations.of(context)!.myOrders,
                  icon: Assets.iconsShoppingBag,
                ),
                SizedBox(height: 30),
                RowSection(
                  title: AppLocalizations.of(context)!.accountInformation,
                  icon: Assets.iconsAlert,
                ),
                RowSection(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.updatePassword);
                  },
                  title: AppLocalizations.of(context)!.updatePassword,
                  icon: Assets.iconsLock,
                ),
                RowSection(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.updateEmail);
                  },
                  title: AppLocalizations.of(context)!.updateEmail,
                  icon: Assets.iconsSms,
                ),
                RowSection(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.updateLanguage);
                  },
                  title: AppLocalizations.of(context)!.changeLanguage,
                  icon: Assets.iconsTranslate,
                ),
                RowSection(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.termsAndConditions);
                  },
                  title: AppLocalizations.of(context)!.termsAndConditions,
                  icon: Assets.iconsForbidden,
                ),
                RowSection(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.privacyPolicy);
                  },
                  title: AppLocalizations.of(context)!.privacyPolicy,
                  icon: Assets.iconsShieldTick,
                ),
                RowSection(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.aboutApp);
                  },
                  title: AppLocalizations.of(context)!.aboutApp,
                  icon: Assets.iconsInformation,
                ),
                RowSection(
                  title: AppLocalizations.of(context)!.support,
                  icon: Assets.iconsMessageQuestion,
                ),
                RowSection(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.rateApp);
                  },
                  title: AppLocalizations.of(context)!.rateTheApp,
                  icon: Assets.iconsStar,
                ),
                RowSection(
                  title: AppLocalizations.of(context)!.logout,
                  icon: Assets.iconsLogout,
                  color: AppColors.redColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
