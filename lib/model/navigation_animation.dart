import 'package:flutter/material.dart';

class NavigationAnimate {

  Route createRoute(dynamic pageName, Offset status) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (context, animation, secondaryAnimation) =>  pageName,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
         var begin = status;
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: animation.drive(tween),
            child: child,
          ),
        );
      },
    );
  }
}