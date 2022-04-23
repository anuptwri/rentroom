
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:local/widgets/progress_dialog.dart';


class AddProperty extends StatefulWidget {



  @override
  _AddPropertyState createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty>

{

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
    else if (!pricetextEditingController.text.isEmpty)
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
      saveUserInfoNow();

    }
  }

  saveUserInfoNow() async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(message: "Processing, Please wait...",);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              //const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/home.png"),
              ),
              // const SizedBox(height: 10,),

              const Text(
                "Register ",
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

                  )),
              TextField(
                  controller: nametextEditingController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  decoration:const InputDecoration(
                    icon:  Icon(Icons.drafts_outlined, color: Color(
                        0xffaf3030)),
                    labelText: "Name",
                    hintText: "Enter name of the product",

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
                    icon:  Icon(Icons.phone_outlined, color: Color(
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
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  decoration:const InputDecoration(
                    icon:  Icon(Icons.lock, color: Color(
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
                    icon:  Icon(Icons.location_on, color: Color(
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
