part of 'get_all_notifications_cubit.dart';

sealed class GetAllNotificationsState extends Equatable {
  const GetAllNotificationsState();

  @override
  List<Object> get props => [];
}

final class GetAllNotificationsInitial extends GetAllNotificationsState {}

final class GetAllNotificationsLoading extends GetAllNotificationsState {}

final class GetAllNotificationsLoaded extends GetAllNotificationsState {
  final List<NotificationEntity> notifications;
  const GetAllNotificationsLoaded(this.notifications);

  @override
  List<Object> get props => [notifications];
}

final class GetAllNotificationsError extends GetAllNotificationsState {
  final String message;
  const GetAllNotificationsError(this.message);

  @override
  List<Object> get props => [message];
}
