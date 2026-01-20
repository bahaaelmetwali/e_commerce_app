import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';


import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/privacy_entity.dart';
import '../../../domain/use_cases/get_privacy_use_case.dart';

part 'privacy_state.dart';

@injectable
class PrivacyCubit extends Cubit<PrivacyState> {
  PrivacyCubit(this.getPrivacyUseCase) : super(PrivacyInitial());
  final GetPrivacyUseCase getPrivacyUseCase;
  Future<void> loadPrivacy() async {
    emit(PrivacyLoading());
    final result = await getPrivacyUseCase.call();
    result.fold(
      (failure) => emit(PrivacyError(failure: failure)),
      (privacy) => emit(PrivacyLoaded(privacy: privacy)),
    );
  }}
