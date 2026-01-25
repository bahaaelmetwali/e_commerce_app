import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/products/domain/repos/products_repo.dart';

import '../../../../core/errors/failure.dart';


@singleton
class UpdateProductUse {
  final ProductsRepo repository;
  UpdateProductUse(this.repository);
  Future<Either <Failure, Unit>> call(UpdateProductParams params) async {
    return await repository.updateProduct(params);
  }
}

class UpdateProductParams {
  final String productId;
  final String? name;
  final String? description;
  final double? price;
  final int? countInStock;
  final String? category;
  final File? image;
  final List<File>? images;

  UpdateProductParams({
    required this.productId,
    this.name,
    this.description,
    this.price,
    this.countInStock,
    this.category,
    this.image, this.images,
  });
  Map<String, dynamic> toMap() {
 return {
  "id": productId,
      'name': name,
      'description': description,
      'price': price,
      'countInStock': countInStock,
      'category': category,
      'image': image != null ? MultipartFile.fromFileSync(image!.path) : null,
      'images': images?.map((e) => MultipartFile.fromFileSync(e.path)).toList(),
    };  }
}
