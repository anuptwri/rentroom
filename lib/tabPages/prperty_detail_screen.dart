import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:local/tabPages/advertisments.dart';
import 'package:local/tabPages/product_images.dart';

class PropertyDetail extends StatefulWidget {
    var _product;
  PropertyDetail(this._product);
  @override
  _PropertyDetailState createState() => _PropertyDetailState();
}

class _PropertyDetailState extends State<PropertyDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

             // Advertisments(),
              AspectRatio(
                aspectRatio: 3.5,
                child: CarouselSlider(
                  items: widget._product['img'].map<Widget>((item) => Padding(
                      padding: const EdgeInsets.only(left: 3,right: 3),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                        ),
                      ),
                    ),
                  ),
                      ).toList(),
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

                        });
                      }
                  ) ,
                ),
              ),

              Text(widget._product['name'])
            ],
          ),
        ),
      ),
    );
  }
}
