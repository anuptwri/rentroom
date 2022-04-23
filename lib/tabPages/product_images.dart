

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:local/tabPages/section_title.dart';

import '../size_config.dart';

class ProductImages extends StatefulWidget {


  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {

  List <String> _carouselImages= [];
  List _products = [];
  var _dotPosition = 0;
  var _firestoreInstance = FirebaseFirestore.instance;

  fetchCarouselImages() async{

    QuerySnapshot qn =await _firestoreInstance.collection("products").get();
    setState(() {
      for(int i = 0; i<qn.docs.length;i++){
        _carouselImages.add(
          qn.docs[i]["img"],
        );
      }
    });

    return qn.docs;
  }


  @override
  void initState() {
    // TODO: implement initState
    fetchCarouselImages();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        AspectRatio(
          aspectRatio: 3.5,
          child: CarouselSlider(
            items: _carouselImages.map((item) => ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(item,
                    height: 200.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            )).toList(),
            options: CarouselOptions(
                height: 150.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration:const Duration(milliseconds: 800),
                viewportFraction: 0.8,
                onPageChanged: (val, carouselPageChangedReason ){
                  setState(() {
                    _dotPosition=val;
                  });
                }
            ) ,
          ),
        ),
        SizedBox(height: 5.0,),
        DotsIndicator(
          dotsCount: _carouselImages.length==0?1:_carouselImages.length,
          position: _dotPosition.toDouble(),
          decorator: DotsDecorator(
            color: Colors.black12,
            activeColor: Colors.red,
            spacing: EdgeInsets.all(2),
            activeSize: Size(8,8),
            size: Size(6,6),

          ),
        ),
        SizedBox(height: 5.0,),



      ],



    );
  }
}
