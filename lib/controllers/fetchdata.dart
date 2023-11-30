import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/quotelist_model.dart';

class FetchData extends GetxController {
  List<QuoteList> quotes = <QuoteList>[].obs;
  final gettingdata = true.obs;

  @override
  void onInit() {
    super.onInit();
    gettingdata.value = true; // Set to true when the controller is initialized
    // Any other initialization code you want to include here
  }

  final CollectionReference<Map<String, dynamic>> collectionref =
      FirebaseFirestore.instance.collection('quotes');

  Future<List<QuoteList>> fetchListFromFirestore(String category) async {
    try {
      gettingdata.value = true;
      final querySnapshot = await FirebaseFirestore.instance
          .collection('quotes')
          .where('title', isEqualTo: category)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final quotes = <QuoteList>[];
        for (var doc in querySnapshot.docs) {
          quotes.add(QuoteList.fromMap(doc.data()));
        }
        gettingdata.value = false;
        return quotes;
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching data: $e');
      gettingdata.value = false;
      return [];
    }
  }

  Future<List<QuoteList>> getFavList(List<String> favList) async {
    print('getFavLIst function called  : $favList');
    final querySnapshot =
        await collectionref.where('docId', whereIn: favList).get();
    print(querySnapshot);

    final List<QuoteList> quotes = querySnapshot.docs.map((doc) {
      QuoteList quote = QuoteList.fromMap(doc.data() as Map<String, dynamic>)
        ..docId = doc.id;
      return quote;
    }).toList();

    return quotes;
  }

  Future<void> fetchingFavList(var deviceId) async {
    gettingdata.value = true;

    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(deviceId)
        .get();

    if (querySnapshot.exists) {
      List<String> favList =
          List<String>.from(querySnapshot.data()?['favList'] ?? []);
      print(favList);
      // Wait for getFavList to complete
      final favListData = await getFavList(favList);

      // Update quotes based on the fetched favListData
      quotes = favListData;

      gettingdata.value = false;
    } else {
      print('empty');
    }
  }
}
