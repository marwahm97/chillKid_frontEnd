import 'package:chill_kid_intership/memberInterface/Session/shop_screen.dart';
import 'package:flutter/material.dart';

class Planning extends StatefulWidget {
  @override
  _PlanningState createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           toolbarHeight: 70,
           backgroundColor:Colors.blue,
           title:Text("Plannification", style: TextStyle(color: Colors.white, fontSize: 16),),
           leading: IconButton(
              icon: Icon(
        Icons.arrow_back,
          color:
          Colors.white,
        ),
               onPressed: () {
               Navigator.push((context), MaterialPageRoute(
                      builder: (context ) {
                         return ShopScreen();
                      }));
            },
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.only(left: 20, right: 15),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.4),
                  image: DecorationImage(image: AssetImage('assets/planning/musc.jpg'),
                      fit: BoxFit.cover)
              ),
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  Text("Musculation", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Lundi", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),),
                      Text("12:30 - 13:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mardi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mercredi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("9:30 - 10:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jeudi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Vendredi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("8:30 - 9:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Samedi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 30,)

                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.only(left: 20, right: 15),
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.4),
                  image: DecorationImage(image: AssetImage('assets/planning/natation.jpg'),
                      fit: BoxFit.cover)
              ),
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  Text("Natation", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Lundi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mardi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mercredi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jeudi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Vendredi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Samedi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 30,)

                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.only(left: 20, right: 15),
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.4),
                  image: DecorationImage(image: AssetImage('assets/planning/Boxing.jpg'),
                      fit: BoxFit.cover)
              ),
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  Text("Boxing", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Lundi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mardi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mercredi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jeudi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Vendredi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Samedi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 30,)

                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.only(left: 20, right: 15),
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.4),
                  image: DecorationImage(image: AssetImage('assets/planning/gymn.jpg'),
                      fit: BoxFit.cover)
              ),
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  Text("Gymnastique", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Lundi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mardi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mercredi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jeudi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Vendredi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Samedi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 30,)

                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.only(left: 20, right: 15),
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage('assets/planning/yoga.png'),
                      fit: BoxFit.cover)
              ),
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  Text("Yoga", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Lundi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mardi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mercredi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jeudi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Vendredi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Samedi", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),),
                      Text("10:30 - 11:30", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  SizedBox(height: 30,)

                ],
              ),
            ),
          ],
        )
    );
  }


}
