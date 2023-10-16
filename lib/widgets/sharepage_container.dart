import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../view/constants.dart';

class SharePageContainer extends StatelessWidget {
   SharePageContainer({super.key,required this.icon,required this.text});
  late FaIcon icon;
  late String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 120,
      decoration: BoxDecoration(
        boxShadow: [
          const BoxShadow(
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
          icon,
          SizedBox(height: 9,),
          Text(text,style: TextStyle(fontSize: 12,color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.bold),)
        ],
      ),

    );
  }
}
