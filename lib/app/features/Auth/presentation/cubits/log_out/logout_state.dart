part of 'logout_cubit.dart';

sealed class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

final class LogoutInitial extends LogoutState {}
final class LogoutLoading extends LogoutState {}
final class LogoutSuccess extends LogoutState {}
final class LogoutFailure extends LogoutState {
  final Failure failure ;
  const LogoutFailure(this.failure);  
@override
  List<Object> get props => [failure];
}
