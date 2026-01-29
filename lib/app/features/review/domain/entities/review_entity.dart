import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final String id;
  final UserEntity user;
  final String comment;
  final int rating;
  final DateTime date;

  const ReviewEntity({
    required this.id,
    required this.user,
    required this.comment,
    required this.rating,
    required this.date,
  });

  @override
  List<Object?> get props => [id, user, comment, rating, date];
}

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String image;

  const UserEntity({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];
}
