import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reflectly/view/constants.dart';
import 'package:reflectly/view/profile_page/profile_page.dart';
import 'package:reflectly/view/quote_body.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

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
  }

  int index = 0;
  List pages = [
    QuoteBody(),
    ProfilePage(),
  ];
  Alignment alignlocation = Alignment(-0.51, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      });
                    },
                    child: SvgPicture.asset(
                      'images/quotation.svg',
                      width: 20,
                      height: 20,
                      colorFilter:
                          ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                      setState(() {
                        index = 1;
                        _controller.forward();
                      });
                    },
                    child: Icon(
                      Icons.supervisor_account,
                      size: 25,
                      color: Colors.grey,
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
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          )),
     floatingActionButton:  Padding(
        padding: const EdgeInsets.only(top: 45),
        child: FloatingActionButton(
          backgroundColor: kstartGradient,
          onPressed: () {},
          child: Icon(
            Icons.add,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pages[index],
    );
  }
}
