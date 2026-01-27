import 'package:mega/app/features/products/domain/entities/product_entity.dart';
import 'package:mega/app/material/images/app_image_widget.dart';
import 'package:flutter/widgets.dart';

class PreviewWidget extends StatefulWidget {
  const PreviewWidget({super.key, this.product});
  final ProductEntity? product;
  @override
  State<PreviewWidget> createState() => _PreviewWidgetState();
}

class _PreviewWidgetState extends State<PreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: widget.product?.images.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AppImageWidget(
                path: widget.product?.images[index] ?? "",
                width: 86,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
