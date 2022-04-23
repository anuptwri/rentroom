
import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart'as http;


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local/global/global.dart';
import 'package:local/mainScreens/main_screen.dart';
import 'package:local/splash/splash_screen.dart';
import 'package:local/tabPages/home_tab.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:local/widgets/progress_dialog.dart';


class AddPropertyTabPage extends StatefulWidget {
  const AddPropertyTabPage({Key? key}) : super(key: key);

  @override
  _AddPropertyTabPageState createState() => _AddPropertyTabPageState();
}

class _AddPropertyTabPageState extends State<AddPropertyTabPage>
{



  final databaseReference = FirebaseDatabase.instance.reference();

  TextEditingController nametextEditingController = TextEditingController();
  TextEditingController detailtextEditingController = TextEditingController();
  TextEditingController phonetextEditingController = TextEditingController();
  TextEditingController pricetextEditingController = TextEditingController();
  TextEditingController addresstextEditingController = TextEditingController();

  //TextEditingController dltextEditingController = TextEditingController();

  validateForm()
  {
    if(nametextEditingController.text.length < 3)
    {
      Fluttertoast.showToast(msg:"name must be atleast 3 characters.");
    }
    else if (pricetextEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(msg:"Price cannot be empty");
    }
    else if (phonetextEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(msg:"Phone Number is required");
    }
    else if (detailtextEditingController.text.isEmpty )
    {
      Fluttertoast.showToast(msg:"Password must be atleast 6 characters.");
    }
    else if (addresstextEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(msg:"Address number required");
    }

    else
    {
      savePropertyInfoNow();

    }
  }

  savePropertyInfoNow() async
  {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;

      CollectionReference _collectionRef = FirebaseFirestore.instance.collection("products");
      return _collectionRef.doc(currentuser!.email).set({
        "name": nametextEditingController.text,
        "detail": detailtextEditingController.text,
        "phone": phonetextEditingController.text,
        "address":addresstextEditingController.text,
        "price":pricetextEditingController.text,
      }).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>MainScreen()))).catchError((error)=>print("error found!"));


  }

  late File _image;
  @override
  Widget build(BuildContext context) {

    Future getImage() async{
      XFile? image= await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        _image=image as File;
        print("image path $_image");
      });
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              //const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(50.0),
                //child: Image.asset("images/home.png"),
              ),
              // const SizedBox(height: 10,),

              const Text(
                "Add Your Product ",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextField(
                  controller: nametextEditingController,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  decoration:const InputDecoration(
                    icon:  Icon(Icons.person, color: Color(
                        0xffaf3030)),
                    labelText: "Name",
                    hintText: "Enter your full name",

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

                  ),),
              TextField(
                  controller: detailtextEditingController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  decoration:const InputDecoration(
                    icon:  Icon(Icons.book, color: Color(
                        0xffaf3030)),
                    labelText: "Description",
                    hintText: "Enter the description of the property.",

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
                  controller: addresstextEditingController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  decoration:const InputDecoration(
                    icon:  Icon(Icons.location_on, color: Color(
                        0xffaf3030)),
                    labelText: "Address",
                    hintText: "Enter Address of the property",

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
                  controller: phonetextEditingController,
                  keyboardType: TextInputType.number,

                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  decoration:const InputDecoration(
                    icon:  Icon(Icons.phone, color: Color(
                        0xffaf3030)),
                    labelText: "Phone",
                    hintText: "Enter contact number",

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
                  controller: pricetextEditingController,
                  keyboardType: TextInputType.number,

                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  decoration:const InputDecoration(
                    icon:  Icon(Icons.money, color: Color(
                        0xffaf3030)),
                    labelText: "Price",
                    hintText: "Enter the price",

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
              SizedBox(height: 10.0,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:Form(

                  child: Row(
                    children: [
                      OutlineButton(
                        borderSide: BorderSide(color:Colors.grey.withOpacity(0.8),width: 2.5),
                        onPressed: (){getImage();},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,20,8.0,20),
                          child: new Icon(Icons.add,color: Colors.grey),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      OutlineButton(
                        borderSide: BorderSide(color:Colors.grey.withOpacity(0.8),width: 2.5),
                        onPressed: (){},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,20,8.0,20),
                          child: new Icon(Icons.add,color: Colors.grey),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      OutlineButton(
                        borderSide: BorderSide(color:Colors.grey.withOpacity(0.8),width: 2.5),
                        onPressed: (){},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,20,8.0,20),
                          child: new Icon(Icons.add,color: Colors.grey),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      OutlineButton(
                        borderSide: BorderSide(color:Colors.grey.withOpacity(0.8),width: 2.5),
                        onPressed: (){},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,20,8.0,20),
                          child: new Icon(Icons.add,color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              const SizedBox(height: 20,),

              ElevatedButton(
                  onPressed: ()
                  {
                    validateForm();


                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: const Text(
                    "Add Property",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
