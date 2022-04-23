import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local/global/global.dart';
import 'package:local/splash/splash_screen.dart';
class PropertyPage extends StatefulWidget {
  const PropertyPage({Key? key}) : super(key: key);

  @override
  _PropertyPageState createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage> {

  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;
  fetchProducts() async{

    QuerySnapshot qn =await _firestoreInstance.collection("products").get();
    setState(() {
      for(int i = 0; i<qn.docs.length;i++){
        _products.add(
            {
              "address":qn.docs[i]["address"],
              "name":qn.docs[i]["name"],

              "price":qn.docs[i]["price"],
            }
        );

      }
    });

    return qn.docs;
  }
  void initState() {

    fetchProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (_,index){
                return Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Text("${_products[index]["name"]}"),
                      Text("${_products[index]["address"]}"),
                      Text("${_products[index]["price"].toString()}"),
                    ],
                  ),
                );
              }
          ),
      ),
    );
  }
}
