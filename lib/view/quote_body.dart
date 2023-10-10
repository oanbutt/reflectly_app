import 'package:cached_network_image/cached_network_image.dart';
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

class _QuoteBodyState extends State<QuoteBody> with TickerProviderStateMixin{

  late AnimationController controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 300));
  late Animation<double> animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

  IconData icon = FontAwesomeIcons.heart;
  IconData icon2 = FontAwesomeIcons.solidHeart;

  bool isTapped = false;
  int currentIndex = 0;
  List<String> imagesList = [
    'https://images.unsplash.com/photo-1433086966358-54859d0ed716?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bmF0dXJlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1426604966848-d7adac402bff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bmF0dXJlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
    'https://plus.unsplash.com/premium_photo-1673264933212-d78737f38e48?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1475924156734-496f6cac6ec1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1475113548554-5a36f1f523d6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1470252649378-9c29740c9fa8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjF8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60''https://images.unsplash.com/photo-1455218873509-8097305ee378?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1444464666168-49d633b86797?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://plus.unsplash.com/premium_photo-1664547606956-22749d0e0d77?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzd8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://plus.unsplash.com/premium_photo-1673002094173-b16f2b946780?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTl8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1536431311719-398b6704d4cc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjJ8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1499002238440-d264edd596ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODB8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1517928260182-5688aead3066?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bmF0dXJlJTIwaWNlJTIwbmlnaHR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1501862700950-18382cd41497?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG5hdHVyZSUyMHN0YXJzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'image',
            child: Stack(
              fit: StackFit.expand,
              children: [

            CachedNetworkImage(
              imageUrl: imagesList[currentIndex],
            fit: BoxFit.cover,
            placeholder: (context, url){
              return const BlurHash(hash: 'L=IzkvodWCf6}?jYWCay#ljZa|f7',duration: Duration(seconds: 3),);
            },
              fadeInCurve: Curves.easeOutExpo,
              fadeInDuration: const Duration(milliseconds: 550),
              fadeOutCurve: Curves.easeOut,
              fadeOutDuration: const Duration(milliseconds: 550),
              useOldImageOnUrlChange: true,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index,reason){
                     setState(() {
                       currentIndex = index;
                     });
                  },
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
                        child: const Text(
                          'Everything you can imagine is real',
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Expanded(
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
                              child: const Text(
                                'John Keats',
                              ),
                            ),
                            const Expanded(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DefaultTextStyle(
                        style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                        child: const Text(
                          'Everything you can imagine is real',
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Expanded(
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
                              child: const Text(
                                'John Keats',
                              ),
                            ),
                            const Expanded(
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
            ),
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
                          Navigator.push(context, NavigationAnimate().createRoute(GeneralPage(), const Offset(0.0, 1.0)));
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
                                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                              const Text(
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
                                builder: (context) => const SharePage()));
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
