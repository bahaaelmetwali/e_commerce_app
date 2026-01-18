import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/presentation/cubits/auth/auth_state.dart';

import '../../../../../core/data/domain/use_cases/get_auth_mode_use_case.dart';
import '../../../../../core/data/domain/use_cases/get_token_use_case.dart';
import '../../../domain/use_cases/logged_as_guest_use_case.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final GetAuthModeUseCase getAuthModeUseCase;
  final GetTokenUseCase getTokenUseCase;
  final LoginAsGuestUseCase loginAsGuestUseCase;

  AuthCubit(
    this.getAuthModeUseCase,
    this.getTokenUseCase,
    this.loginAsGuestUseCase,
  ) : super(AuthInitial());

  Future<void> initApp() async {
    emit(AuthInitial());

    final authModeResult = await getAuthModeUseCase();
    authModeResult.fold((_) => emit(AuthUnauthenticated()), (authMode) async {
      if (authMode == 'guest') {
        emit(AuthGuest());
      } else {
        final tokenResult = await getTokenUseCase();
        tokenResult.fold((_) => emit(AuthUnauthenticated()), (tokenEntity) {
          final String? cachedToken = tokenEntity?.token;
          if (cachedToken != null && cachedToken.isNotEmpty) {
            emit(AuthAuthenticated());
          } else {
            emit(AuthUnauthenticated());
          }
        });
      }
    });
  }

  Future<void> loginAsGuest() async {
    final result = await loginAsGuestUseCase();
    result.fold((_) => emit(AuthUnauthenticated()), (_) => emit(AuthGuest()));
  }
}
