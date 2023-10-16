import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomShareCard extends StatelessWidget {
  const CustomShareCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'image',
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        height: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
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
                child: const Text(
                  'Everything you can imagine is real.',
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Expanded(
                    child: Divider(
                      indent: 60.0,
                      endIndent: 13.0,
                      thickness: 0.8,
                      color: Colors.white,
                    ),
                  ),
                  DefaultTextStyle(
                    style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 15,
                        fontStyle: FontStyle.italic
                    ),
                    child: const Text(
                      'John Keats',
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      indent: 13.0,
                      endIndent: 60.0,
                      thickness: 0.8,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
