import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FireStoreDataBase {
  List studentsList = [];
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("Products");

   Future getData() async {
    try {
      

      // to get data from all documents sequentially
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          studentsList.add(result.data());
        }
      });

      return studentsList;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }
  }
