import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local/global/global.dart';
import 'package:local/splash/splash_screen.dart';
import 'package:local/tabPages/advertisments.dart';
import 'package:local/tabPages/buy_sell.dart';
import 'package:local/tabPages/property_card.dart';
import 'package:local/tabPages/prperty_detail_screen.dart';
import 'package:local/tabPages/search_field.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:local/tabPages/section_title.dart';

import '../size_config.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  List<String> _carouselImages = [];
  var _dotPosition = 0;
  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;

  fetchCarouselImages() async {
    QuerySnapshot qn =
    await _firestoreInstance.collection("carousel-slider").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["img-path"],
        );
        print(qn.docs[i]["img-path"]);
      }
    });

    return qn.docs;
  }

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("products").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "name": qn.docs[i]["name"],
          //"detail": qn.docs[i]["detail"],
          "price": qn.docs[i]["price"],
          "address": qn.docs[i]["address"],
          "phone": qn.docs[i]["phone"],
         "img": qn.docs[i]["img"],

        });
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    fetchCarouselImages();
    fetchProducts();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),

                ),
                SearchField(),
                BuySell(),
                SizedBox(
                  height: 10,
                ),
                Advertisments(),
                SizedBox(
                  height: 10,
                ),


                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                  child: Container(

                    child: SectionTitle(title: "Popular Properties", press: () {}),

                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Popular Properties
                Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3 ,childAspectRatio: 1),
                      itemBuilder: (_,index){
                        return GestureDetector(
                          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>PropertyDetail(_products[index]))),
                          child: Card(
                            elevation: 5,
                            child: Column(
                              children: [
                                AspectRatio(
                                    aspectRatio: 2,
                                    child: Container(
                                        color: Colors.yellow,
                                        child: Image.network(
                                          _products[index]["img"],
                                        )
                                        )),
                                Text("${_products[index]["name"]}"),
                                Text("${_products[index]["address"]}"),
                                Text("Rs.${_products[index]["price"].toString()}",style: TextStyle(color: Colors.red),),

                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Urgent Properties
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                  child: Container(

                    child: SectionTitle(title: "Urgent Properties", press: () {}),

                  ),
                ),

                Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemBuilder: (_,index){
                        return Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              AspectRatio(
                                  aspectRatio: 2,
                                  child: Container(
                                    color: Colors.yellow,
                                  )),
                              Text("${_products[index]["name"]}"),
                              Text("${_products[index]["address"]}"),
                              Text("Rs.${_products[index]["price"].toString()}",style: TextStyle(color: Colors.red),),

                            ],
                          ),
                        );
                      }
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
