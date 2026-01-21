import 'package:mega/app/features/products/data/models/owner_model.dart';
import 'package:mega/app/features/products/domain/entities/product_entity.dart';

import '../../domain/entities/owner_entity.dart';

class ProductModel {
  final String id;
  final Owner owner;
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
  bool isFavorite;

  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      owner: Owner.fromJson(json['owner'] ?? {}),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      image: json['image'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      category: json['category'] ?? '',
      countInStock: json['countInStock'] ?? 0,
      rating: (json['rating'] ?? 0).toDouble(),
      numReviews: json['numReviews'] ?? 0,
      createdAt: DateTime.parse(
        json['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
      updatedAt: DateTime.parse(
        json['updatedAt'] ?? DateTime.now().toIso8601String(),
      ),
      v: json['__v'] ?? 0,
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'owner': owner.toJson(),
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'images': images,
      'category': category,
      'countInStock': countInStock,
      'rating': rating,
      'numReviews': numReviews,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
      'isFavorite': isFavorite,
    };
  }
ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      owner: OwnerEntity(
        id: owner.id,
        name: owner.name,
        image: owner.image,
        rate: owner.rate,
      ),
      name: name,
      description: description,
      price: price,
      image: image,
      images: images,
      category: category,
      countInStock: countInStock,
      rating: rating,
      numReviews: numReviews,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
      isFavorite: isFavorite,
    );
  }
  }
