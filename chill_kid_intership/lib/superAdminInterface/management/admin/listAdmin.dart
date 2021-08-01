
import 'package:chill_kid_intership/superAdminInterface/management/admin/add_admin.dart';
import 'package:chill_kid_intership/superAdminInterface/management/admin/detailAdmin.dart';
import 'package:chill_kid_intership/superAdminInterface/utils/Home.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'file:///C:/Users/LENOVO/AndroidStudioProjects/chill_kid_intership/lib/model/User.dart';



class  listAdmin extends StatefulWidget {
  @override
  _listAdminState createState() => _listAdminState();
}

class _listAdminState extends State<listAdmin> {
  List<User> users = [];
  User user ;
  var url = Uri.parse('http://192.168.43.61:4000/auth/user/getUser');
  Future getAll() async{
    var data = await http.get(url);
    var jsonData = json.decode(data.body);

    for (var u in jsonData) {
      if(u['role']== 'admin') {
        users.add(User(u['username'], u['email'], u['phone'],u['role'], u['password'], ));}
    }
    return users;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:Text('Admin', style: TextStyle(color: Colors.white, fontSize: 16),),
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
          actions: <Widget>[
            Padding(padding: EdgeInsets.only(right: 20)),
            GestureDetector(
                child: Icon(Icons.search)
            ),

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
                            Navigator.push(context,new MaterialPageRoute(builder: (context)=>adminDetail(snapshot.data[index])));
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
                                  Text(snapshot.data[index].username, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                                ],),
                                SizedBox(height: 10,),
                                Row(children: [
                                  SizedBox(width: 5,),
                                  Text('Email:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold )),
                                  SizedBox(width: 20,),
                                  Text(snapshot.data[index].email, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                                ],),
                                Visibility(
                                    visible: false,
                                    child:Row(children: [
                                      SizedBox(width: 5,),
                                      Text('Mot de passe:', style: TextStyle(color: Colors.black, fontSize:16, fontWeight: FontWeight.bold  )),
                                      SizedBox(width: 20,),
                                      Text(snapshot.data[index].password, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                                    ],) ),

                                SizedBox(height: 10,),
                                Row(children: [
                                  SizedBox(width: 5,),
                                  Text('Numéro de téléphone:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold )),
                                  SizedBox(width: 20,),
                                  Text(snapshot.data[index].phone, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                                ],),

                                SizedBox(height: 10,),
                                Row(children: [
                                  SizedBox(width: 5,),
                                  Text('Role:', style: TextStyle(color: Colors.black, fontSize:16, fontWeight: FontWeight.bold  )),
                                  SizedBox(width: 20,),
                                  Text(snapshot.data[index].role, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
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
            Navigator.push(context, MaterialPageRoute(builder: (context){return AddAdmin();}));
          },
          child:
          Container(child: Icon(Icons.add),
          ),
          backgroundColor: Colors.blue,)
    );

  }








}
