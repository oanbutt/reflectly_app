import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class CategoriesText extends StatelessWidget {
  CategoriesText({required this.heading});

  late String heading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 37),
      child: Text(
        heading,
        style: GoogleFonts.acme(fontSize: 22, fontWeight: FontWeight.w500),
      ),
    );
  }
}

// containers in the category page in general

class CategoriesContainer extends StatefulWidget {
  CategoriesContainer({required this.title, required this.imagecode});

  late String title;
  late String imagecode;

  @override
  State<CategoriesContainer> createState() => _CategoriesContainerState();
}

class _CategoriesContainerState extends State<CategoriesContainer> {

  Container ticker(){
    return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),

        child: Icon(Icons.done,size: 20,color: kmidGradient,));
  }

  bool isTouched = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        shadowColor: Colors.black,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onTap: (){
              setState(() {
                isTouched = !isTouched;
                isTouched == true ? categorycontainer = kendGradient : categorycontainer = Colors.blue.withOpacity(0.2);

              });

            },
            child: Container(
                width: 160,
                height: 100,
                decoration: BoxDecoration(
                  color: categorycontainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(105.0, 40.0),
                      child: Transform.rotate(
                        angle: 18,
                        child: Container(
                            width: 63,
                            height: 67,
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(
                                    22
                                )),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(22),
                              child: Transform.rotate(
                                angle: 44.8,
                                child: Transform.scale(
                                  scaleX: 1.5,
                                  scaleY: 1.5,
                                  child: Image.asset(
                                    '${widget.imagecode}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                        ),
                      ),
                    ),
                    isTouched == true ? Transform.translate(

                        offset: Offset(117, 12),
                        child: ticker()): SizedBox(),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
