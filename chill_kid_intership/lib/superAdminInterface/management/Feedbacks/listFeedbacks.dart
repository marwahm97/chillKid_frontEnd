import 'dart:convert';

import 'package:chill_kid_intership/superAdminInterface/utils/Home.dart';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import'package:chill_kid_intership/model/FeedB.dart';

class Feedbacks extends StatefulWidget {
  @override
  _FeedbacksState createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  List<FeedB> feedbacks = [];
  FeedB feedback ;
  var url = Uri.parse('http://192.168.43.61:4000/chillKid/getFeedbacks');
  Future getAll() async{
    var data = await http.get(url);
    var jsonData = json.decode(data.body);

    for (var e in jsonData) {

      feedbacks.add(FeedB(e['username'], e['rate'], e['comment']));}

    return feedbacks;
  }



int rating =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Feedbacks",
          style:TextStyle(color: Colors.white, fontSize: 16) ,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color:
            Colors.white,
          ),
          onPressed: () {
            Navigator.push((context), MaterialPageRoute(
                builder: (context ) {
                  return HomePageSAdmin();
                }));
          },
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: getAll(),
            builder: (BuildContext context,AsyncSnapshot snapshot){
              if(snapshot.data == null){
                return Container(child:Center(
                  child: Text("Loading..."),
                ));
              }
              else{
                return ListView.builder(

                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context,int index){
                      rating = int.parse(snapshot.data[index].rate);


                      return GestureDetector(

                        child: Card(
                            color: Colors.white,

                            child: feedbackContainer('assets/avatar.png', snapshot.data[index].username, snapshot.data[index].comment,rating = int.parse(snapshot.data[index].rate) ,),



                        ),


                      );


                    }
                );}
            }
        ),
      ),
    );
  }

  Widget feedbackContainer (String imgPath , String name , String comment, int rating) {

    return Container(
         padding:EdgeInsets.only(left: 10.0, right: 10.0),
        child: Material(
          borderRadius: BorderRadius.circular(7.0),
          child: Container(
            height: 125.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0), color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                SizedBox(width: 10,),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      image: DecorationImage(
                        image: AssetImage(imgPath, ), fit: BoxFit.fill,
                      )
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Text(
                      name,
                      style: TextStyle(
                        fontFamily: 'My_Font',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      comment,
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10.0,),
                    Row(
                      children: <Widget> [
                        getRating(rating,1),
                        getRating(rating,2),
                        getRating(rating,3),
                        getRating(rating,4),
                        getRating(rating,5),


                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));

  }
  Widget getRating( rating, index){

    if (rating>= index){
      return
        Icon(Icons.star , color:  Colors.yellow,);
    }
    else
      return Icon(Icons.star , color:  Colors.grey,);
  }

}

