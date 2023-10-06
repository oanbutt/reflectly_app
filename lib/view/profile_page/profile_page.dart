import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reflectly/model/navigation_animation.dart';
import 'package:reflectly/view/constants.dart';
import 'package:reflectly/view/buttons.dart';
import 'package:reflectly/view/profile_edit_page/profile_edit_page.dart';
import 'package:reflectly/view/profile_page/profile_page_designs.dart';
import 'package:reflectly/view/quote_page.dart';
import 'package:delayed_display/delayed_display.dart';


class ProfilePage extends StatefulWidget{

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
@override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        color: kbackGroundcolor,
        child: Column(
            children: [
            Stack(
              children: [
                DelayedDisplay(
                  delay: Duration(milliseconds: 300),
                  child: AnimatedOpacity(
                    opacity: 1.0,
                    duration: Duration(seconds: 1),
                    child: Container(
                      width: 185,
                      height: 165,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              kstartGradient,
                              kmidGradient,
                              kendGradient
                            ]),
                      ),
                      child: Icon(
                        Icons.account_circle_outlined,
                        size: 100,
                        color: Colors.blueGrey.withOpacity(0.15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: DelayedDisplay(
                    delay: Duration(milliseconds: 400),
                    child: AnimatedOpacity(
                      opacity: 1.0,
                      duration: Duration(seconds: 1),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 17, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TopButtons(icon: Icon(Icons.edit,size: 30,), function: ()
                                    {
                                     Navigator.push(context, NavigationAnimate().createRoute(EditPage(),Offset(1, 0)));
                                       }),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 9),
                                      child: TopButtons(icon: Icon(Icons.close,size: 30,),function: (){
                                        Navigator.push(context,
                                           NavigationAnimate().createRoute(QuotePage(),Offset(-1.0, 0.0)));
                                        },)
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 120, top: 70),
                                child: Text(
                                  'Momi',
                                  style: TextStyle(
                                      fontSize: 26, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DelayedDisplay(
                    delay: Duration(milliseconds: 500),
                    child: AnimatedOpacity(
                      opacity: 1.0,
                        duration: Duration(seconds: 1),
                        child: ContainerDesign(title: 'Reflectly Basic', subtitle: 'ACTIVE PLAN')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: DelayedDisplay(
                      delay: Duration(milliseconds: 600),
                      child: AnimatedOpacity(
                        opacity: 1.0,
                        duration: Duration(seconds: 1),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(12),
                                  shadowColor: Colors.black.withOpacity(0.5),
                                  child: Container(
                                    height: 165,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            kstartGradient,
                                            kmidGradient,
                                            kendGradient
                                          ]),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 25),
                                            child: Icon(Icons.star_border_outlined,color: Colors.white,size: 25,),
                                          ),
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 28),
                                                child: Text('Rate',style: GoogleFonts.aBeeZee(fontSize: 48,color: Colors.grey.withOpacity(0.2),fontWeight: FontWeight.bold),),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 60),
                                                    child: Text('Rate Reflectly',style: GoogleFonts.aBeeZee(fontSize: 15,color: Colors.white),),
                                                  ),
                                                  Text('5-stars',style: GoogleFonts.aBeeZee(color: Colors.white),)
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Material(
                                  shadowColor: Colors.black.withOpacity(0.5),
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    height: 165,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 25),
                                            child: Icon(Icons.chat,color: Color(0xffF6B092),size: 25,),
                                          ),
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 30),
                                                child: Text('Support',style: GoogleFonts.aBeeZee(fontSize: 46,color: Colors.grey.withOpacity(0.2),fontWeight: FontWeight.bold),softWrap: false,),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 60),
                                                    child: Text('Contact',style: GoogleFonts.aBeeZee(fontSize: 15,color: Colors.black),),
                                                  ),
                                                  Text('support',style: GoogleFonts.aBeeZee(color: Colors.black),)
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        ]),
      ),


    );
  }
}
