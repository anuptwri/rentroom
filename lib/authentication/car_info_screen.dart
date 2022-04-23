import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local/global/global.dart';
import 'package:local/splash/splash_screen.dart';

class CarInfoScreen extends StatefulWidget
{


  @override
  _CarInfoScreenState createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController bikeModeltextEditingController = TextEditingController();
  TextEditingController bikeNumbertextEditingController = TextEditingController();
  TextEditingController bikeColortextEditingController = TextEditingController();

  List<String> bikeTypeList = ["Scooty","Bike"];
  String ?selectedBikeType ;

   saveCarInfo()
   {
     Map driversCarInfoMap =
     {
       "bike_color" : bikeColortextEditingController.text.trim(),
       "bike_number" : bikeNumbertextEditingController.text.trim(),
       "bike_model" :bikeModeltextEditingController.text.trim(),
       "type" : selectedBikeType,

     };
     DatabaseReference driversRef =  FirebaseDatabase.instance.ref().child("drivers");
     driversRef.child(currentFirebaseUser!.uid).child("bike_details").set(driversCarInfoMap);
     Fluttertoast.showToast(msg: "Bike details Saved . Congratulations!");
     Navigator.push(context, MaterialPageRoute(builder: (c)=>const MySplashScreen()));
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(

            children: [

              const SizedBox(height: 24,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/splashfinal.png"),
              ),
              const SizedBox(height: 10,),

              const Text(
                "Bike Details",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextField(
                  controller: bikeModeltextEditingController,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  decoration:const InputDecoration(
                    labelText: "Bike Model",
                    hintText: "Bike Model",

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),

                  )),
              TextField(
                  controller: bikeNumbertextEditingController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  decoration:const InputDecoration(
                    labelText: "Bike Number",
                    hintText: "Bike Number",

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),

                  )),
              TextField(
                  controller: bikeColortextEditingController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  decoration:const InputDecoration(
                    labelText: "Bike Color",
                    hintText: "Bike Color",

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),

                  )),

              const SizedBox(height: 10,),

              DropdownButton(
                iconSize: 26,
                icon: Icon(Icons.agriculture),
                dropdownColor: Colors.white70,
                hint: const Text(
                  "Choose Bike Type",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                value: selectedBikeType,
                onChanged: (newValue)
                  {
                    setState(() {
                      selectedBikeType = newValue.toString();
                    });
                  },
                items: bikeTypeList.map((bike){
                  return DropdownMenuItem(
                    child:  Text(
                      bike,
                      style:const TextStyle(
                        color: Colors.grey,
                      ) ,
                    ),
                    value: bike,
                  );

                } ).toList(),
              ),

              const SizedBox(height: 20,),

              ElevatedButton(

                  onPressed: ()
                  {
                    if(bikeColortextEditingController.text.isNotEmpty &&
                        bikeModeltextEditingController.text.isNotEmpty
                        && bikeNumbertextEditingController.text.isNotEmpty && selectedBikeType != null)
                      {
                        saveCarInfo();
                      }



                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: const Text(
                    "Save Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )
              )

            ],
          ),
        ),
      ),
    );
  }
}
