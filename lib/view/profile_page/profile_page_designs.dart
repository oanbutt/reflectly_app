
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

// THIS IS THE CONTAINER THAT IS USED FOR TEXT AND UPGRADE BUTTON



class ContainerDesign extends StatelessWidget {
  ContainerDesign({required this.title, required this.subtitle});
  late String title;
  late String subtitle;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      shadowColor: Colors.black.withOpacity(0.7),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          // color:  Colors.blue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      '$title',
                      style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    '$subtitle',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              width: 90,
              height: 30,
              decoration: BoxDecoration(
                  color: Color(0xff9375CB),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Text(
                    'UPGRADE',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

// Rate and Support containers

class Rate extends StatelessWidget {
  const Rate({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 25),
                    child: Icon(
                      Icons.star_border_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 28),
                        child: Text(
                          'Rate',
                          style: GoogleFonts.aBeeZee(
                              fontSize: 48,
                              color: Colors.grey
                                  .withOpacity(0.2),
                              fontWeight:
                              FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(
                                top: 60),
                            child: Text(
                              'Rate Reflectly',
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            '5-stars',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white),
                          )
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
    );
  }
}

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
              // color: Colors.white,
              color: Colors.blue.withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 25),
                    child: Icon(
                      Icons.chat,
                      color: Color(0xffF6B092),
                      size: 25,
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30),
                        child: Text(
                          'Support',
                          style: GoogleFonts.aBeeZee(
                              fontSize: 46,
                              color: Colors.grey
                                  .withOpacity(0.2),
                              fontWeight:
                              FontWeight.bold),
                          softWrap: false,
                        ),
                      ),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(
                                top: 60),
                            child: Text(
                              'Contact',
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                          Text(
                            'support',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.black),
                          )
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
    );
  }
}

