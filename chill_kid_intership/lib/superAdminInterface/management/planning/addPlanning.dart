import 'package:chill_kid_intership/model/Planning.dart';
import 'package:chill_kid_intership/superAdminInterface/management/planning/listPlanning.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class addPlanning extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<addPlanning> {
  final _formKey = GlobalKey<FormState>();

var url = Uri.parse ("http://192.168.43.61:4000/auth/user/login/getUserByRole/coach");
List planningData = List();

  Future<String> getCoachData() async {
    var res  = await http.get((url),
                headers: {"Accept": "application/json" });
    var resBody = json.decode(res.body);
    setState(() {
      planningData = resBody;
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
    this.getCoachData();
    this.getSessionData();
  }
  var url2 = Uri.parse('http://192.168.43.61:4000/chillKid/addPlanning');
  Future save() async {
    var res = await http.post(url2,
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'session': planning.session,
          'coach': planning.coach,
          'date': planning.date  ,
          'time': planning.time


        });
    print(res.body);



    if (res.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Plannification ajoutée avec succée",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb:  4,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0

      );
      Navigator.push(context, new MaterialPageRoute(builder: (context)=>planningList()));

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

  DateTime _date =DateTime.now();
  TimeOfDay _time = TimeOfDay.now() ;

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
  Future <Null> selectTime(BuildContext context) async{
    TimeOfDay timePick = await showTimePicker(
        context: context,
        initialTime: _time,
        builder: (BuildContext context, Widget child){
          return Theme(
              data: ThemeData(
                  primaryColor: Colors.blue,
                  accentColor: Colors.blue
              ),
              child: child);
        }
    );
    if(timePick != null){
      setState(() {
        _time = timePick;

      });
    }
  }

  Planning planning = Planning('', '','', '');
  String choosenSession;
  String choosenCoach;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Plannification' , style: TextStyle(color: Colors.white , fontSize: 16),),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color:
              Colors.white,
            ),
            onPressed: () {
              Navigator.push((context), MaterialPageRoute(
                  builder: (context ) {
                    return planningList();
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
                                    planning.session = choosenSession;
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
                          Padding(
                            padding: const EdgeInsets.only(left: 50, right: 16, top: 16),
                            child: Container(
                                padding: EdgeInsets.only(bottom: 7, left: 16.0, right: 16.0, top: 7),
                                child:
                              DropdownButton(
                                  hint: Text("Selectionner un coach"),
                                  dropdownColor: Colors.white,
                                  elevation: 5,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 36.0,
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  value: choosenCoach,
                                  style: TextStyle(color: Colors.black),
                                  onChanged: (newValue){
                                    setState(() {
                                      choosenCoach = newValue;
                                      print(choosenCoach);

                                    });
                                    planning.coach = choosenCoach;
                                  },

                                  items: planningData.map((item) {

                                      return  DropdownMenuItem(
                                        child: new Text(item['username']),
                                        value: item['username']

                                    );


                                  }).toList(),


                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue, width: 1.0),
                                    borderRadius: BorderRadius.circular(16.0)
                                )

                            ),),
                          Padding(
                            padding: const EdgeInsets.only(left: 50, right: 16, top: 16),
                            child: TextFormField(
                              onTap: (){
                                setState(() {
                                  selectDate(context);
                                });
                              },

                              controller: TextEditingController(text: planning.date = ("${_date.year}-${_date.month}-${_date.day}")),

                              onChanged: (value) {
                                planning.date = value;

                              },
                              validator: (value) {
                                if (value.isEmpty  ) {
                                  return 'Date';
                                }
                                return null;
                              },
                              decoration: InputDecoration(

                                  hintText: ("Sélectionner une date"),
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
                            child: TextFormField(
                              onTap: (){
                                setState(() {
                                  selectTime(context);
                                });
                              },

                              controller: TextEditingController(text: planning.time = ("${_time.hour}:${_time.minute}")),

                              onChanged: (value) {
                                planning.time = value;

                              },
                              validator: (value) {
                                if (value.isEmpty  ) {
                                  return 'Time';
                                }
                                return null;
                              },
                              decoration: InputDecoration(

                                  hintText: ("Sélectionner un horaire"),
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
                                      print("Impossible d'ajouter la plannification");
                                    }
                                  },
                                  child: Text(
                                    "Ajouter une plannification",
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
