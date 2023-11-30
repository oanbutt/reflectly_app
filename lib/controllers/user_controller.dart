import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:reflectly/model/userModel.dart';
import 'package:reflectly/view/quote_body.dart';

class UserController extends GetxController {
  final favList = [].obs;

  Future<List<UserModel>> fetchUserData() async {
    final snapShot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentDevice!)
        .get();
    if (snapShot.exists) {
      final favList = snapShot.data()?['favList'];
      return favList;
    } else {
      return [];
    }
  }
}
