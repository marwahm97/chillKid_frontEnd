import 'package:chill_kid_intership/forgetPassword/components/already_have_an_account_acheck.dart';
import 'package:flutter/material.dart';
import 'package:chill_kid_intership/authentication_authorization/Signin.dart';
import 'file:///C:/Users/LENOVO/AndroidStudioProjects/chill_kid_intership/lib/model/User.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
          'phone': user.phone,
          'role': user.role,
          'password': user.password,
        });
    print(res.body);



    if (res.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Welcome",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0

      );
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Signin()));
    } else {
      print('Request failed with status: ${res.statusCode}.');
      Fluttertoast.showToast(
          msg: "Veuillez reéssayer plus tard",
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
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80,
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
                              controller: TextEditingController(text: user.username),
                              onChanged: (value) {
                                user.username = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Ce champ ne peut pas etre vide';
                                } else if (RegExp(
                                    r"^[a-zA-Z0-9]")
                                    .hasMatch(value)) {
                                  return null;
                                } else {
                                  return 'Veuillez entrer votre nom';
                                }
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.blue,
                                  ),
                                  hintText: "Nom d'utilisateur",
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
                                  return 'Ce champ peut pas etre vide';
                                } else if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return null;
                                } else {
                                  return 'Veuillez entrer votre email';
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
                              controller: TextEditingController(text: user.phone),
                              onChanged: (value) {
                                user.phone = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Ce champ ne peut pas etre vide';
                                } else if (RegExp(
                                    r"^[a-zA-Z0-9+ ]")
                                    .hasMatch(value)) {
                                  return null;
                                } else {
                                  return 'Veuillez entrer votre numero du téléphone';
                                }
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.phone_android_sharp,
                                    color: Colors.blue,
                                  ),
                                  hintText: "Numéro de téléphone",
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
                                    if (value.isEmpty || value != 'member') {
                                      return 'Role invalide';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.group,
                                        color: Colors.blue,
                                      ),
                                      hintText: 'Veuillez entrer votre role : member',
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
                                  hintText: 'Mot de passe',
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
                                    "S'inscrire",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  )),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          AlreadyHaveAnAccountCheck(
                            login: false,
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Signin();
                                  },
                                ),
                              );
                            },
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
