import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:reflectly/model/navigation_animation.dart';
import 'package:reflectly/view/constants.dart';
import 'package:reflectly/view/quote_page.dart';
import 'package:reflectly/view/theme_page.dart';

import 'category_page/categories_page.dart';

class GeneralPage extends StatefulWidget {
  @override
  _GeneralPageState createState() => _GeneralPageState();
}

const double width = 245.0;
const double height = 43.0;
const double CategoriesALign = -1;
const double ThemeAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.grey;

class _GeneralPageState extends State<GeneralPage> {
  late double xAlign;

  late Color loginColor;

  late Color signInColor;

  @override
  void initState() {
    super.initState();
    xAlign = CategoriesALign;
    loginColor = selectedColor;
    signInColor = normalColor;
  }



  String title = 'Categories';

  // PageController pageView = PageController(initialPage: 0);
  // void _animateToPage(int page) {
  //   pageView.animateToPage(
  //     page,
  //     duration: Duration(seconds: 2),
  //     curve: Curves.fastLinearToSlowEaseIn,
  //   );
  // }

  int index = 0;
  List pages = [
    const CategoryPage(),
    const ThemePage(),
  ];

  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackGroundcolor,
        body:  SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25,top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
              children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context, NavigationAnimate().createRoute(const QuotePage(), const Offset(0, -1)));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
              ),
                  width: 47,
                  height: 47,
                  child: const Icon(Icons.close)),
          ),
            ],
          ),
                ),
      Stack(
          alignment: Alignment.topCenter,
          children: [
          Text('$title',style: TextStyle(fontSize: 50,fontWeight: FontWeight.w600,color: Colors.grey.withOpacity(0.1)),),
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.35),
                borderRadius: const BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    alignment: Alignment(xAlign,0),
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      width: width * 0.5,
                      height: height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              kstartGradient,
                              kmidGradient,
                              kendGradient
                            ]
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        xAlign = CategoriesALign;
                        loginColor = selectedColor;
                        signInColor = normalColor;

                        setState(() {
                          title = 'Categories';
                          selectedPage = 0;
                        });
                      });
                    },
                    child: Align(
                      alignment: const Alignment(-1, 0),
                      child: Container(
                        width: width * 0.5,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          'categories',
                          style: TextStyle(
                            color: loginColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        xAlign = ThemeAlign;
                        signInColor = selectedColor;

                        loginColor = normalColor;
                        setState(() {
                          title = 'Themes';
                          selectedPage = 1;
                        });
                      });
                    },
                    child: Align(
                      alignment: const Alignment(1.3, 0),
                      child: Container(
                        width: width * 0.6,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          'themes',
                          style: TextStyle(
                            color: signInColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ],
      ),

              selectedPage == 0 ? SlideInLeft(
                duration: const Duration(milliseconds: 350),
                  child:  pages[selectedPage]):
              SlideInRight(
                duration: const Duration(milliseconds: 350),
                  child: pages[selectedPage]),
    ]
    ),
        ),


    );
  }
}

