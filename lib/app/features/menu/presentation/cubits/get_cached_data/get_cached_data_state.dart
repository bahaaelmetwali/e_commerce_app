part of 'get_cached_data_cubit.dart';

sealed class GetCachedDataState extends Equatable {
  const GetCachedDataState();

  @override
  List<Object> get props => [];
}

final class GetCachedDataInitial extends GetCachedDataState {}
final class GetCachedDataLoading extends GetCachedDataState {}

final class GetCachedDataLoaded extends GetCachedDataState {
  final CachedUserEntity cachedData;
  const GetCachedDataLoaded(this.cachedData);

  @override
  List<Object> get props => [cachedData];
}
final class GetCachedDataError extends GetCachedDataState {
  final String message;
  const GetCachedDataError(this.message);

  @override
  List<Object> get props => [message];
}
final class GetCachedDataEmpty extends GetCachedDataState {}