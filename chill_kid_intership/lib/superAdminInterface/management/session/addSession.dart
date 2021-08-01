
import 'package:chill_kid_intership/model/Session.dart';
import 'package:chill_kid_intership/superAdminInterface/management/session/listSession.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AddSession extends StatefulWidget {
  @override
  _AddSessionState createState() => _AddSessionState();
}

class _AddSessionState extends State<AddSession> {
  final _formKey = GlobalKey<FormState>();
  var url = Uri.parse('http://192.168.43.61:4000/chillKid/addSession');
  Future save() async {
    var res = await http.post(url,
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'title': session.title,
          'price': session.price,
          'description': session.description  ,

        });
    print(res.body);



    if (res.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Session ajoutée avec succée",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb:  4,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0

      );
      Navigator.push(context, new MaterialPageRoute(builder: (context)=>sessionList()));
    } else {
      print('Request failed with status: ${res.statusCode}.');
      Fluttertoast.showToast(
          msg: "Veuillez réessayer",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0

      );
    }

  }

  Session session = Session('', '','');
  bool vis = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Session' , style: TextStyle(color: Colors.white , fontSize: 16),),
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
          ),
        ),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Form(
                  key: _formKey,
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
                              controller: TextEditingController(text: session.title),
                              onChanged: (value) {
                                session.title = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'title';
                                } else if (RegExp(
                                    r"^[a-zA-Z0-9]")
                                    .hasMatch(value)) {
                                  return null;
                                } else {
                                  return 'titre';
                                }
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.blue,
                                  ),
                                  hintText: 'Enter session',
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
                              controller: TextEditingController(text: session.price),
                              onChanged: (value) {
                                session.price = value;
                              },
                              validator: (value) {
                                if (value.isEmpty  ) {
                                  return 'price';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.phone_android_sharp,
                                    color: Colors.blue,
                                  ),
                                  hintText: 'Prix',
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
                              controller: TextEditingController(text: session.description),
                              onChanged: (value) {
                                session.description = value;
                              },
                              validator: (value) {
                                if (value.isEmpty  ) {
                                  return 'description';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.group,
                                    color: Colors.blue,
                                  ),
                                  hintText: 'Description ',
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
                            padding: EdgeInsets.fromLTRB(55, 16, 16, 0),
                            child: Container(
                              height: 50,
                              width: 400,
                              child: FlatButton(
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0)),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      save();
                                    } else {
                                      print("Veuillez ressayer plus tard");
                                    }
                                  },
                                  child: Text(
                                    "Ajouter une session",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  )),
                            ),
                          ),



                        ],
                      ),
                    ],
                  )

              ),
            )
          ],
        ));
  }
}