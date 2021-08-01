import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chill_kid_intership/model/Event.dart';

import 'listEvent.dart';



class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _formKey = GlobalKey<FormState>();
  var url = Uri.parse('http://192.168.43.61:4000/chillKid/addEvent');
  Future save() async {
    var res = await http.post(url,
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, dynamic>{
          'title': event.title,
          'date': event.date,
          'description': event.description  ,


        });
    print(res.body);



    if (res.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Evènement ajouté avec succée",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb:  4,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0

      );
      /*Navigator.push(
           context, new MaterialPageRoute(builder: (context) => Signin()));*/
    } else {
      print('Request failed with status: ${res.statusCode}.');
      Fluttertoast.showToast(
          msg: "Veuillez ressayer plus tard",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0

      );
    }

  }

  DateTime _date =DateTime.now();

  Future <Null> selectDate(BuildContext context) async{
    DateTime datePick = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime (1950) /*(DateTime.now().year-5)*/,
      lastDate: DateTime (2050)        /*(DateTime.now().year+10)*/,
      builder: (BuildContext context, Widget child){
        return Theme(
            data: ThemeData(
              primaryColor: Colors.blue,
              accentColor: Colors.blue
            ),
            child: child);
      }
    );
    if(datePick != null && datePick != _date){
      setState(() {
        _date = datePick;
        print(_date.toString());
      });
    }
  }

  Event event = Event('', '','');


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Evènement' , style: TextStyle(color: Colors.white , fontSize: 16),),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color:
              Colors.white,
            ),
            onPressed: () {
              Navigator.push((context), MaterialPageRoute(
                  builder: (context ) {
                    return eventList();
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
                              controller: TextEditingController(text: event.title),
                              onChanged: (value) {
                                event.title = value;
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
                                    Icons.title,
                                    color: Colors.blue,
                                  ),
                                  hintText: 'Titre',
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
                              onTap: (){
                                setState(() {
                                  selectDate(context);
                                });
                              },

                              controller: TextEditingController(text: event.date = ("${_date.year}-${_date.month}-${_date.day}")),

                              onChanged: (value) {
                                event.date = value;

                              },
                              validator: (value) {
                                if (value.isEmpty  ) {
                                  return 'Date';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.date_range_sharp,
                                    color: Colors.blue,
                                  ),
                                  hintText: (_date.toString()),
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
                              textInputAction:  TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                              controller: TextEditingController(text: event.description),
                              onChanged: (value) {
                                event.description = value;
                              },
                              validator: (value) {
                                if (value.isEmpty  ) {
                                  return 'Entrer une description';
                                }
                                return null;
                              },

                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.description,
                                    color: Colors.blue,
                                  ),
                                  hintText: 'Description',
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
                                      print("Impossible d'ajouter l'évènement");
                                    }
                                  },
                                  child: Text(
                                    "Ajouter un  évènement",
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