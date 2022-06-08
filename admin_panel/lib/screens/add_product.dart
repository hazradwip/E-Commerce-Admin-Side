import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:percent_indicator/linear_percent_indicator.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _HomeState();
}

class _HomeState extends State<AddProduct> {
  final _pName = TextEditingController();
  final _pDescription = TextEditingController();
  final _pPrice = TextEditingController();
  final _pQuantity = TextEditingController();
  final _pCategory = TextEditingController();
  String? downloadURL;
  late String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text("Admin Panel"),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
            child: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _pName,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Product Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _pDescription,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Product Description',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _pPrice,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Product Price',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _pQuantity,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Product Quantity',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _pCategory,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Product Category',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: const Text(
                "Upload Product Image",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                upload();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 30, 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: const Text(
                "Upload Product Details",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              onPressed: () async {
                imageUrl = downloadURL = await FirebaseStorage.instance
                    .ref()
                    .child(_pName.text)
                    .getDownloadURL().whenComplete(() => notifier("Image Uploaded"));
                    
                      storeData(_pName.text, _pDescription.text, _pPrice.text,
                    _pCategory.text, _pQuantity.text, imageUrl);
              },
            ),
          ),
        ])),
      ),
    );
  }

  Future upload() async {
    ImagePicker _image = ImagePicker();

    try {
      XFile? img = await _image.pickImage(source: ImageSource.gallery);
      File image = File(img!.path);
      Reference str = FirebaseStorage.instance.ref();
      str.child(_pName.text).putFile(image);
    } catch (e) {
      notifier(e);
    }
  }

  /*Future getData(String pName) async {
    try {
      await downloadURLExample(pName)
          .whenComplete(() => notifier("Image Uploaded"));
      return downloadURL;
    } catch (e) {
      notifier(e);
    }
  }*/

 /* Future downloadURLExample(String name) async {
    downloadURL =
        await FirebaseStorage.instance.ref().child(name).getDownloadURL();
  }*/

  void notifier(e) {
    Fluttertoast.showToast(
      msg: e, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      // duration
    );
  }

  Future storeData(String name, String desc, String price, String category,
      String quantity, String imageUrl) async {
    final us = FirebaseFirestore.instance.collection("Products").doc();

    String ref = us.id;
    await us.set({
      'name': name,
      'price': price,
      'description': desc,
      'category': category,
      'quantity': quantity,
      'url': imageUrl,
      'uid': ref
    }).whenComplete(() => notifier('Product Added'));
  }
}
