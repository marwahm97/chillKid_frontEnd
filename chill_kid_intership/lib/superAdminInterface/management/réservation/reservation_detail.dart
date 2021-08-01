
import 'dart:convert';
import 'package:chill_kid_intership/model/Booking.dart';
import 'package:chill_kid_intership/superAdminInterface/management/r%C3%A9servation/list_reservation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class bookingDetail extends StatefulWidget {

  Booking booking;
  bookingDetail(this.booking);
  @override
  _bookingDetailState createState() => _bookingDetailState(this.booking);
}

class _bookingDetailState extends State<bookingDetail> {
  Booking booking;
  String choosenChild, choosenSession;


  _bookingDetailState(this.booking);
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
    this.getSessionData();
  }



  Future<Booking> deleteBooking(String name) async {
    final http.Response response = await http.delete(
      Uri.parse('http://192.168.43.61:4000/auth/user/login/deletEventByTitle/${this.booking.name}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return
        Navigator.push(context, new MaterialPageRoute(builder: (context)=>(listBooking())));
    } else {

      throw Exception('Failed to delete child');
    }
  }

  String name;
  String email;
  String phone;
  String child;
  String session;

  Future <Booking>save( name, email, phone , child ,session) {

    http.put(Uri.parse("http://192.168.43.61:4000/chillKid/putBooking/${this.booking.name}"),
        headers:<String,String>{'Context-Type':'application/json;charset=UTF-8'},body:<String,String>
        {'name':name,'email': email, 'phone': phone, 'child': child, 'session': session  });

    Navigator.push(context, new MaterialPageRoute(builder: (context)=>listBooking()));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title:Text('Réservation'),
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
                          controller: TextEditingController(text: name),
                          onChanged: (value) {
                            name = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Ce champ ne peut pas etre vide';
                            } else if (RegExp(
                                r"^[a-zA-Z0-9]")
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return 'Veuilez vérifier la validité de ce champ';
                            }
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.title,
                                color: Colors.blue,
                              ),
                              hintText: booking.name,
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
                              return "Ce champ ne peut pas etre vide";
                            } else if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return 'Veuillez vérifier la validité de ce champ';
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
                              return 'Ce champ ne peut pas etre vide';
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
                          controller: TextEditingController(text: child),
                          onChanged: (value) {
                            child = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Ce champ ne peut pas etre vide';
                            } else if (RegExp(
                                r"^[a-zA-Z0-9]")
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return 'Veuilez vérifier la validité de ce champ';
                            }
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.title,
                                color: Colors.blue,
                              ),
                              hintText: booking.name,
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlineButton(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: (){save(name, email, phone, child, session);},
                            child: Row(
                              children: [
                                Icon(Icons.edit, color: Colors.blue,),
                                SizedBox(width: 15,),
                                Text("Edit", style: TextStyle(color: Colors.blue),),
                              ],
                            ),
                          ),
                          RaisedButton(
                              onPressed: () {
                                showDialog(

                                    context: context,
                                    builder: (context)=> AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Text('Attention'),
                                      content: Text('Voulez vous vraiment continuer!!', style: TextStyle(color: Colors.black),),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('Oui', style: TextStyle(color: Colors.blue),),
                                          onPressed: (){
                                            deleteBooking(this.booking.name);
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
                                  Icon(Icons.delete, color: Colors.white,),
                                  SizedBox(width: 15,),
                                  Text("Delete", style: TextStyle(color: Colors.white),),
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
