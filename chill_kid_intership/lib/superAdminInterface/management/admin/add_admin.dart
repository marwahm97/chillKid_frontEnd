
import 'package:chill_kid_intership/superAdminInterface/management/coach/listCoach.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'file:///C:/Users/LENOVO/AndroidStudioProjects/chill_kid_intership/lib/model/User.dart';




class AddAdmin extends StatefulWidget {
  @override
  _AddAdminState createState() => _AddAdminState();
}

class _AddAdminState extends State<AddAdmin> {
  final _formKey = GlobalKey<FormState>();
  var url = Uri.parse('http://192.168.43.61:4000/auth/user/register');
  Future save() async {
    var res = await http.post(url,
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'username': user.username,
          'email': user.email,
          'phone': user.phone  ,
          'role': user.role,
          'password': user.password,
        });
    print(res.body);



    if (res.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Admin ajouté avec succée",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb:  4,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0

      );
      Navigator.push(context, new MaterialPageRoute(builder: (context)=>listCoach()));
    } else {
      print('Request failed with status: ${res.statusCode}.');
      Fluttertoast.showToast(
          msg: "Veuillez réessayer plus tard",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0

      );
    }

  }

  User user = User('', '','', '','');
 bool vis = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Admin' , style: TextStyle(color: Colors.white , fontSize: 16),),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color:
              Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context)=>listCoach()));
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
                              controller: TextEditingController(text: user.username),
                              onChanged: (value) {
                                user.username = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Nom';
                                } else if (RegExp(
                                    r"^[a-zA-Z0-9]")
                                    .hasMatch(value)) {
                                  return null;
                                } else {
                                  return 'Enter valid username';
                                }
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.blue,
                                  ),
                                  hintText: 'Enter Username',
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
                              controller: TextEditingController(text: user.email),
                              onChanged: (value) {
                                user.email = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Email';
                                } else if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return null;
                                } else {
                                  return 'Enter valid email';
                                }
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.blue,
                                  ),
                                  hintText: 'Enter Email',
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
                              controller: TextEditingController(text: user.phone),
                              onChanged: (value) {
                                user.phone = value;
                              },
                              validator: (value) {
                                if (value.isEmpty  ) {
                                  return 'Numéro de téléphone';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.phone_android_sharp,
                                    color: Colors.blue,
                                  ),
                                  hintText: 'Phone',
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
                              controller: TextEditingController(text: user.role),
                              onChanged: (value) {
                                user.role = value;
                              },
                              validator: (value) {
                                if (value.isEmpty  ) {
                                  return 'Role';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.group,
                                    color: Colors.blue,
                                  ),
                                  hintText: 'Role ',
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
                              controller: TextEditingController(text: user.password),
                              onChanged: (value) {
                                user.password = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Mot de passe';
                                }
                                return null;
                              },
                              obscureText: vis,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    color: Colors.blue,
                                    icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        vis = !vis;
                                      });
                                    },
                                  ),
                                  icon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.blue,
                                  ),
                                  hintText: 'Enter Password',
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
                                      print("not ok");
                                    }
                                  },
                                  child: Text(
                                    "Ajouter un  entraineur",
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