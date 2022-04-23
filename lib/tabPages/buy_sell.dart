import 'package:flutter/material.dart';

import '../size_config.dart';

class BuySell extends StatelessWidget {
  const BuySell({ Key? key , }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        boxShadow:const [
          BoxShadow(
            color: Colors.white,
            spreadRadius: -5,
            blurRadius: 17,
            offset: Offset(0, 3),
          )
        ],
        border: Border.all(width: 0.5, color: Colors.white),
        borderRadius: const BorderRadius.all(
          Radius.circular(18.0),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black12,
            Colors.white
          ],
        ),
      ),
      height: 80,
      width: 360,


      child: Row(
        children: [
          SizedBox(width: 10.0),


          Container(
            width: 110.0,
            height: 40.0,
            child: ElevatedButton(onPressed: (){},



                child: Text("For Sell",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),

                        )
                    )
                )

            ),
          ),
          SizedBox(width: 20.0,),
          Container(
            width: 80.0,
            height: 40.0,
            child: ElevatedButton(onPressed: (){},


                child: Text("Filter",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFF4668D9)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),

                        )
                    )
                )

            ),
          ),
          SizedBox(width: 20.0,),
          Container(
            width: 110.0,
            height: 40.0,
            child: ElevatedButton(onPressed: (){},


                child: Text("For Rent",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),

                        )
                    )
                )

            ),
          ),
        ],
      ),

    );


  }
}