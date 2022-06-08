import 'package:admin_panel/database.dart';
import 'package:flutter/material.dart';

class DelProducts extends StatefulWidget {
  const DelProducts({Key? key}) : super(key: key);

  @override
  State<DelProducts> createState() => _DelProductsState();
}

class _DelProductsState extends State<DelProducts> {
  List dataList = [];
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
      body: FutureBuilder(
        future: FireStoreDataBase().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text(
              "Something went wrong",
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            dataList = snapshot.data as List;
            return buildItems(dataList);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildItems(dataList) => ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: dataList.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            /*Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDesc(
                        name: dataList[index]['name'],
                        price: dataList[index]['price'],
                        desc: dataList[index]['description'],
                        url:dataList[index]['url'],
                        uid:dataList[index]['uid'])
                        )
                        );*/
          },
          child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          child: Image.network(dataList[index]['url']),
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            dataList[index]['name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                            child: Text(
                              dataList[index]['description'],
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                          child: Text(
                            '₹ ' + dataList[index]['price'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            onPressed: () {},
                            child: const Text('Delete'))
                      ]),
                ]),
          ),
        );
      });
}
