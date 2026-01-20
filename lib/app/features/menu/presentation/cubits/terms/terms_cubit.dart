import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/errors/failure.dart';
import 'package:mega/app/features/menu/domain/use_cases/get_terms_use_case.dart';

import '../../../domain/entities/terms_entity.dart';

part 'terms_state.dart';

@injectable
class TermsCubit extends Cubit<TermsState> {
  TermsCubit(this.getTermsUseCase) : super(TermsInitial());
final GetTermsUseCase getTermsUseCase;

  Future<void> loadTerms() async {
    emit(TermsLoading());
    final result = await getTermsUseCase.call();
    result.fold(
      (failure) => emit(TermsError(failure: failure)),
      (terms) => emit(TermsLoaded(terms: terms)),
    );
  }
}
