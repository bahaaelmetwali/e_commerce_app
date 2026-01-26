import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/core/di/injection.dart';
import 'package:mega/app/features/notification/presentation/cubits/get_all_notifications/get_all_notifications_cubit.dart';
import 'package:mega/app/features/notification/presentation/widgets/custom_notification_card.dart';
import 'package:mega/app/features/notification/presentation/widgets/empty_notifications.dart';
import 'package:mega/l10n/app_localizations.dart';
import '../../../core/config/theme/text_styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<GetAllNotificationsCubit>()..getAllNotifications(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.notifications,
            style: TextStyles.semiBold17,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<GetAllNotificationsCubit, GetAllNotificationsState>(
          builder: (context, state) {
            if (state is GetAllNotificationsLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            } else if (state is GetAllNotificationsError) {
              return Center(child: Text(state.message));
            } else if (state is GetAllNotificationsLoaded) {
              final notifications = state.notifications;
              if (notifications.isEmpty) {
                return Center(child: EmptyNotifications());
              }
              return Padding(
                padding: const EdgeInsets.all(Dimensions.paddingMedium),
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    return CustomNotificationCard(
                      notification: notifications[index],
                    );
                  },
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
