import 'dart:ui';
import 'package:flutter/material.dart';

import '../model/color_function.dart';


// THIS DESIGN IS USED FOR ALL THE NAVIGATING BUTTONS AT THE TOP

class TopButtons extends StatelessWidget {
  TopButtons({required this.icon, required this.function});

  late Icon icon;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(12),
      child: GestureDetector(
        onTap: function,
        child: Container(
            height: 43,
            width: 43,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: icon),
      ),
    );
  }
}




