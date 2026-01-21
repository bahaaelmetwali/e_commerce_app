import 'package:mega/app/features/products/domain/entities/owner_entity.dart';

class Owner {
  final String id;
  final String name;
  final String image;
  final double rate;

  Owner({
    required this.id,
    required this.name,
    required this.image,
    required this.rate,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      rate: (json['rate'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image, 'rate': rate};
  }
  OwnerEntity toEntity() {
    return OwnerEntity(
      id: id,
      name: name,
      image: image,
      rate: rate,
    );
  }
}
