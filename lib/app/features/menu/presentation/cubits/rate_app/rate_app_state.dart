part of 'rate_app_cubit.dart';

sealed class RateAppState extends Equatable {
  const RateAppState();

  @override
  List<Object> get props => [];
}

final class RateAppInitial extends RateAppState {}

final class RateAppLoading extends RateAppState {}

final class RateAppSuccess extends RateAppState {}

final class RateAppError extends RateAppState {
  final Failure failure;
  const RateAppError({required this.failure});
  @override
  List<Object> get props => [failure];
}
