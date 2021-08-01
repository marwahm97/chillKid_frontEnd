
import 'package:chill_kid_intership/model/Session.dart';
import 'package:chill_kid_intership/superAdminInterface/utils/Home.dart';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'addSession.dart';
import 'detailSession.dart';


class sessionList extends StatefulWidget {
  @override
  _sessionListState createState() => _sessionListState();
}

class _sessionListState extends State<sessionList> {
  List<Session> sessions = [];
  Session session ;
  var url = Uri.parse('http://192.168.43.61:4000/chillKid/getSession');
  Future getAll() async{
    var data = await http.get(url);
    var jsonData = json.decode(data.body);

    for (var s in jsonData) {

      sessions.add(Session(s['title'], s['price'], s['description'],));}

    return sessions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:Text('Sessions', style: TextStyle(color: Colors.white, fontSize: 16),),
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
                }else{
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context,int index){

                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context,new MaterialPageRoute(builder: (context)=>sessionDetail(snapshot.data[index])));
                          },
                          child: Card(
                              color: Colors.white,
                              child:
                              Column( children: [
                                SizedBox(height: 20,),
                                Row(children: [
                                  SizedBox(width: 5,),
                                  Text('Session:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold )),
                                  SizedBox(width: 20,),
                                  Text(snapshot.data[index].title, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                                ],),
                                SizedBox(height: 10,),
                                Row(children: [
                                  SizedBox(width: 5,),
                                  Text('Prix:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold )),
                                  SizedBox(width: 20,),
                                  Text(snapshot.data[index].price, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                                ],),
                                SizedBox(height: 10,),
                                Row(children: [
                                  SizedBox(width: 5,),
                                  Text('Description:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold ),
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(child: Text(snapshot.data[index].description, style: TextStyle(color: Colors.grey[700], fontSize: 15)),),

                                ],),

                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){},
                                      child: Icon(Icons.edit, color: Colors.red,),
                                    ),
                                    SizedBox(width: 20,),
                                    GestureDetector(
                                      onTap: (){},
                                      child: Icon(Icons.delete, color: Colors.red,),
                                    ),

                                  ],),

                                SizedBox(height: 20,),



                              ],)


                          ),
                        );


                      }
                  );}
              }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){return AddSession();}));
          },
          child:
          Container(child: Icon(Icons.add),
          ),
          backgroundColor: Colors.blue,)
    );

  }








}