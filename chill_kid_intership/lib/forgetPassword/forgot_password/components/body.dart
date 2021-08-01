import 'package:chill_kid_intership/forgetPassword/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:chill_kid_intership/authentication_authorization/Signin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'file:///C:/Users/LENOVO/AndroidStudioProjects/chill_kid_intership/lib/model/User.dart';
import 'package:http/http.dart' as http;


class Body extends StatefulWidget {
   Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
   final _formKey = GlobalKey<FormState>();

   var url = Uri.parse("http://192.168.43.61:4000/api/password-reset");

   Future save() async {
     var res = await http.post(url,
         headers: <String, String>{
           'Context-Type': 'application/json;charSet=UTF-8'
         },
         body: <String, String>{
           'email': user.email,

         });

     print(res.body);

     if (res.statusCode == 200) {

       Navigator.push(context, new MaterialPageRoute(builder: (context) => Signin()));
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
                      SizedBox(height: 80),
                      new Container(
                        child: new Image.asset('assets/chill-kid-logo-bleu.png'),
                        height: 80,
                        width: 200,
                      ),
                      SizedBox(height: 20),
                      new Container(
                        child: Text("Entrer votre email\net nous allons vous envoyer un \nlien pour réinitialiser votre mot de passe",
                          style: TextStyle(color: Colors.grey[400], fontSize: 13),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 80,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: user.email),
                          onChanged: (value) {
                            user.email = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Ce champ ne peut pas etre vide';
                            } else if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return 'Veuillez vérifier la validité de votre email';
                            }
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.blue,
                              ),
                              hintText: 'Email',
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

                      SizedBox(height: 40,),
                      RoundedButton(
                        text: "Envoyer",
                        press: (){
                          if (_formKey.currentState.validate()) {
                            save();
                          } else {
                            print("Veuillez réessayer plus tard");
                          }
                        },
                      ),


                      SizedBox(height: size.height * 0.03),

                    ]
          )
        ],
      ),
              )
      )
      ]
      )
    );

  }
}

