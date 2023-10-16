import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../view/constants.dart';


class ColorChangers extends StatelessWidget {
  ColorChangers({super.key, required this.newStart,
    required this.newMid,
    required this.newEnd,
    required this.index,
    required this.onUpdate,
  });

  Color newStart;
  Color newMid;
  Color newEnd;
  int index;
  final VoidCallback onUpdate;

  void updateGradient(int selectedColorIndex) {
    if (selectedColorIndex == 0) {
      kstartGradient = kDarkPurple;
      kmidGradient = kMidPurple;
      kendGradient = kLightPurple;
    } else if (selectedColorIndex == 1) {
      kstartGradient = kDarkPeach;
      kmidGradient = kMidPeach;
      kendGradient = kLightPeach;
    } else if (selectedColorIndex == 2) {
      kstartGradient = kDarkPink;
      kmidGradient = kMidPink;
      kendGradient = kLightPink;
    } else if (selectedColorIndex == 3) {
      kstartGradient = kDarkGreen;
      kmidGradient = kMidGreen;
      kendGradient = kLightGreen;
    } else if (selectedColorIndex == 4) {
      kstartGradient = kDarkBlue;
      kmidGradient = kMidBlue;
      kendGradient = kLightBlue;
    } else if (selectedColorIndex == 5) {
      kstartGradient = kDarkAccent;
      kmidGradient = kMidAccent;
      kendGradient = kLightAccent;
    } else {
      kstartGradient = kDarkPurple;
      kmidGradient = kMidPurple;
      kendGradient = kLightPurple;
    }
    onUpdate();
  }


  int selectedcolorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        updateGradient(index);
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
  const ColorContainer({super.key,required this.onUpdate});

  final VoidCallback onUpdate;

  @override
  State<ColorContainer> createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer> {

  List<ColorChangers> color = [];

  @override
  void initState() {
    super.initState();
    color  =  [
      ColorChangers(
        newStart: kDarkPurple,
        newMid: kMidPurple,
        newEnd: kLightPurple,
        index: 0,
        onUpdate: () => setState(() {
          widget.onUpdate();

        }),
      ),
      ColorChangers(
        newStart: kDarkPeach,
        newMid: kMidPeach,
        newEnd: kLightPeach,
        index: 1,
        onUpdate: () => setState(() {

          widget.onUpdate();
        }),
      ),
      ColorChangers(
        newStart: kDarkPink,
        newMid: kMidPink,
        newEnd: kLightPink,
        index: 2,
        onUpdate: () => setState(() {
          widget.onUpdate();

        }),
      ),
      ColorChangers(
        newStart: kDarkGreen,
        newMid: kMidGreen,
        newEnd: kLightGreen,
        index: 3,
        onUpdate: () => setState(() {
          widget.onUpdate();

        }),
      ),
      ColorChangers(
        newStart: kDarkBlue,
        newMid: kMidBlue,
        newEnd: kLightBlue,
        index: 4,
        onUpdate: () => setState(() {
          widget.onUpdate();

        }),
      ),
      ColorChangers(
        newStart: kDarkAccent,
        newMid: kMidAccent,
        newEnd: kLightAccent,
        index: 5,
        onUpdate: () => setState(() {
          widget.onUpdate();

        }),
      ),
    ];

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      shadowColor: Colors.black.withOpacity(0.7),
      borderRadius: BorderRadius.circular(12),
      child: Container(
          width: double.infinity,
          height: 190,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [kstartGradient, kmidGradient, kendGradient])),
          child: CarouselSlider.builder(
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
              ))),
    );
  }
}
