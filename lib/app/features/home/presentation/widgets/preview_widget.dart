import 'package:mega/app/material/images/app_photo.dart';
import 'package:flutter/widgets.dart';

import '../../../../../constants/assets.dart';

class PreviewWidget extends StatefulWidget {
  const PreviewWidget({super.key});

  @override
  State<PreviewWidget> createState() => _PreviewWidgetState();
}

class _PreviewWidgetState extends State<PreviewWidget> {
  List<String> images = [
    Assets.imagesPrevTest1,
    Assets.imagesPrevTest2,
    Assets.imagesPrevTest3,
    Assets.imagesPrevTest4,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AppPhoto(
              path: images[index],
              width: 86,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
