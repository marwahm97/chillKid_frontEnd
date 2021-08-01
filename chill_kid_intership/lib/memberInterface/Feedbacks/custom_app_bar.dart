import 'package:chill_kid_intership/memberInterface/Session/shop_screen.dart';
import 'package:chill_kid_intership/memberInterface/home.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context){
                  return HomePage();
                }));
          },
        ),
        SizedBox(width: 25,),
        Text("Feedback" , style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),


        ]
    );
  }
}
