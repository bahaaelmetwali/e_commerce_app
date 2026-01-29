part of 'favorite_cubit.dart';

enum FavoriteStatus { initial, loading, success, error }

class FavoriteState extends Equatable {
  final FavoriteStatus status;
  final List<ProductEntity> favorites;
  final String? errorMessage;

  const FavoriteState({
    required this.status,
    required this.favorites,
    this.errorMessage,
  });

  factory FavoriteState.initial() {
    return const FavoriteState(
      status: FavoriteStatus.initial,
      favorites: [],
    );
  }

  FavoriteState copyWith({
    FavoriteStatus? status,
    List<ProductEntity>? favorites,
    String? errorMessage,
  }) {
    return FavoriteState(
      status: status ?? this.status,
      favorites: favorites ?? this.favorites,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, favorites, errorMessage];
}
