
import 'package:chill_kid_intership/superAdminInterface/management/event/listEvent.dart';
import 'package:flutter/material.dart';
import 'package:chill_kid_intership/model/Event.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;




class eventDetail extends StatefulWidget {

  Event event;
  eventDetail(this.event);
  @override
  _eventDetailState createState() => _eventDetailState(this.event);
}

class _eventDetailState extends State<eventDetail> {
  Event event;

  _eventDetailState(this.event);



  Future<Event> deleteEvent(String title) async {
    final http.Response response = await http.delete(
      Uri.parse('http://192.168.43.61:4000/chillKid/deletEventByTitle/${this.event.title}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return
        Navigator.push(context, new MaterialPageRoute(builder: (context)=>eventList()));
    } else {
      throw Exception('Failed to delete event');
    }
  }

  String title;
  String date;
  String description;

  DateTime _date = DateTime.now();


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

  Future <Event>save( title, date,  description) {

    http.put(Uri.parse("http://192.168.43.61:4000/chillKid/putEvent/${this.event.title}"),
        headers:<String,String>{'Context-Type':'application/json;charset=UTF-8'},body:<String,String>
        {'title':title,'date': date, 'description': description  });

    Fluttertoast.showToast(
        msg: "Evènement modifié avec succée",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.blue,
        textColor: Colors.green,
        fontSize: 16.0

    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title:Text(event.title),
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
                          controller: TextEditingController(text: title),
                          onChanged: (value) {
                            title = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Le titre ne peut pas etre vide';
                            } else if (RegExp(
                                r"^[a-zA-Z0-9]")
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return 'Entrer un titre valide';
                            }
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.title,
                                color: Colors.blue,
                              ),
                              hintText: event.title,
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
                          controller: TextEditingController(text: description),
                          onChanged: (value) {
                            description = value;
                          },
                          validator: (value) {
                            if (value.isEmpty  ) {
                              return 'Description ne peut pas etre vide';
                            }
                            return null;
                          },

                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.description,
                                color: Colors.blue,
                              ),
                              hintText: event.description,
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
                            onPressed: (){save(title, date, description);},
                            child: Row(
                              children: [
                                Icon(Icons.edit, color: Colors.blue,),
                                SizedBox(width: 15,),
                                Text("Modifier", style: TextStyle(color: Colors.blue),),
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
                                            deleteEvent(this.event.title);
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

          )
      ),
    );
  }
}
