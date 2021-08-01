
import 'package:chill_kid_intership/adminInterface/utils/Home.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../../constants.dart';
import 'file:///C:/Users/LENOVO/AndroidStudioProjects/chill_kid_intership/lib/model/User.dart';




class recentMember extends StatefulWidget {
  @override
  _recentMemberState createState() => _recentMemberState();
}

class _recentMemberState extends State<recentMember> {
  List<User> users = [];
  User user ;
  var url = Uri.parse('http://192.168.100.140:4000/auth/user/getUser');
  Future getAll() async{
    var data = await http.get(url);
    var jsonData = json.decode(data.body);
   for (int i =0 ; i<=5; i++){
    for (var u in jsonData) {
      if(u['role']== 'member') {
        users.add(User( u['username'], u['email'], u['phone'],u['role'], u['password']));}
    }
    return users;
  }}




  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:Text('Membres', style: TextStyle(color: Colors.white, fontSize: 16),),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color:
              Colors.white,
            ),
            onPressed: () {
              Navigator.push((context), MaterialPageRoute(
                  builder: (context ) {
                    return HomePageAdmin();
                  }));
            },
          ),
          actions: <Widget>[
            Padding(padding: EdgeInsets.only(right: 20)),
            GestureDetector(
                child: Icon(Icons.search)
            ),

          ],
        ),
        body: Container(
          child: FutureBuilder(

              future: getAll(),
              builder: (BuildContext context,AsyncSnapshot snapshot){
                if(snapshot.data == null){
                  return Container(child:Center(
                    child: Text("Loading..."),
                  ));
                }else{
                  List data = snapshot.data;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      sortColumnIndex: 0,
                      sortAscending: true,
                      columns: [
                        DataColumn(label: Text("Nom d'utilisateur ", style: TextStyle(color: Colors.black, fontSize: 18),),
                        numeric: false,
                          tooltip: "Nom d'utilisateur"
                        ),
                        DataColumn(label: Text("Téléphone ", style: TextStyle(color: Colors.black, fontSize: 18),),
                            numeric: false,
                            tooltip: "Téléphone"
                        ),

                      ],
                      rows: data.map((e) => DataRow(cells: [
                        DataCell(Container(
                          width: 100,
                          child: Text(user.username,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                       style: TextStyle(fontWeight: FontWeight.w600),),)),
                        DataCell(Container(
                          width: 100,
                          child: Text(user.phone,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.w600),),))
                      ])),
                    )
                  );
                  /*return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context,int index){
                        return GestureDetector(
                          onTap: (){},
                          child: DataTable2(
                            columnSpacing: defaultPadding,
                            minWidth: 600,
                            columns: [
                              DataColumn(
                                label: Text("Nom du membre"),
                              ),
                              DataColumn(
                                label: Text("Téléphone"),
                              ),

                            ],
                            rows: [
                              list.map((item){
                                return DataRow(cells: <DataCell>["username"])
                              })
                        ]
                        ),
                        );


                      }
                  );*/

                }
              }
          ),
        ),

    );

  }








}