import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:reflectly/model/color_container_controller.dart';

import '../view/constants.dart';

class SharePageContainer extends StatelessWidget {
   SharePageContainer({super.key,required this.icon,required this.text,required this.takeShot});
  late FaIcon icon;
  late String text;
  final VoidCallback takeShot;

  MyColorContainer colorController = Get.put(MyColorContainer());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: takeShot,
        child: Container(
          height: 80,
          width: 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  colorController.startColor.value,
                  colorController.midColor.value,
                  colorController.endColor.value
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

        ),
      );
    });
  }
}
