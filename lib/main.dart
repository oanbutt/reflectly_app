import 'package:flutter/material.dart';
import 'package:reflectly/view/constants.dart';
import 'package:reflectly/view/quote_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: QuotePage(),
      ),
    );
  }
}
