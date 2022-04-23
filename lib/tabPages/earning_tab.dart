import 'package:flutter/material.dart';
import 'package:local/global/add.dart';

class EarningTabPage extends StatefulWidget {
  const EarningTabPage({Key? key}) : super(key: key);

  @override
  _EarningTabPageState createState() => _EarningTabPageState();
}

class _EarningTabPageState extends State<EarningTabPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child:ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (c)=>ImageUploads()));

          }, child: Text("helo"),
        )
    );
  }
}
