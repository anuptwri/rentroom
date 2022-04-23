import 'package:flutter/material.dart';
import 'package:local/tabPages/search_page.dart';


import '../../../size_config.dart';

class SearchField extends StatelessWidget {


  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(

      height: SizeConfig.screenHeight /22,

      width: SizeConfig.screenWidth * 0.9,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: _searchController,
        readOnly: true,


        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen())),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(0)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,

            hintText: "Search Property in a city/address",hintStyle: TextStyle(fontSize: 12),
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.location_on),
        ),

      ),
    );
  }
}
