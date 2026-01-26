import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/features/menu/presentation/cubits/get_cached_data/get_cached_data_cubit.dart';

import '../../../../../constants/assets.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/app_colors.dart' show AppColors;
import '../../../../core/config/theme/text_styles.dart';
import '../../../../material/images/app_svg_photo.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<GetCachedDataCubit, GetCachedDataState>(
              builder: (context, state) {
                return RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: AppLocalizations.of(context)!.hello,
                    style: TextStyles.semiBold28.copyWith(
                      color: AppColors.primaryText,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: state is GetCachedDataLoaded
                            ? state.cachedData.name
                            : 'User',
                        style: TextStyles.semiBold28.copyWith(
                          color: AppColors.nameText,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Text(
              AppLocalizations.of(context)!.welcomeToMega,
              style: TextStyles.medium14.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteNames.notificationsScreen);
          },
          child: CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.greyBackGround,
            child: Center(child: AppSvgIcon(path: Assets.iconsNotification)),
          ),
        ),
      ],
    );
  }
}
