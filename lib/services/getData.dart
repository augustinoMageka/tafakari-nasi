import 'package:cloud_firestore/cloud_firestore.dart';

Future<dynamic> getDataByDate(String collectionName, DateTime date) async {
  try {
    String dateString = date.year.toString() +
        '-' +
        date.month.toString().padLeft(2, '0') +
        '-' +
        date.day.toString();
    final ref = FirebaseFirestore.instance.collection(collectionName);
    final query = ref.where('date', isEqualTo: dateString);
    dynamic res = await query.get();
    if (res.docs.isNotEmpty) {
      var item = res.docs.map((doc) => doc.data()).toList()[0];
      return item;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
  }
}

Future<dynamic> getData(String collectionName) async {
  try {
    final ref = FirebaseFirestore.instance.collection(collectionName);
    dynamic res = await ref.get();
    if (res.docs.isNotEmpty) {
      var items = res.docs.map((doc) => doc.data()).toList();
      return items;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
  }
}
