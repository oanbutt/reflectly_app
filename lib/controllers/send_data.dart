// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../model/quotelist_model.dart';
//
// class SendingData {
//   Future<void> uploadDataToFirestore() async {
// List<Map<String, dynamic>> dataToUpload =
//     quoteList.map((model) => model.toMap()).toList();
//     final collection = FirebaseFirestore.instance.collection('quotes');
//
//     dataToUpload.forEach((map) async {
//       await collection.add(map).then((value) {
//         collection.doc(value.id).update({
//           'docId': value.id,
//         });
//       });
//     });
//   }
// }
