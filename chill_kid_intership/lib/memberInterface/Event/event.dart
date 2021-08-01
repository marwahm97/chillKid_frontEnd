import 'package:chill_kid_intership/memberInterface/Session/shop_screen.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import'package:chill_kid_intership/model/Event.dart';

import 'package:chill_kid_intership/memberInterface/home.dart';



class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  List<Event> events = [];
  Event event ;
  var url = Uri.parse('http://192.168.43.61:4000/chillKid/getEvent');
  Future getAll() async{
    var data = await http.get(url);
    var jsonData = json.decode(data.body);

    for (var e in jsonData) {

      events.add(Event(e['title'], e['date'], e['description']));}

    return events;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:Text('Evènements', style: TextStyle(color: Colors.white, fontSize: 16),),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color:
              Colors.white,
            ),
            onPressed: () {
              Navigator.push((context), MaterialPageRoute(
                  builder: (context ) {
                    return HomePage();
                  }));
            },
          ),
          actions: <Widget>[
            Padding(padding: EdgeInsets.only(right: 20)),


          ],
        ),
        body: Container(
          child: FutureBuilder(

              future: getAll(),
              builder: (BuildContext context,AsyncSnapshot snapshot){
                if(snapshot.data == null){
                  return Container(child:Center(
                    child: Text("Loading..."),
                  ));
                }else{
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context,int index){
                        return GestureDetector(
                          onTap: (){},
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child:
                                  Column( children: [
                                    SizedBox(height: 15,),
                                    Row(children: [
                                      SizedBox(width: 5,),
                                      Text(snapshot.data[index].title, style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    ],),
                                    SizedBox(height: 10,),
                                    Row(children: [
                                      SizedBox(width: 5,),
                                      Text(snapshot.data[index].date, style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ), ),
                                    ],),


                                    SizedBox(height: 10,),
                                    Row(children: [
                                      SizedBox(width: 5,),
                                      Expanded(child: Text(snapshot.data[index].description, style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,

                                      ),),)
                                    ],),





                                  ],)


                              ),
                              SizedBox(height: 8,),
                            ],
                          )

                        );


                      }
                  );}
              }
          ),
        ),

    );

  }








}