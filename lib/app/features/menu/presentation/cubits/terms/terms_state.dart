part of 'terms_cubit.dart';

sealed class TermsState extends Equatable {
  const TermsState();

  @override
  List<Object> get props => [];
}

final class TermsInitial extends TermsState {}

final class TermsLoading extends TermsState {}

final class TermsLoaded extends TermsState {
  final TermsEntity terms;
  const TermsLoaded({required this.terms});

  @override
  List<Object> get props => [terms];
}

final class TermsError extends TermsState {
  final Failure failure;
  const TermsError({required this.failure});

  @override
  List<Object> get props => [failure];
}
