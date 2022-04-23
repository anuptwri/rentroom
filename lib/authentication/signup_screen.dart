
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local/authentication/car_info_screen.dart';
import 'package:local/authentication/login_screen.dart';
import 'package:local/global/global.dart';
import 'package:local/splash/splash_screen.dart';
import 'package:local/tabPages/home_tab.dart';
import 'package:local/widgets/progress_dialog.dart';


class SignUpScreen extends StatefulWidget {



  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>

{

  TextEditingController nametextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController phonetextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();
  TextEditingController addresstextEditingController = TextEditingController();
  //TextEditingController dltextEditingController = TextEditingController();

  validateForm()
  {
    if(nametextEditingController.text.length < 3)
      {
      Fluttertoast.showToast(msg:"name must be atleast 3 characters.");
      }
    else if (!emailtextEditingController.text.contains("@"))
    {
      Fluttertoast.showToast(msg:"Email Address Invalid");
    }
    else if (phonetextEditingController.text.isEmpty)
    {
    Fluttertoast.showToast(msg:"Phone Number is required");
    }
    else if (passwordtextEditingController.text.length < 6 )
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
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog(message: "Processing, Please wait...",);
        }
    );

    final User? firebaseUser = (
        await fAuth.createUserWithEmailAndPassword(
          email: emailtextEditingController.text.trim(),
          password : passwordtextEditingController.text.trim(),

          ).catchError((msg){
            Navigator.pop(context);
            Fluttertoast.showToast(msg: "Error:"+ msg.toString());
        }
        )
    ).user;


    if(firebaseUser!=null)
      {
        Map driversMap =
            {
              "id" : firebaseUser.uid,
              "name" : nametextEditingController.text.trim(),
              "email" :emailtextEditingController.text.trim(),
              "phone" : phonetextEditingController.text.trim(),
             // "driving Licence" : dltextEditingController.text.trim(),
              "address" : addresstextEditingController.text.trim(),

            };
          DatabaseReference driversRef =  FirebaseDatabase.instance.ref().child("Users");
          driversRef.child(firebaseUser.uid).set(driversMap);

        currentFirebaseUser = firebaseUser;
        Fluttertoast.showToast(msg: "Account has been created");
        Navigator.push(context, MaterialPageRoute(builder: (c)=>const MySplashScreen()));
      }
    else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Account has not been created");

    }
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
                  controller: emailtextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  decoration:const InputDecoration(
                    icon:  Icon(Icons.drafts_outlined, color: Color(
                        0xffaf3030)),
                    labelText: "Email",
                    hintText: "Enter your Email",

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
                    icon:  Icon(Icons.phone_outlined, color: Color(
                        0xffaf3030)),
                    labelText: "Phone no.",
                    hintText: "Enter your phone number",

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
                  controller: passwordtextEditingController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  decoration:const InputDecoration(
                    icon:  Icon(Icons.lock, color: Color(
                        0xffaf3030)),
                    labelText: "Password",
                    hintText: "Enter your password",

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
                    hintText: "Enter your password",

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
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )
              ),
              TextButton(
                child:const Text(
                  "Already Have an Account? Login Here",
                  style: TextStyle(
                    color: Colors.grey,
                  ),

                ),
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
