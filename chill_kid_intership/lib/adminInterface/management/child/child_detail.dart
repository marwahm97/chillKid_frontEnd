
import 'package:chill_kid_intership/adminInterface/management/child/list_child.dart';
import 'package:chill_kid_intership/model/Child.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;




class childDetail extends StatefulWidget {

  Child child;
  childDetail(this.child);
  @override
  _childDetailState createState() => _childDetailState(this.child);
}

class _childDetailState extends State<childDetail> {
  Child child;

  _childDetailState(this.child);



  Future<Child> deleteChild(String childName) async {
    final http.Response response = await http.delete(
      Uri.parse('http://192.168.43.61:4000/chillKid/deleteChildByName/${this.child.childName}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return
        Navigator.push(context, new MaterialPageRoute(builder: (context)=>listChild()));
    } else {

      throw Exception('Failed to delete child');
    }
  }

  String childName;
  String dateOfBirth;
  String parent;
  String statut;
  bool state;

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

  Future <Child>save( childName, dateOfBirth,  parent, stateChild) {

    http.put(Uri.parse("http://192.168.43.61:4000/chillKid/updateChildByName/${this.child.childName}"),
        headers:<String,String>{'Context-Type':'application/json;charset=UTF-8'},body:<String,String>
        {'childName':childName,'dateOfBirth': dateOfBirth, 'parent': parent, "state": stateChild  });

    Fluttertoast.showToast(
        msg: "Enfant modifié  avec succée",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0

    );
  }
  bool status;
  getState(bool status){
    if (child.state == "true"){
      return status = true;
    }
    else return status =  false;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title:Text(child.childName),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color:
                Colors.white,
              ),
              onPressed: () {
                Navigator.push((context), MaterialPageRoute(
                    builder: (context ) {
                      return listChild();
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
                          controller: TextEditingController(text: childName),
                          onChanged: (value) {
                            childName = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Ce champ ne peut pas etre vide';
                            } else if (RegExp(
                                r"^[a-zA-Z0-9]")
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return 'Veuillez vérifier la validité de ce champ';
                            }
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.title,
                                color: Colors.blue,
                              ),
                              hintText: child.childName,
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

                          controller: TextEditingController(text: dateOfBirth = ("${_date.year}-${_date.month}-${_date.day}")),

                          onChanged: (value) {
                            dateOfBirth = value;

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
                          controller: TextEditingController(text: parent),
                          onChanged: (value) {
                            parent = value;
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
                              hintText: child.parent,
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
                                  value: status = getState(state),
                                  onChanged: (bool val) {
                                    setState(() {
                                      val = !status;
                                    });
                                    child.state = val.toString();
                                    statut= child.state;
                                  },
                                )),

                          ],
                        ) ,

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
                            onPressed: (){save(childName, dateOfBirth, parent,statut);},
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
                                            deleteChild(this.child.childName);
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
