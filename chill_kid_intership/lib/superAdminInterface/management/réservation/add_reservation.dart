import 'dart:convert';
import 'package:chill_kid_intership/model/Booking.dart';
import 'package:chill_kid_intership/superAdminInterface/management/r%C3%A9servation/list_reservation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class addBooking extends StatefulWidget {
  @override
  _addBookingState createState() => _addBookingState();
}

class _addBookingState extends State<addBooking> {
  String choosenChild, choosenSession;
  Booking booking;


  final _formKey = GlobalKey<FormState>();

  var url = Uri.parse ("http://192.168.43.61:4000/chillKid/getChild");
  List children = List();

  Future<String> getChild() async {
    var res  = await http.get((url),
        headers: {"Accept": "application/json" });
    var resBody = json.decode(res.body);
    setState(() {
      children = resBody;
    });
    print (resBody);
    return ("Success");
  }

  var url3 = Uri.parse("http://192.168.43.61:4000/chillKid/getSession");
  List sessionData = List();
  Future<String> getSessionData() async {
    var res  = await http.get((url3),
        headers: {"Accept": "application/json" });
    var resBody = json.decode(res.body);
    setState(() {
      sessionData = resBody;
    });
    print (resBody);
    return ("Success");
  }

  @override
  void initState() {
    super.initState();
    this.getChild();
    this.getSessionData();
  }
  var url2 = Uri.parse('http://192.168.43.61:4000/chillKid/addBooking');
  Future save() async {
    var res = await http.post(url2,
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'name': booking.name,
          'email': booking.email,
          'phone': booking.phone,
          'child': booking.child  ,
          'session': booking.session


        });
    print(res.body);



    if (res.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Réservation envoyée avec succée",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb:  4,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0

      );
      Navigator.push(context, new MaterialPageRoute(builder: (context)=>listBooking()));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Réservation',
            style: TextStyle(color: Colors.white),),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color:
              Colors.white,
            ),
            onPressed: () {
              Navigator.push((context), MaterialPageRoute(
                  builder: (context ) {
                    return listBooking();
                  }));
            },
          ),
        ),
        body:    Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    children: [
                      SizedBox(height: 50,),
                      new Container(

                        child: new Image.asset('assets/chill-kid-logo-bleu.png'),
                        height: 80,
                        width: 200,
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Text('Merci de vouloir remplir ce formulaire',
                          style: TextStyle(fontWeight: FontWeight.bold),),),
                      SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: booking.name),
                          onChanged: (value) {
                            booking.name = value;
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
                              hintText: 'Nom',
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
                          controller: TextEditingController(text: booking.email),
                          onChanged: (value) {
                            booking.email = value;
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
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: booking.phone),
                          onChanged: (value) {
                            booking.phone = value;
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
                              hintText: 'Numéro de téléphone',
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
                          controller: TextEditingController(text: booking.child),
                          onChanged: (value) {
                            booking.child = value;
                          },
                          validator: (value) {
                            if (value.isEmpty  ) {
                              return 'Ce champ ne peut pas etre vide';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.phone_android_sharp,
                                color: Colors.blue,
                              ),
                              hintText: "Nom d'enfant",
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
                        padding: const EdgeInsets.only(left: 50, right: 16, top: 16),
                        child: Container(
                            padding: EdgeInsets.only(bottom: 7, left: 16.0, right: 16.0, top: 7),
                            child:
                            DropdownButton(
                              hint: Text("Selectionner une session"),
                              dropdownColor: Colors.white,
                              elevation: 5,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36.0,
                              isExpanded: true,
                              underline: SizedBox(),
                              value: choosenSession,
                              style: TextStyle(color: Colors.black),
                              onChanged: (newValue){
                                setState(() {
                                  choosenSession = newValue;
                                  print(choosenSession);

                                });
                                booking.session = choosenSession;
                              },

                              items: sessionData.map((item) {

                                return  DropdownMenuItem(
                                    child: new Text(item['title'].toString()),
                                    value: item['title']

                                );


                              }).toList(),


                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 1.0),
                                borderRadius: BorderRadius.circular(16.0)
                            )

                        ),),
                      SizedBox(height: 30,),
                      RaisedButton(

                          onPressed: (){
                            showDialog(
                                context: context,
                                builder: (context)=> AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text('Réservation'),
                                  content: Text('Voulez vous vraiment continuer!!', style: TextStyle(color: Colors.black),),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Oui', style: TextStyle(color: Colors.blue),),
                                      onPressed: (){

                                      },
                                    ),
                                    FlatButton(
                                      child: Text('Non', style: TextStyle(color: Colors.blue),),
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                    ),

                                  ],
                                ));
                          },
                          color: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Icon(Icons.shopping_basket, color: Colors.white,),
                              SizedBox(width: 15,),
                              Text("Réserver", style: TextStyle(color: Colors.white),),
                            ],
                          )
                      )



                    ],
                  )

              ),
            )
          ],
        )


    );
  }
}