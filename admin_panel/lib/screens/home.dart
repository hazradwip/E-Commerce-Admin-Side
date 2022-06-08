import 'package:admin_panel/screens/add_product.dart';
import 'package:admin_panel/screens/add_users.dart';
import 'package:admin_panel/screens/delete_products.dart';
import 'package:admin_panel/screens/delete_users.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Admin Panel"),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: ListView(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddUsers()));
                },
                child: Container(
                  height: 50,
                  child: const Center(
                      child: Text(
                    'Add Users',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DeleteUsers()));
                },
                child: Container(
                  height: 50,
                  child: const Center(
                      child: Text(
                    'Delete Users',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddProduct()));
                },
                child: Container(
                  height: 50,
                  child: const Center(
                      child: Text(
                    'Add Products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DelProducts()));
                },
                child: Container(
                  height: 50,
                  child: const Center(
                    child: Text(
                      'Delete Products',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
