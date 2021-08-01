
import 'package:chill_kid_intership/model/Child.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../home.dart';
import 'add_child.dart';
import 'child_detail.dart';

class listChild extends StatefulWidget {
  @override
  _listChildState createState() => _listChildState();
}

class _listChildState extends State<listChild> {
  List<Child> children = [];
  Child child ;
  var url = Uri.parse('http://192.168.43.61:4000/chillKid/getChild');
  Future getAll() async{
    var data = await http.get(url);
    var jsonData = json.decode(data.body);

    for (var c in jsonData) {

      children.add(Child( c['childName'], c['dateOfBirth'],c['parent'], c['state']));}
    return children;
  }

  bool status;
  getState(bool state){
    if (child.state == "true"){
      return state = true;
    }
    else return state = false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:Text('Mes enfants', style: TextStyle(color: Colors.white, fontSize: 16),),
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
                            Navigator.push(context,new MaterialPageRoute(builder: (context)=>childDetail(snapshot.data[index])));
                          },
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
                                    Row( children: [
                                      SizedBox(height: 15,),
                                      Image(image: AssetImage("assets/child.png"), height: 100, width: 100,),
                                      SizedBox(width: 15,),
                                      Column(
                                        children: [
                                          Text(snapshot.data[index].childName, style: TextStyle(color: Colors.black87, fontSize: 15), ),

                                          SizedBox(height: 10,),


                                          Text(snapshot.data[index].dateOfBirth, style: TextStyle(color: Colors.black87, fontSize: 15),)

                                        ],
                                      )









                                    ],)


                                ),
                                SizedBox(height: 8,),
                              ],
                            )
                            /*Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    Image(image: AssetImage("assets/child.png"), height: 100, width: 100,),
                                    SizedBox(height: 15,),
                                    Text(snapshot.data[index].childName, style: TextStyle(color: Colors.black87, fontSize: 15)),
                                    SizedBox(height: 10,),
                                    Text(snapshot.data[index].dateOfBirth, style: TextStyle(color: Colors.black87, fontSize: 15), textAlign: TextAlign.center,)


                           ]
                          )

                            )*/

                        );







                      }

                  );
                }
              }
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){return AddChild();}));
          },
          child:
          Container(child: Icon(Icons.add),
          ),
          backgroundColor: Colors.blue,)

    );

  }








}
