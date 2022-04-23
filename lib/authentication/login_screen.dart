import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local/authentication/signup_screen.dart';
import 'package:local/global/global.dart';
import 'package:local/splash/splash_screen.dart';
import 'package:local/widgets/progress_dialog.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordtextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  validateForm()
  {

    if (!emailtextEditingController.text.contains("@"))
    {
      Fluttertoast.showToast(msg:"Email Address Invalid");
    }

    else if (passwordtextEditingController.text.isEmpty )
    {
      Fluttertoast.showToast(msg:"Password is Required.");
    }

    else
    {
      LoginDriverNow();
    }
  }
  LoginDriverNow() async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog(message: "Logging, Please wait...",);
        }
    );

    final User? firebaseUser = (
        await fAuth.signInWithEmailAndPassword(
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


      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "Login Successful");
      Navigator.push(context, MaterialPageRoute(builder: (c)=>const MySplashScreen()));
    }
    else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error Occured. Please try Again.");

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
            // const SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Image.asset("images/home.png"),
             ),

            // const SizedBox(height: 30,),

             const Text(
               "Login",
               style: TextStyle(
                 fontSize: 24,
                 color: Colors.black,
                 fontWeight: FontWeight.bold,
               ),
             ),
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
             const SizedBox(height: 10,),
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
                   hintText: "Enter your Password",

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

             ElevatedButton(
                 onPressed: ()
                 {
                 validateForm();

                 },
                 style: ElevatedButton.styleFrom(
                   primary: Colors.red,
                 ),
                 child: const Text(
                   "Login",
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 18,
                   ),
                 )
             ),
             TextButton(
               child: const Text(
                 "Not a Member? Register Here",
                 style: TextStyle(
                   color: Colors.grey,
                 ),
                 
               ),
               onPressed: ()
               {
                 Navigator.push(context, MaterialPageRoute(builder: (c)=>SignUpScreen()));
                 print("signed in"+FirebaseAuth.instance.currentUser!.uid);
               },
             ),
             const SizedBox(height: 140,),
             Container(
               child:const Text(
                   "All rights reserved @RentRoom",
                 style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 14.0),

               ),

             )
           ],
         ),
       )

      ),
    );
  }
}
