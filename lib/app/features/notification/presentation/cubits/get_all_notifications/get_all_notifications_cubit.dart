import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/notification_entity.dart';
import '../../../domain/use_cases/get_all_notifications_use_case.dart';

part 'get_all_notifications_state.dart';

@injectable
class GetAllNotificationsCubit extends Cubit<GetAllNotificationsState> {
  GetAllNotificationsCubit(this.getAllNotificationsUseCase)
    : super(GetAllNotificationsInitial());
  final GetAllNotificationsUseCase getAllNotificationsUseCase;

  Future<void> getAllNotifications() async {
    emit(GetAllNotificationsLoading());
    final result = await getAllNotificationsUseCase();

    result.fold(
      (failure) => emit(GetAllNotificationsError(failure.toString())),
      (notifications) => emit(GetAllNotificationsLoaded(notifications)),
    );
  }
}
