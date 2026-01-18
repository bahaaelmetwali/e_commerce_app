import 'package:equatable/equatable.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}
class AuthAuthenticated extends AuthState {}
class AuthGuest extends AuthState {}
class AuthUnauthenticated extends AuthState {}
