part of 'about_app_cubit.dart';

sealed class AboutAppState extends Equatable {
  const AboutAppState();

  @override
  List<Object> get props => [];
}

final class AboutAppInitial extends AboutAppState {}

final class AboutAppLoading extends AboutAppState {}

final class AboutAppLoaded extends AboutAppState {
  final AboutAppEntity aboutAppEntity;
  const AboutAppLoaded({required this.aboutAppEntity});

  @override
  List<Object> get props => [aboutAppEntity];
}

final class AboutAppError extends AboutAppState {
  final Failure failure;
  const AboutAppError({required this.failure});
  @override
  List<Object> get props => [failure];
}
