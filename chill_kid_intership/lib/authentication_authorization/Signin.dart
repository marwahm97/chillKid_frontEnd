
import 'dart:convert';

import 'package:chill_kid_intership/forgetPassword/components/already_have_an_account_acheck.dart';
import 'package:chill_kid_intership/forgetPassword/components/forgetPassword.dart';
import 'package:chill_kid_intership/forgetPassword/forgot_password/forgot_password_screen.dart';
import 'package:chill_kid_intership/memberInterface/home.dart';
import 'package:chill_kid_intership/superAdminInterface/utils/Home.dart';
import 'package:flutter/material.dart';
import 'package:chill_kid_intership/authentication_authorization/signup.dart';
import 'file:///C:/Users/LENOVO/AndroidStudioProjects/chill_kid_intership/lib/model/User.dart';
import 'package:http/http.dart' as http;
import 'package:chill_kid_intership/adminInterface/utils/Home.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Signin extends StatefulWidget {


  Signin({Key key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  var url = Uri.parse("http://192.168.43.61:4000/auth/user/login");

  Future save() async {
    var res = await http.post(url,
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'email': user.email,
          'password': user.password
        });

    print(res.body);

    if (res.statusCode == 200) {

         Navigator.push(context, new MaterialPageRoute(builder: (context) => HomePage()));
    } else {
    print('Request failed with status: ${res.statusCode}.');
    Fluttertoast.showToast(
      msg: "Veuillez vérifier vos coordonnées",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.blue,
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
        body: Stack(
          children: [

            Container(
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: ListView(
                  children:[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    new Container(
                      child: new Image.asset('assets/chill-kid-logo-bleu.png'),
                      height: 80,
                      width: 200,
                    ),
                    SizedBox(
                      height: 25,
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
                            return 'Veuillez entrer votre email';
                          } else if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return null;
                          } else {
                            return 'Ce champ ne peut pas etre vide';
                          }
                        },
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            hintText: 'Votre Email',
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
                            return 'Ce champ ne peut pas etre vide';
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
                            hintText: 'Votre Password',
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
                                print("Veuillez réessayer plus tard");
                              }
                            },
                            child: Text(
                              "Se connecter",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ),
                    ),
                    SizedBox(height: 40,),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Signup();

                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                    ForgetPassword(
                      press: (){
                        Navigator.push((context),
                            MaterialPageRoute(
                                builder: (context){
                                  return ForgotPasswordScreen();
                                }
                            ));
                      },
                    )
                  ],
                ),
                  ]
                )
              ),
            )
          ],
        ));
  }
}