import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local/authentication/login_screen.dart';
import 'package:local/authentication/signup_screen.dart';
import 'package:local/global/global.dart';
import 'package:local/mainScreens/main_screen.dart';
import 'package:local/tabPages/home_tab.dart';

class MySplashScreen extends StatefulWidget
{
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}



class _MySplashScreenState extends State<MySplashScreen>
{

  startTimer()
  {
    Timer(const Duration(seconds:3 ),() async
    {
      if(await fAuth.currentUser != null)
        {
          currentFirebaseUser = fAuth.currentUser;
          Navigator.push(context, MaterialPageRoute(builder: (c)=>MainScreen()));
        }
      else
   Navigator.push(context, MaterialPageRoute(builder: (c)=>LoginScreen()));
    });
  }

    @override
  void initState() {
    super.initState();

    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Image.asset("images/home.png"),

            SizedBox(height: 10,),
            CircularProgressIndicator(color: Colors.red,),

          ],
        ),
      ),
    );
  }
}
