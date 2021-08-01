import 'package:chill_kid_intership/adminInterface/utils/Home.dart';
import 'package:chill_kid_intership/model/Planning.dart';
import 'package:chill_kid_intership/superAdminInterface/management/planning/addPlanning.dart';
import 'package:chill_kid_intership/superAdminInterface/management/planning/detailPlanning.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



class planningList extends StatefulWidget {
  @override
  _planningListState createState() => _planningListState();
}

class _planningListState extends State<planningList> {
  List<Planning> plannings = [];
  Planning planning ;
  var url = Uri.parse('http://192.168.43.61:4000/chillKid/getPlanning');
  Future getAll() async{
    var data = await http.get(url);
    var jsonData = json.decode(data.body);

    for (var p in jsonData) {

      plannings.add(Planning(p['session'], p['coach'], p['date'], p['time']));}

    return plannings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:Text('Plannification', style: TextStyle(color: Colors.white, fontSize: 16),),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color:
              Colors.white,
            ),
            onPressed: () {
              Navigator.push((context), MaterialPageRoute(
                  builder: (context ) {
                    return HomePageAdmin();
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
                          onTap: (){
                            Navigator.push(context,new MaterialPageRoute(builder: (context)=>planningDetail(snapshot.data[index])));
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
                                  Text(snapshot.data[index].session, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                                ],),
                                SizedBox(height: 10,),
                                Row(children: [
                                  SizedBox(width: 5,),
                                  Text('Entraineur:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold )),
                                  SizedBox(width: 20,),
                                  Text(snapshot.data[index].coach, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                                ],),
                                SizedBox(height: 10,),

                                Row(children: [
                                  SizedBox(width: 5,),
                                  Text('Date:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold )),
                                  SizedBox(width: 20,),
                                  Text(snapshot.data[index].date, style: TextStyle(color: Colors.grey[700], fontSize: 15), maxLines: 5),

                                  SizedBox(width: 20,),
                                  Row(
                                      children:[
                                        Text('Heure:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold )),
                                        SizedBox(width: 20,),
                                        Text(snapshot.data[index].time, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                                      ]
                                  )

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
            Navigator.push(context, MaterialPageRoute(builder: (context){return addPlanning();}));
          },
          child:
          Container(child: Icon(Icons.add),
          ),
          backgroundColor: Colors.blue,)
    );

  }








}