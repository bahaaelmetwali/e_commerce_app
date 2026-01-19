import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/core/config/theme/text_styles.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/core/di/injection.dart';
import 'package:mega/app/features/menu/presentation/cubits/cubit/get_cached_data_cubit.dart';
import 'package:mega/app/material/images/app_image_widget.dart';
import 'package:mega/constants/assets.dart';
import 'package:mega/l10n/app_localizations.dart';
import 'widgets/custom_grey_card.dart';
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
                  title: AppLocalizations.of(context)!.updatePassword,
                  icon: Assets.iconsLock,
                ),
                RowSection(
                  title: AppLocalizations.of(context)!.updateEmail,
                  icon: Assets.iconsSms,
                ),
                RowSection(
                  title: AppLocalizations.of(context)!.changeLanguage,
                  icon: Assets.iconsTranslate,
                ),
                RowSection(
                  title: AppLocalizations.of(context)!.termsAndConditions,
                  icon: Assets.iconsForbidden,
                ),
                RowSection(
                  title: AppLocalizations.of(context)!.privacyPolicy,
                  icon: Assets.iconsShieldTick,
                ),
                RowSection(
                  title: AppLocalizations.of(context)!.aboutApp,
                  icon: Assets.iconsInformation,
                ),
                RowSection(
                  title: AppLocalizations.of(context)!.support,
                  icon: Assets.iconsMessageQuestion,
                ),
                RowSection(
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

class MainDataSection extends StatelessWidget {
  const MainDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCachedDataCubit, GetCachedDataState>(
      builder: (context, state) {
        if (state is GetCachedDataLoaded) print(state.cachedData.avatar);
        return Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: ClipOval(
                child: state is GetCachedDataLoaded
                    ? AppImageWidget(
                        path: state.cachedData.avatar ?? Assets.imagesManTest,
                        canCache: true,
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      )
                    : Icon(Icons.person, size: 40),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                state is GetCachedDataLoaded
                    ? state.cachedData.name
                    : "unknown",
                style: TextStyles.semiBold17,
              ),
            ),
          ],
        );
      },
    );
  }
}
