
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class SharePage extends StatefulWidget {
  const SharePage({super.key});

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackGroundcolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'image',
              child: Container(
                margin: EdgeInsets.only(bottom: 24),
                height: 320,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('images/photo7.jfif'),
                      fit: BoxFit.fill
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12,right: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DefaultTextStyle(
                        style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic
                        ),
                        child: Text(
                            'Everything you can imagine is real.',
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
                            children:  [
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
                                    fontStyle: FontStyle.italic
                                ),
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
                ),
    ),
            ),
            Stack(
              children: [
                Text('Share to',style: TextStyle(fontSize: 44,color: Colors.grey.withOpacity(0.2),fontWeight: FontWeight.w800),),
                Padding(
                  padding: const EdgeInsets.only(top: 41),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 80,
                        width: 120,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(-1, 2),
                                blurRadius: 4,
                                color: Color(0xffF6A192)
                              )
                            ],
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              kstartGradient,
                              kmidGradient,
                              kendGradient
                            ]
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.instagram,color: Colors.white,),
                            Padding(
                              padding: const EdgeInsets.only(top: 9),
                              child: Text('IG STORY',style: TextStyle(fontSize: 12,color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.bold),),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 120,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(-1, 2),
                                blurRadius: 4,
                                color: Color(0xffF6A192)
                            )
                          ],
                            gradient: LinearGradient(
                                colors: [
                                  kstartGradient,
                                  kmidGradient,
                                  kendGradient
                                ]
                            ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.floppyDisk,color: Colors.white,),
                            Padding(
                              padding: const EdgeInsets.only(top: 9),
                              child: Text('SAVE',style: TextStyle(fontSize: 12,color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.bold),),
                            )
                          ],
                        ),

                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: CupertinoButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('CANCEL',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey.withOpacity(0.6)),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
