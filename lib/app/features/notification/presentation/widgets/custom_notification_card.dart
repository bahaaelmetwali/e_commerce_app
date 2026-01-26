import 'package:flutter/material.dart';
import 'package:mega/app/core/utils/get_time_difference.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/text_styles.dart';
import '../../../../material/images/app_svg_photo.dart';
import '../../domain/entities/notification_entity.dart';

class CustomNotificationCard extends StatelessWidget {
  const CustomNotificationCard({super.key, required this.notification});
  final NotificationEntity notification;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.greyBackGround,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: AppSvgIcon(
                path: notification.type.notificationIcon,
                height: 24,
                width: 24,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification.title, style: TextStyles.semiBold16),
                SizedBox(height: 4),
                Text(
                  notification.message,
                  style: TextStyles.regular14.copyWith(
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          ),
          Text(
            notification.createdAt.timeAgo(),
            style: TextStyles.regular12.copyWith(
              color: AppColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
