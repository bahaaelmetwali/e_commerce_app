part of 'privacy_cubit.dart';

sealed class PrivacyState extends Equatable {
  const PrivacyState();

  @override
  List<Object> get props => [];
}

final class PrivacyInitial extends PrivacyState {}
final class PrivacyLoading extends PrivacyState {}
final class PrivacyLoaded extends PrivacyState {
  final PrivacyEntity privacy;
  const PrivacyLoaded({required this.privacy});

  @override
  List<Object> get props => [privacy];
}

final class PrivacyError extends PrivacyState {
  final Failure failure;
  const PrivacyError({required this.failure});
  @override
  List<Object> get props => [failure];
}