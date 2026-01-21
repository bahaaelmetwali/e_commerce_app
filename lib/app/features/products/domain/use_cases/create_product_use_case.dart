import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../repos/products_repo.dart';

@singleton
class AddProductUseCase {
  final ProductsRepo repository;
  AddProductUseCase(this.repository);
  Future<Either<Failure, Unit>> call(CreateProductParams params) async =>
      await repository.addProduct(params);
}

class CreateProductParams {
  final String name;
  final String description;
  final double price;
  final int countInStock;
  final String? category;
  final File image;
  final List<File>? images;

  CreateProductParams({
    required this.name,
    required this.description,
    required this.price,
    this.images,
    required this.countInStock,
    this.category,
    required this.image,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'countInStock': countInStock,
      'category': category,
      'image': MultipartFile.fromFileSync(image.path),
      'images': images!.map((e) => MultipartFile.fromFileSync(e.path)).toList(),
    };
  }
}
