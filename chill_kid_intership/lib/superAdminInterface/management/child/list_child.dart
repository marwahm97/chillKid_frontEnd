
import 'package:chill_kid_intership/model/Child.dart';
import 'package:chill_kid_intership/superAdminInterface/utils/Home.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
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

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:Text('Enfants', style: TextStyle(color: Colors.white, fontSize: 16),),
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
                          Navigator.push(context,new MaterialPageRoute(builder: (context)=>childDetail(snapshot.data[index])));
                        },
                        child: Card(
                            color: Colors.white,
                            child:
                            Column( children: [
                              SizedBox(height: 20,),
                              Row(children: [
                                SizedBox(width: 5,),
                                Text('Nom:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold )),
                                SizedBox(width: 20,),
                                Text(snapshot.data[index].childName, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                              ],),
                              SizedBox(height: 10,),
                              Row(children: [
                                SizedBox(width: 5,),
                                Text('Date de naissance:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold )),
                                SizedBox(width: 20,),
                                Text(snapshot.data[index].dateOfBirth, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                              ],),
                              SizedBox(height: 10,),
                              Row(children: [
                                SizedBox(width: 5,),
                                Text('Parent:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold )),
                                SizedBox(width: 20,),
                                Text(snapshot.data[index].parent, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
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
