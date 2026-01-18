

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/assets.dart';
import '../../../../material/images/app_image_widget.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int currentIndex = 0;

  final List<String> imgList = [
    Assets.imagesTest1,
    Assets.imagesTest2,
    Assets.imagesTest3,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: imgList
              .map(
                (item) => SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AppImageWidget(path: item, fit: BoxFit.fill),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: 150,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,

            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Positioned(
          left: 0,
          bottom: 10,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imgList.length, (index) {
              final isActive = index == currentIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 14 : 12,
                height: isActive ? 14 : 12,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isActive ? Colors.white : Colors.transparent,
                  ),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: isActive ? 14 : 9,
                  height: isActive ? 14 : 9,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
