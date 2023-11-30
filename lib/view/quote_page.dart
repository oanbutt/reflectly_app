import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reflectly/model/color_container_controller.dart';
import 'package:reflectly/view/profile_page/profile_page.dart';
import 'package:reflectly/view/quote_body.dart';

import '../controllers/notification_service.dart';
import '../model/image_picker_controller.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  bool isTrue = false;
  late AnimationController animationController;
  bool animation = true;
  void isChecked() {
    setState(
          () {
        if (isTrue) {
          Future.delayed(
            const Duration(milliseconds: 200),
                () {
              setState(() {
                isTrue = false;
              });
            },
          );
        } else {
          isTrue = true;
        }
      },
    );
  }

  void isCrossed () {
    setState(() {
      Future.delayed(
        const Duration(milliseconds: 200),
            () {
          setState(() {
            isTrue = false;
          });
        },
      );
    });
  }

  void animateIcon() {
    setState(() {
      animation ? animationController.forward() : animationController.reverse();
      animation = !animation;
    });
  }


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    _animation = AlignmentTween(
      begin: Alignment(-0.51, 0),
      end: Alignment(0.51, 0),
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
      reverseDuration: const Duration(
        milliseconds: 200,
      ),
    );

  }



  int index = 0;
  List pages = [
    QuoteBody(),
    ProfilePage(),
  ];
  Alignment alignlocation = Alignment(-0.51, 0);

  MyColorContainer colorController = Get.put(MyColorContainer());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTrue = false;
        });
      },
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: Stack(
          children: [
            Positioned(
              bottom: 0,left: 0,right: 0,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: context.isDarkMode ? Color(0xff282828) : Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              index = 0;
                              _controller.reverse();
                              isCrossed();
                              animateIcon();

                            });
                          },
                          child: SvgPicture.asset(
                            'images/quotation.svg',
                            width: 20,
                            height: 20,
                            colorFilter:
                                ColorFilter.mode(context.isDarkMode ? Colors.white : Colors.black, BlendMode.srcIn),
                          ),
                        ),

                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              index = 1;
                              _controller.forward();
                              isCrossed();
                              animateIcon();

                            });
                          },
                          child: Icon(
                            Icons.supervisor_account,
                            size: 25,
                            color: context.isDarkMode ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: _animation.value,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: context.isDarkMode ? Colors.white : Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                )),
            ),
            Positioned(
              bottom: 15,left: 93,
              child: SizedBox(
                height: 193.61111111111111,
                width: 170,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          isChecked();
                          animateIcon();
                        },
                        child: Obx(() {
                          return Container(
                            alignment: Alignment.center,
                            height: 170 / 3,
                            width: 170 / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  colors: [
                                    colorController.startColor.value,
                                    colorController.midColor.value,
                                    colorController.endColor.value
                                  ]
                              ),
                            ),
                            child: const Hero(
                              tag: 'HeroButton',
                              child: ImageIcon(
                                AssetImage("images/plus.png"),
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          );
                        })
                      ),
                    ),
                    if (isTrue)
                      FadeInUp(
                        from: 0,
                        duration: const Duration(milliseconds: 100),
                        child: Stack(
                          children: [
                             Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 193.61111111111111,
                                width: 170,
                                child: CustomContainerClipper(),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () {
                                  isChecked();
                                  animateIcon();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 170 / 3,
                                  width: 170 / 3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.transparent),
                                  child: RotationTransition(
                                    turns: Tween(begin: 0.0, end: 0.38)
                                        .animate(animationController),
                                    child: const ImageIcon(
                                      AssetImage("images/plus.png"),
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),

          ],
        ),
        body: pages[index],
      ),
    );
  }
}


class CustomContainerClipper extends StatelessWidget {
   CustomContainerClipper({
    super.key,
  });

  MyColorContainer colorController = Get.put(MyColorContainer());
   MyImagePicker controller = Get.put(MyImagePicker());

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipCliper(),
      child: Obx(() {
        return Container(
          height: 193.61111111111111,
          width: 170,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    colorController.startColor.value,
                    colorController.midColor.value,
                    colorController.endColor.value
                  ]
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 17,left: 10,right: 10,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Mood Check-in',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),),
                    Container(
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.mood,color: Colors.white,size: 20,),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Voice Note',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white)),
                    Container(
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.graphic_eq,color: Colors.white,size: 20,),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7,bottom: 10),
                child: GestureDetector(
                  onTap: (){
                    Get.defaultDialog(
                      backgroundColor: colorController.endColor.value,
                        title: '',
                        content: Column(
                          children: [
                            TextButton(onPressed: (){
                              controller.getImagefromgallery();
                            }, child: Text('Choose from gallery',style: TextStyle(color: Colors.white),)),
                            TextButton(onPressed: (){
                              controller.getImagefromcamera();
                            }, child: Text('Take photo',style: TextStyle(color: Colors.white),)),

                          ],
                        )
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Add Photo',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white)),
                      Container(
                        width: 27,
                        height: 27,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.add_a_photo_outlined,color: Colors.white,size: 18,),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      })
    );
  }
}

class ClipCliper extends CustomClipper<Path> {
  @override
  Path getClip(size) {
    double curve = size.width / 8;
    double smallCurve = size.width / 10;
    double difference = (size.width / 3) / 2;
    double height = (size.width + difference / 5) - difference;
    double totalHeight = size.width + difference / 1.2;
    double width = size.width;
    // print(curve);
    // print(difference);
    // print(width);
    // print("height$height");
    // print(totalHeight);

    Path path = Path();
    //Point(a)
    path.lineTo(0, 0);
    //Point(b)
    path.lineTo(0, height - curve);
    path.quadraticBezierTo(0, height, 0 + curve, height);
    //Point(c)
    path.lineTo((width / 3) - smallCurve, height);
    path.quadraticBezierTo(
        (width / 3), height, (width / 3), height + smallCurve);
    //Point(d)
    path.lineTo((width / 3), totalHeight - curve);
    path.quadraticBezierTo(
        (width / 3), totalHeight, (width / 3) + curve, totalHeight);
    //Point(e)
    path.lineTo((width - (width / 3)) - curve, totalHeight);
    path.quadraticBezierTo(width - (width / 3), totalHeight,
        width - (width / 3), totalHeight - curve);
    //Point(f)
    path.lineTo(width - (width / 3), height + smallCurve);
    path.quadraticBezierTo(
        width - (width / 3), height, width - (width / 3) + smallCurve, height);
    //Point(g)
    path.lineTo(width - curve, height);
    path.quadraticBezierTo(width, height, width, height - curve);
    //Point(h)
    path.lineTo(width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}