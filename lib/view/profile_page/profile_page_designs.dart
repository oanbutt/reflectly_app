
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
