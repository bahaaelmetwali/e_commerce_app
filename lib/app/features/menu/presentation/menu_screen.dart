import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/core/config/theme/text_styles.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/core/data/domain/entities/cached_user_entity.dart';
import 'package:mega/app/core/di/injection.dart';
import 'package:mega/app/features/menu/presentation/cubits/get_cached_data/get_cached_data_cubit.dart';
import 'package:mega/app/material/buttons/custom_button.dart';
import 'package:mega/app/material/snakbars/show_custom_snack_bar.dart';
import 'package:mega/constants/assets.dart';
import 'package:mega/l10n/app_localizations.dart';
import '../../../core/config/router/route_names.dart';
import '../../../material/images/app_image_widget.dart';
import '../../Auth/presentation/cubits/log_out/logout_cubit.dart';
import 'widgets/custom_grey_card.dart';
import 'widgets/row_section.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  void _showLogoutConfirmation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.logout,
                style: TextStyles.semiBold17,
              ),
              const SizedBox(height: 12),
              Text(
                AppLocalizations.of(context)!.areYouSureLogout,
                style: TextStyles.regular14,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: AppLocalizations.of(context)!.cancel,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomButton(
                      color: AppColors.redColor,
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<LogoutCubit>().logout();
                      },
                      child: AppLocalizations.of(context)!.logout,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    late CachedUserEntity cachedUserEntity;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<GetCachedDataCubit>()..getCachedData(),
        ),
        BlocProvider(create: (_) => getIt<LogoutCubit>()),
      ],
      child: BlocListener<LogoutCubit, LogoutState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            showCustomSnackBar(
              context,
              message: AppLocalizations.of(context)!.youAreLoggedOut,
            );
            Navigator.pushReplacementNamed(context, RouteNames.login);
          } else if (state is LogoutFailure) {
            showCustomSnackBar(
              context,
              message: state.failure.toString(),
              isError: true,
            );
          }
        },
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
                  BlocBuilder<GetCachedDataCubit, GetCachedDataState>(
                    builder: (context, state) {
                      if (state is GetCachedDataLoaded) {
                        cachedUserEntity = state.cachedData;
                      }
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: ClipOval(
                              child: state is GetCachedDataLoaded
                                  ? AppImageWidget(
                                      path:
                                          state.cachedData.avatar ??
                                          Assets.imagesManTest,
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
                  ),
                  const SizedBox(height: 20),
                  CustomGreyCard(
                    title: AppLocalizations.of(context)!.becameStoreOwner,
                    icon: Assets.iconsShop,
                  ),
                  const SizedBox(height: 20),
                  CustomGreyCard(
                    title: AppLocalizations.of(context)!.myOrders,
                    icon: Assets.iconsShoppingBag,
                  ),
                  const SizedBox(height: 30),
                  RowSection(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.profileScreen,arguments: cachedUserEntity);
                    },
                    title: AppLocalizations.of(context)!.accountInformation,
                    icon: Assets.iconsAlert,
                  ),
                  RowSection(
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.updatePassword),
                    title: AppLocalizations.of(context)!.updatePassword,
                    icon: Assets.iconsLock,
                  ),
                  RowSection(
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.updateEmail),
                    title: AppLocalizations.of(context)!.updateEmail,
                    icon: Assets.iconsSms,
                  ),
                  RowSection(
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.updateLanguage),
                    title: AppLocalizations.of(context)!.changeLanguage,
                    icon: Assets.iconsTranslate,
                  ),
                  RowSection(
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteNames.termsAndConditions,
                    ),
                    title: AppLocalizations.of(context)!.termsAndConditions,
                    icon: Assets.iconsForbidden,
                  ),
                  RowSection(
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.privacyPolicy),
                    title: AppLocalizations.of(context)!.privacyPolicy,
                    icon: Assets.iconsShieldTick,
                  ),
                  RowSection(
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.aboutApp),
                    title: AppLocalizations.of(context)!.aboutApp,
                    icon: Assets.iconsInformation,
                  ),
                  RowSection(
                    title: AppLocalizations.of(context)!.support,
                    icon: Assets.iconsMessageQuestion,
                  ),
                  RowSection(
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.rateApp),
                    title: AppLocalizations.of(context)!.rateTheApp,
                    icon: Assets.iconsStar,
                  ),
                  RowSection(
                    onTap: () => _showLogoutConfirmation(context),
                    title: AppLocalizations.of(context)!.logout,
                    icon: Assets.iconsLogout,
                    color: AppColors.redColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
