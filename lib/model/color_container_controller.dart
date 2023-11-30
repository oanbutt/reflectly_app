import 'dart:ui';

import 'package:get/get.dart';
import 'package:reflectly/view/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyColorContainer extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadColor();
  }

  Rx<dynamic> startColor = kstartGradient.obs;
  Rx<dynamic> midColor = kmidGradient.obs;
  Rx<dynamic> endColor = kendGradient.obs;

  Future<void> saveColor() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('startColor', startColor.value.value.toRadixString(16));
    prefs.setString('midColor', midColor.value.value.toRadixString(16));
    prefs.setString('endColor', endColor.value.value.toRadixString(16));
  }

  Future<void> loadColor() async {
    final prefs = await SharedPreferences.getInstance();
    startColor.value =
        Color(int.parse(prefs.getString('startColor')!, radix: 16));
    midColor.value = Color(int.parse(prefs.getString('midColor')!, radix: 16));
    endColor.value = Color(int.parse(prefs.getString('endColor')!, radix: 16));
  }

  updateGradient(int selectedColorIndex) {
    if (selectedColorIndex == 0) {
      startColor.value = kDarkPurple;
      midColor.value = kMidPurple;
      endColor.value = kLightPurple;
    } else if (selectedColorIndex == 1) {
      startColor.value = kDarkPeach;
      midColor.value = kMidPeach;
      endColor.value = kLightPeach;
    } else if (selectedColorIndex == 2) {
      startColor.value = kDarkPink;
      midColor.value = kMidPink;
      endColor.value = kLightPink;
    } else if (selectedColorIndex == 3) {
      startColor.value = kDarkGreen;
      midColor.value = kMidGreen;
      endColor.value = kLightGreen;
    } else if (selectedColorIndex == 4) {
      startColor.value = kDarkBlue;
      midColor.value = kMidBlue;
      endColor.value = kLightBlue;
    } else if (selectedColorIndex == 5) {
      startColor.value = kDarkAccent;
      midColor.value = kMidAccent;
      endColor.value = kLightAccent;
    } else {
      startColor.value = kDarkPurple;
      midColor.value = kMidPurple;
      endColor.value = kLightPurple;
    }
    saveColor();
  }
}
