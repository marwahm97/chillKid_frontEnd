import 'package:chill_kid_intership/adminInterface/utils/Home.dart';
import 'package:chill_kid_intership/model/Session.dart';
import 'file:///C:/Users/LENOVO/AndroidStudioProjects/chill_kid_intership/lib/model/User.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:http/http.dart' as http;

import 'listSession.dart';

class sessionDetail extends StatefulWidget {

   Session session;
  sessionDetail(this.session);
  @override
  _sessionDetailState createState() => _sessionDetailState(this.session);
}

class _sessionDetailState extends State<sessionDetail> {
  Session session;

  _sessionDetailState(this.session);



  Future<User> deleteSession(String title) async {
    final http.Response response = await http.delete(
      Uri.parse('http://192.168.43.61:4000/chillKid/deleteSessionByTitle/${this.session.title}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return
        Navigator.push(context, new MaterialPageRoute(builder: (context)=>sessionList()));
    } else {
      throw Exception('Failed to delete session');
    }
  }

  String title;
  String price;
  String description;



  Future <User>save( title, price, description) {

    http.put(Uri.parse("http://192.168.43.61:4000/chillKid/putSession/${this.session.title}"),
        headers:<String,String>{'Context-Type':'application/json;charset=UTF-8'},body:<String,String>
        {'title':title,'price':price, 'description': description,   });

    Fluttertoast.showToast(
        msg: "Session modifiée avec succée",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0

    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title:Text(session.title),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color:
                Colors.white,
              ),
              onPressed: () {
                Navigator.push((context), MaterialPageRoute(
                    builder: (context ) {
                      return sessionList();
                    }));
              },
            ),),

          body:Container(

              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: title),
                          onChanged: (value) {
                            title = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Ce champ ne peut pas etre vide';
                            } else if (RegExp(
                                r"^[a-zA-Z0-9]")
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return 'Entrer un nom valide';
                            }
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.category,
                                color: Colors.blue,
                              ),
                              hintText: session.title,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.blue)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.blue)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: price),
                          onChanged: (value) {
                            price = value;
                          },
                          validator: (value) {
                            if (value.isEmpty  ) {
                              return 'Numéro de téléphone ne peut pas etre vide';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.phone_android_sharp,
                                color: Colors.blue,
                              ),
                              hintText: session.price,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.blue)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.blue)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text:description),
                          onChanged: (value) {
                            description = value;
                          },
                          validator: (value) {
                            if (value.isEmpty  ) {
                              return 'Le role ne peut pas etre vide';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.description,
                                color: Colors.blue,
                              ),
                              hintText: session.description,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.blue)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.blue)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlineButton(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: (){save(title, price, description);},
                            child: Row(
                              children: [
                                Icon(Icons.edit, color: Colors.blue,),
                                SizedBox(width: 15,),
                                Text("Modifier", style: TextStyle(color: Colors.blue),),
                              ],
                            ),
                          ),
                          RaisedButton(
                              onPressed: () {showDialog(

                                  context: context,
                                  builder: (context)=> AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Text('Attention'),
                                    content: Text('Voulez vous vraiment continuer!!', style: TextStyle(color: Colors.black),),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Oui', style: TextStyle(color: Colors.blue),),
                                        onPressed: (){
                                          deleteSession(this.session.title);
                                        },
                                      ),
                                      FlatButton(
                                        child: Text('Non', style: TextStyle(color: Colors.blue),),
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                      ),

                                    ],
                                  ));},
                              color: Colors.blue,
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Icon(Icons.delete, color: Colors.white,),
                                  SizedBox(width: 15,),
                                  Text("Supprimer", style: TextStyle(color: Colors.white),),
                                ],
                              )
                          )
                        ],
                      )






                    ],
                  ),
                ],
              )
          )
      ),
    );
  }
}