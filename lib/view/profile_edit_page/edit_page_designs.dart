import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../buttons.dart';
import '../constants.dart';


// THIS IS THE LAST TEXT CONTAINERS IN THE EDIT PROFILE PAGE

class TextChangeContainer extends StatelessWidget {
  TextChangeContainer({super.key, required this.text});

  late String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      shadowColor: Colors.black.withOpacity(0.6),
      borderRadius: BorderRadius.circular(12),
      child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Text(
                  '$text',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.withOpacity(0.7)),
                ),
              ))),
    );
  }
}

// TEXTFIELD CONTAINER IN THE TOP OF EDIT PROFILE PAGE

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: 'Momi');
    return Material(
      elevation: 15,
      borderRadius: BorderRadius.circular(12),
      shadowColor: Colors.black.withOpacity(0.6),
      child: Container(
        width: double.infinity,
        height: 190,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2)),
              ),
              SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    TextField(
                      style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                        hintText: 'momi@gmail.com',
                        hintStyle: GoogleFonts.aBeeZee(
                            color: Colors.grey.withOpacity(0.4)),
                      ),
                    ),
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Icon(Icons.update)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// THIS DESIGN IS FOR ALL THE CONTAINERS WITH SWITCH BUTTON

class EditPageContainer extends StatefulWidget {
  final String title;
  final String subtitle;
  bool isSwitched;
  late final Icon icon;

  EditPageContainer({super.key,
    required this.title,
    required this.subtitle,
    required this.isSwitched,
    required this.icon,
  });

  @override
  State<EditPageContainer> createState() => _EditPageContainerState();
}

class _EditPageContainerState extends State<EditPageContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      shadowColor: Colors.black.withOpacity(0.6),
      borderRadius: BorderRadius.circular(12),
      child: ClipRRect(
        child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Positioned(
                    left: 190,
                    bottom: -14,
                    child: Icon(Icons.fingerprint_sharp,size: 145,color: Colors.grey.withOpacity(0.05),)),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              '${widget.title}',
                              style: GoogleFonts.aBeeZee(fontSize: 22),
                            ),
                          ),
                          Text(
                            '${widget.subtitle}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          value: widget.isSwitched,
                          onChanged: (value) {
                            setState(() {
                              widget.isSwitched = !widget.isSwitched;
                            });
                          },
                          activeTrackColor: kstartGradient,
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          thumbIcon: MaterialStateProperty.all(widget.icon),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}



class EditPageContainer2 extends StatefulWidget {
  final String title;
  final String subtitle;
  bool isSwitched;
  final Icon icon;

  EditPageContainer2({super.key,
    required this.title,
    required this.subtitle,
    required this.isSwitched,
    required this.icon,
  });

  @override
  State<EditPageContainer2> createState() => _EditPageContainer2State();
}

class _EditPageContainer2State extends State<EditPageContainer2> {

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      shadowColor: Colors.black.withOpacity(0.6),
      borderRadius: BorderRadius.circular(12),
      child: ClipRRect(
        child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Positioned(
                    left: 200,
                    bottom: -15,
                    child: Icon(Icons.lightbulb_outline,size: 145,color: Colors.grey.withOpacity(0.05),)),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              '${widget.title}',
                              style: GoogleFonts.aBeeZee(fontSize: 22),
                            ),
                          ),
                          Text(
                            '${widget.subtitle}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          value: widget.isSwitched,
                          onChanged: (value) {
                            setState(() {
                              widget.isSwitched = !widget.isSwitched;
                            });
                          },
                          activeTrackColor: kstartGradient,
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          thumbIcon: MaterialStateProperty.all(widget.icon),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}



// first double container
class DoubleContainer extends StatefulWidget {
  final String title;
  final String subtitle;
  bool isSwitched;
  final Icon icon;

  DoubleContainer({super.key,
    required this.title,
    required this.subtitle,
    required this.isSwitched,
    required this.icon,
  });

  @override
  State<DoubleContainer> createState() => _DoubleContainerState();
}

class _DoubleContainerState extends State<DoubleContainer> {
  double height = 100;
  double value = 50;
  bool showcontent = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      shadowColor: Colors.black.withOpacity(0.6),
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
            children: [
              Positioned(
                  left: 190,
                  bottom: -14,
                  child: Icon(Icons.notifications_none_outlined,size: 145,color: Colors.grey.withOpacity(0.05),)),

              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                '${widget.title}',
                                style: GoogleFonts.aBeeZee(fontSize: 22),
                              ),
                            ),
                            Text(
                              '${widget.subtitle}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        Transform.scale(
                          scale: 1.5,
                          child: Switch(
                            value: widget.isSwitched,
                            onChanged: (value) {
                              setState(() {
                                widget.isSwitched = !widget.isSwitched;
                                widget.isSwitched == true ? height = 170 : height = 100;
                                if(widget.isSwitched){
                                  Future.delayed(Duration(milliseconds: 200), (){
                                    setState(() {
                                      showcontent = true;
                                    });
                                  });
                                }else {
                                  setState(() {
                                    showcontent = false;
                                  });
                                }
                              });
                            },
                            activeTrackColor: kstartGradient,
                            thumbColor: MaterialStateProperty.all(Colors.white),
                            thumbIcon: MaterialStateProperty.all(widget.icon),
                          ),
                        )
                      ],
                    ),
                    widget.isSwitched
                        ? showcontent == true ? FadeIn(
                      delay: Duration(milliseconds: 0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    '9:00 PM',
                                    softWrap: true,
                                    style: GoogleFonts.aBeeZee(fontSize: 22),
                                  ),
                                ),
                                Text(
                                  'EVENING',
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 9),
                                activeTrackColor: kendGradient,
                                thumbColor: kstartGradient,
                                trackHeight: 2,
                              ),
                              child: SizedBox(
                                width: 160,
                                child: AnimatedOpacity(
                                  opacity: 1,
                                  duration: Duration(milliseconds: 500),
                                  child: Slider(
                                    value: value,
                                    min: 0,
                                    max: 100,
                                    divisions: 10,
                                    inactiveColor: kendGradient,
                                    onChanged: (double newValue) {
                                      setState(() {
                                        value = newValue;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ) : SizedBox()
                        : SizedBox(),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}


// second double container
class DoubleContainer2 extends StatefulWidget {
  final String title;
  final String subtitle;
  bool isSwitched;
  final Icon icon;

  DoubleContainer2({super.key,
    required this.title,
    required this.subtitle,
    required this.isSwitched,
    required this.icon,
  });

  @override
  State<DoubleContainer2> createState() => _DoubleContainer2State();
}

class _DoubleContainer2State extends State<DoubleContainer2> {
  double height = 100;
  double value = 50;
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  int number = 5;
  bool showcontent = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      shadowColor: Colors.black.withOpacity(0.6),
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
            children: [
              Positioned(
                  left: 190,
                  bottom: -14,
                  child: Icon(Icons.notifications_none_outlined,size: 145,color: Colors.grey.withOpacity(0.05),)),

              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                '${widget.title}',
                                style: GoogleFonts.aBeeZee(fontSize: 22),
                              ),
                            ),
                            Text(
                              '${widget.subtitle}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        Transform.scale(
                          scale: 1.5,
                          child: Switch(
                            value: widget.isSwitched,
                            onChanged: (value) {
                              setState(() {
                                widget.isSwitched = value;
                                height = widget.isSwitched ? 300 : 100;
                                if(widget.isSwitched){
                                  Future.delayed(Duration(milliseconds: 300), (){
                                    setState(() {
                                      showcontent = true;
                                    });
                                  });
                                }else {
                                  setState(() {
                                    showcontent = false;
                                  });
                                }
                              });
                            },
                            activeTrackColor: kstartGradient,
                            thumbColor: MaterialStateProperty.all(Colors.white),
                            thumbIcon: MaterialStateProperty.all(widget.icon),
                          ),
                        )
                      ],
                    ),
                    widget.isSwitched
                        ? showcontent == true ?Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      '9:00 PM',
                                      softWrap: true,
                                      style: GoogleFonts.aBeeZee(fontSize: 22),
                                    ),
                                  ),
                                  Text(
                                    'START AT',
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      '10:00 PM',
                                      softWrap: true,
                                      style: GoogleFonts.aBeeZee(fontSize: 22),
                                    ),
                                  ),
                                  Text(
                                    'END AT',
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        RangeSlider(
                          values: _currentRangeValues,
                          max: 100,
                          activeColor: kDarkPink,
                          inactiveColor: kLightPink,
                          onChanged: (RangeValues values) {
                            setState(() {
                              _currentRangeValues = values;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TopButtons(icon: Icon(Icons.remove), function: (){
                                setState(() {
                                  number --;
                                });
                              }),
                              Column(
                                children: [
                                  Text('${number}x',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                  Text('REMINDERS',style: TextStyle(fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.withOpacity(0.5),),),
                                ],
                              ),
                              TopButtons(icon: Icon(Icons.add), function: (){
                                setState(() {
                                  number ++;
                                });
                              }),
                            ],
                          ),
                        )
                      ],
                    ) : SizedBox()
                        : SizedBox(),
                  ],
                ),
              ),
            ]
        ),
      ),
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
  List<ColorChangers> color = [
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

class ColorChangers extends StatefulWidget {
  ColorChangers(
      {super.key, required this.newStart,
        required this.newMid,
        required this.newEnd,
        required this.index});

  late Color newStart;
  late Color newMid;
  late Color newEnd;
  int index = 0;

  @override
  State<ColorChangers> createState() => _ColorChangersState();
}

class _ColorChangersState extends State<ColorChangers> {
  void updateGradient(int selectedColorIndex) {
    if (selectedColorIndex == 0) {
      setState(() {
        kstartGradient = kDarkPurple;
        kmidGradient = kMidPurple;
        kendGradient = kLightPurple;
      });
    } else if (selectedColorIndex == 1) {
      setState(() {
        kstartGradient = kDarkPeach;
        kmidGradient = kMidPeach;
        kendGradient = kLightPeach;
      });
    } else if (selectedColorIndex == 2) {
      setState(() {
        kstartGradient = kDarkPink;
        kmidGradient = kMidPink;
        kendGradient = kLightPink;
      });
    } else if (selectedColorIndex == 3) {
      setState(() {
        kstartGradient = kDarkGreen;
        kmidGradient = kMidGreen;
        kendGradient = kLightGreen;
      });
    } else if (selectedColorIndex == 4) {
      setState(() {
        kstartGradient = kDarkBlue;
        kmidGradient = kMidBlue;
        kendGradient = kLightBlue;
      });
    } else if (selectedColorIndex == 5) {
      setState(() {
        kstartGradient = kDarkAccent;
        kmidGradient = kMidAccent;
        kendGradient = kLightAccent;
      });
    } else {
      setState(() {
        kstartGradient = kDarkPurple;
        kmidGradient = kMidPurple;
        kendGradient = kLightPurple;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          int selectedColor = widget.index;
          updateGradient(selectedColor);
        });
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
                    widget.newStart,
                    widget.newMid,
                    widget.newEnd,
                  ]))),
    );
  }
}

