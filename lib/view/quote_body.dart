import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reflectly/model/navigation_animation.dart';
import 'package:reflectly/view/general_page.dart';
import 'package:reflectly/view/share_page.dart';

class QuoteBody extends StatefulWidget {
  @override
  State<QuoteBody> createState() => _QuoteBodyState();
}

class _QuoteBodyState extends State<QuoteBody>{

  IconData icon = FontAwesomeIcons.heart;
  IconData icon2 = FontAwesomeIcons.solidHeart;

  bool isTapped = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'image',
            child: Container(
                child: Stack(
              children: [
                  BlurHash(
                  hash: 'L=IzkvodWCf6}?jYWCay#ljZa|f7',
                  image: 'https://images.unsplash.com/photo-1475113548554-5a36f1f523d6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjF8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
                  imageFit: BoxFit.cover,
                  duration: Duration(seconds: 3),
                  ),
                Padding(
                  padding: EdgeInsets.only(left: 35, right: 35),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: double.infinity,
                      scrollDirection: Axis.vertical,
                    ),
                    items: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          DefaultTextStyle(
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white,
                                fontSize: 20,
                                fontStyle: FontStyle.italic),
                            child: Text(
                              'Everything you can imagine is real',
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Expanded(
                                  child: Divider(
                                    indent: 60.0,
                                    endIndent: 13.0,
                                    thickness: 1.5,
                                    color: Colors.white,
                                  ),
                                ),
                                DefaultTextStyle(
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic),
                                  child: Text(
                                    'John Keats',
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    indent: 13.0,
                                    endIndent: 60.0,
                                    thickness: 1.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 110, left: 35, right: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 70),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, NavigationAnimate().createRoute(GeneralPage(), Offset(0.0, 1.0)));
                        },
                        child: Container(
                          height: 45,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                'images/dashboard.svg',
                                width: 26,
                                height: 26,
                                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                              Text(
                                'General',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTapped = !isTapped;
                        });
                      },
                      child: Container(
                          height: 45,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: FaIcon(
                            isTapped == false ? icon : icon2,
                            color: Colors.white.withOpacity(0.7),
                          ))),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SharePage()));
                      },
                      child: Container(
                        height: 45,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: FaIcon(
                          FontAwesomeIcons.shareFromSquare,
                          color: Colors.white.withOpacity(0.7),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
