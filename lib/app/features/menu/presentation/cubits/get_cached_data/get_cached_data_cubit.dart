import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/data/domain/use_cases/get_user_info_use_case.dart';

import '../../../../../core/data/domain/entities/cached_user_entity.dart';

part 'get_cached_data_state.dart';

@injectable
class GetCachedDataCubit extends Cubit<GetCachedDataState> {
  GetCachedDataCubit(this.getUserInfoUseCase) : super(GetCachedDataInitial());
  final GetUserInfoUseCase getUserInfoUseCase;
  Future<void> getCachedData() async {
    final result = await getUserInfoUseCase();

    result.fold((failure) => emit(GetCachedDataError(failure.toString())), (
      cachedUserEntity,
    ) {
      final cachedUser = cachedUserEntity;
      if (cachedUser == null) {
        emit(GetCachedDataEmpty());
        return;
      }
      emit(GetCachedDataLoaded(cachedUser));
    });
  }
}
