import 'dart:convert';
import 'package:chill_kid_intership/model/Planning.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'listPlanning.dart';


class planningDetail extends StatefulWidget {

  Planning planning;
  planningDetail(this.planning);
  @override
  _planningDetailState createState() => _planningDetailState(this.planning);
}

class _planningDetailState extends State<planningDetail> {
  Planning planning;

  _planningDetailState(this.planning);
  final _formKey = GlobalKey<FormState>();
  var url = Uri.parse ("http://192.168.43.61:4000/auth/user/login/getUserByRole/coach");
  List planningData = List();

  Future<String> getCoach() async {
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
    this.getCoach();
    this.getSessionData();
  }

  Future<Planning> deletePlanning(String session) async {
    final http.Response response = await http.delete(
      Uri.parse('http://192.168.43.61:4000/chillKid/deletPlanningBySession/${this.planning.session}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {

      return
        Navigator.push(context, new MaterialPageRoute(builder: (context)=>planningList()));
    } else {
      throw Exception('Failed to delete planning');
    }
  }

  String session;
  String date;
  String coach;
  String time;

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

  Future <Planning>save( session,coach, date, time ) {

    http.put(Uri.parse("http://192.168.43.61:4000/chillKid/putPlanning/${this.planning.session}"),
        headers:<String,String>{'Context-Type':'application/json;charset=UTF-8'},body:<String,String>
        { 'session':session,
          'coach': coach,
          'date': date,
           'time': time

        });

    Fluttertoast.showToast(
        msg: "Plannification modifiée avec succée",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0

    );
  }

  String choosenSession;
  String choosenCoach;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title:Text(planning.session),
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
            ),),

          body:Stack(

              children: [
                Container(
                  alignment: Alignment.center,
                  child: Form(
                      key: _formKey,
                      child:ListView(
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
                                      hint: Text(planning.session),
                                      dropdownColor: Colors.grey[100],
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

                                        });
                                        session = choosenSession;
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
                                      hint: Text(planning.coach),
                                      dropdownColor: Colors.grey[100],
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
                                        coach = choosenCoach;
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

                                  controller: TextEditingController(text: date = ("${_date.year}-${_date.month}-${_date.day}")),

                                  onChanged: (value) {
                                    date = value;

                                  },
                                  validator: (value) {
                                    if (value.isEmpty  ) {
                                      return 'Date ne peut pas etre vide';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: (planning.date),
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

                                  controller: TextEditingController(text: time = ("${_time.hour}:${_time.minute}")),

                                  onChanged: (value) {
                                    time = value;

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
                              SizedBox(height: 20,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  OutlineButton(
                                    padding: EdgeInsets.symmetric(horizontal: 50),
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    onPressed: (){save(session, coach,date, time);},
                                    child: Row(
                                      children: [
                                        Icon(Icons.edit, color: Colors.blue,),
                                        SizedBox(width: 15,),
                                        Text("Modifier", style: TextStyle(color: Colors.blue),),
                                      ],
                                    ),
                                  ),
                                  RaisedButton(

                                    onPressed: (){
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
                                                    deletePlanning(this.planning.session);
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
                  ),
                )
              ]




          )
      ),
    );
  }
}