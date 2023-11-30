import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reflectly/model/color_container_controller.dart';

import '../view/constants.dart';

CarouselController carouselController = CarouselController();

class ColorChangers extends StatelessWidget {
  ColorChangers({
    super.key,
    required this.newStart,
    required this.newMid,
    required this.newEnd,
    required this.index,
  });

  Color newStart;
  Color newMid;
  Color newEnd;
  int index;

  MyColorContainer colorController = Get.put(MyColorContainer());
  void centeredContainer(int index) {
    carouselController.animateToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await colorController.updateGradient(index);
        centeredContainer(index);
      },
      child: Container(
          width: 100,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    newStart,
                    newMid,
                    newEnd,
                  ]))),
    );
  }
}

// these containers are app color changing containers

class ColorContainer extends StatefulWidget {
  const ColorContainer({super.key});

  @override
  State<ColorContainer> createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer> {
  MyColorContainer colorController = Get.put(MyColorContainer());

  List<ColorChangers> color = [];

  @override
  void initState() {
    super.initState();
    color = [
      ColorChangers(
        newStart: kDarkPurple,
        newMid: kMidPurple,
        newEnd: kLightPurple,
        index: 0,
      ),
      ColorChangers(
        newStart: kDarkPeach,
        newMid: kMidPeach,
        newEnd: kLightPeach,
        index: 1,
      ),
      ColorChangers(
        newStart: kDarkPink,
        newMid: kMidPink,
        newEnd: kLightPink,
        index: 2,
      ),
      ColorChangers(
        newStart: kDarkGreen,
        newMid: kMidGreen,
        newEnd: kLightGreen,
        index: 3,
      ),
      ColorChangers(
        newStart: kDarkBlue,
        newMid: kMidBlue,
        newEnd: kLightBlue,
        index: 4,
      ),
      ColorChangers(
        newStart: kDarkAccent,
        newMid: kMidAccent,
        newEnd: kLightAccent,
        index: 5,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      shadowColor: Colors.black.withOpacity(0.7),
      borderRadius: BorderRadius.circular(12),
      child: Obx(() {
        return Container(
            width: double.infinity,
            height: 190,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      colorController.startColor.value,
                      colorController.midColor.value,
                      colorController.endColor.value
                    ])),
            child: CarouselSlider.builder(
                carouselController: carouselController,
                itemCount: 6,
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return color[itemIndex];
                },
                options: CarouselOptions(
                  animateToClosest: true,
                  aspectRatio: 4.5,
                  viewportFraction: 0.3,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.33,
                  scrollDirection: Axis.horizontal,
                )));
      }),
    );
  }
}
