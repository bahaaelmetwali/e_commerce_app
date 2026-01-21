import 'package:mega/app/features/products/domain/entities/owner_entity.dart';

class ProductEntity {
  final String id;
  final OwnerEntity owner;
  final String name;
  final String description;
  final int price;
  final String image;
  final List<String> images;
  final String category;
  final int countInStock;
  final double rating;
  final int numReviews;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final bool isFavorite;

  const ProductEntity({
    required this.id,
    required this.owner,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.images,
    required this.category,
    required this.countInStock,
    required this.rating,
    required this.numReviews,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.isFavorite,
  });
}
