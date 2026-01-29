part of 'get_reviews_cubit.dart';

sealed class GetReviewsState extends Equatable {
  const GetReviewsState();

  @override
  List<Object> get props => [];
}

final class GetReviewsInitial extends GetReviewsState {}
final class GetReviewsLoading extends GetReviewsState {}
final class GetReviewsSuccess extends GetReviewsState {
  final List<ReviewEntity> reviews;
  const GetReviewsSuccess({required this.reviews});

  @override
  List<Object> get props => [reviews];
}
final class GetReviewsError extends GetReviewsState {
  final String message;
  const GetReviewsError({required this.message});
}
