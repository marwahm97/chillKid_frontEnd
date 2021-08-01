import 'package:chill_kid_intership/model/Child.dart';
import 'package:chill_kid_intership/superAdminInterface/management/child/list_child.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddChild extends StatefulWidget {
  @override
  _AddChildState createState() => _AddChildState();
}

class _AddChildState extends State<AddChild> {
  final _formKey = GlobalKey<FormState>();
  var url = Uri.parse('http://192.168.43.61:4000/chillKid/addChild');
  Future save() async {
    var res = await http.post(url,
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'childName': child.childName,
          'dateOfBirth': child.dateOfBirth,
          'parent': child.parent  ,
          'state': child.state,

        });
    print(res.body);



    if (res.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Enfant ajouté avec succée",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb:  4,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0

      );
      Navigator.push(context, new MaterialPageRoute(builder: (context)=>listChild()));
    } else {
      print('Request failed with status: ${res.statusCode}.');
      Fluttertoast.showToast(
          msg: "Veuillez réessayer",
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

  Child child = Child('', '','','');
bool state = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Enfant' , style: TextStyle(color: Colors.white ),),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color:
              Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context)=>listChild()));
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
                              controller: TextEditingController(text: child.childName),
                              onChanged: (value) {
                                child.childName = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Ce champ ne peut pas etre vide';
                                } else if (RegExp(
                                    r"^[a-zA-Z0-9]")
                                    .hasMatch(value)) {
                                  return null;
                                } else {
                                  return "Veuillez vérifier la validité de ce champ";
                                }
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.child_care,
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
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              onTap: (){
                                setState(() {
                                  selectDate(context);
                                });
                              },

                              controller: TextEditingController(text: child.dateOfBirth = ("${_date.year}-${_date.month}-${_date.day}")),

                              onChanged: (value) {
                                child.dateOfBirth = value;

                              },
                              validator: (value) {
                                if (value.isEmpty  ) {
                                  return 'Ce champ ne peut pas etre vide';
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
                              controller: TextEditingController(text: child.parent),
                              onChanged: (value) {
                                child.parent = value;
                              },
                              validator: (value) {
                                if (value.isEmpty  ) {
                                  return 'Ce champ ne peut pas etre vide';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.blue,
                                  ),
                                  hintText: 'parent',
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
                            child:  Row(
                              children: [
                                SizedBox(width: 120,),
                                Text("Statut : ", style: TextStyle(fontSize: 15),),
                                SizedBox(width: 15,),
                                Transform.scale(
                                    scale: 1,
                                    child: CupertinoSwitch(
                                      value: state,
                                      onChanged: (bool val) {
                                        setState(() {
                                          state = !state;
                                        });
                                        val = state;
                                        child.state = val.toString();
                                      },
                                    )),

                              ],
                            ) ,

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
                                      print("Veuillez réessayer");
                                    }
                                  },
                                  child: Text(
                                    "Ajouter un enfant",
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