import 'dart:convert';
import 'package:chill_kid_intership/adminInterface/management/member/listMember.dart';
import 'file:///C:/Users/LENOVO/AndroidStudioProjects/chill_kid_intership/lib/model/User.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;




class memberDetail extends StatefulWidget {

  User user;
  memberDetail(this.user);
  @override
  _memberDetailState createState() => _memberDetailState(this.user);
}

class _memberDetailState extends State<memberDetail> {
  User user;

  _memberDetailState(this.user);

  Future<User> updateMember() async {
    final response = await http.put(
      Uri.parse('http://192.168.43.61:4000/auth/user/login/putUser/${this.user.username}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': user.username,
        'email': user.email,
        'role': user.role,
        'password': user.password,
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      return (jsonDecode(response.body));
    } else {
      throw Exception('Failed to update user.');
    }
  }

  Future<User> deleteUser(String username) async {
    final http.Response response = await http.delete(
      Uri.parse('http://192.168.43.61:4000/auth/user/login/deleteUserByName/${this.user.username}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return
        Navigator.push(context, new MaterialPageRoute(builder: (context)=>ListMember()));
    } else {
      throw Exception('Failed to delete member.');
    }
  }

  String username;
  String email;
  String phone;
  String role;


  Future <User>save( username, email,  phone,  role) {

    http.put(Uri.parse("http://192.168.100.140:4000/auth/user/login/putUser/${this.user.username}"),
        headers:<String,String>{'Context-Type':'application/json;charset=UTF-8'},body:<String,String>
        {'username':username,'email':email, 'phone': phone, 'role': role,  });

    Fluttertoast.showToast(
        msg: "Membre mofifié avec succée",
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
            title:Text(user.username),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color:
                Colors.white,
              ),
              onPressed: () {
                Navigator.push((context), MaterialPageRoute(
                    builder: (context ) {
                      return ListMember();
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
                          controller: TextEditingController(text: username),
                          onChanged: (value) {
                            username = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Le nom ne peut pas etre vide';
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
                                Icons.person,
                                color: Colors.blue,
                              ),
                              hintText: user.username,
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
                          controller: TextEditingController(text: email),
                          onChanged: (value) {
                            email = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "l'email ne peut pas etre vide";
                            } else if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return 'Entrer un email valide';
                            }
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.blue,
                              ),
                              hintText: user.email,
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
                          controller: TextEditingController(text: phone),
                          onChanged: (value) {
                            phone = value;
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
                              hintText: user.phone,
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
                          controller: TextEditingController(text:role),
                          onChanged: (value) {
                            role = value;
                          },
                          validator: (value) {
                            if (value.isEmpty  ) {
                              return 'Le role ne peut pas etre vide';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.group,
                                color: Colors.blue,
                              ),
                              hintText: user.role,
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
                            onPressed: (){save(username, email, phone, role);},
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
                                          deleteUser(this.user.username);
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
