import 'package:injectable/injectable.dart';
import 'package:mega/app/core/helper/api_helper.dart';
import 'package:mega/app/features/notification/data/models/notification_model.dart';

import '../../../../core/constants/constants.dart';

abstract class NotificationDataSource {
  Future<List<NotificationModel>> fetchAllNotifications();
}

@Injectable(as: NotificationDataSource)
class NotificationDataSourceImpl implements NotificationDataSource {
  final ApiHelper apiHelper;
  NotificationDataSourceImpl(this.apiHelper);

  @override
  Future<List<NotificationModel>> fetchAllNotifications() async {
    final dynamic response = await apiHelper.get(
      endPoint: Constants.getAllNotificationsEndPoint,
    );

    if (response is List) {
      return response
          .map((e) => NotificationModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
        'Unexpected response type for notifications: ${response.runtimeType}',
      );
    }
  }
}
