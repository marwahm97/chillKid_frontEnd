
import 'package:chill_kid_intership/model/Booking.dart';
import 'package:chill_kid_intership/superAdminInterface/management/r%C3%A9servation/add_reservation.dart';
import 'package:chill_kid_intership/superAdminInterface/management/r%C3%A9servation/reservation_detail.dart';
import 'package:chill_kid_intership/superAdminInterface/utils/Home.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';




class listBooking extends StatefulWidget {
  @override
  _listBookingState createState() => _listBookingState();
}

class _listBookingState extends State<listBooking> {
  List<Booking> bookings = [];
  Booking booking ;
  var url = Uri.parse('http://192.168.43.61:4000/chillKid/getBooking');
  Future getAll() async{
    var data = await http.get(url);
    var jsonData = json.decode(data.body);

    for (var c in jsonData) {

      bookings.add(Booking( c['name'], c['email'],c['phone'], c['child'], c['session']));}
    return bookings;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:Text('Réservations', style: TextStyle(color: Colors.white, fontSize: 16),),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color:
              Colors.white,
            ),
            onPressed: () {
              Navigator.push((context), MaterialPageRoute(
                  builder: (context ) {
                    return HomePageSAdmin();
                  }));
            },
          ),
          actions: <Widget>[
            Padding(padding: EdgeInsets.only(right: 20)),


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
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context,int index){

                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context,new MaterialPageRoute(builder: (context)=>bookingDetail(snapshot.data[index])));
                        },
                        child: Card(
                            color: Colors.white,
                            child:
                            Column( children: [
                              SizedBox(height: 20,),
                              Row(children: [
                                SizedBox(width: 5,),
                                Text('Nom:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold )),
                                SizedBox(width: 20,),
                                Text(snapshot.data[index].name, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                              ],),
                              SizedBox(height: 10,),
                              Row(children: [
                                SizedBox(width: 5,),
                                Text('Email:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold )),
                                SizedBox(width: 20,),
                                Text(snapshot.data[index].email, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                              ],),
                              SizedBox(height: 10,),
                              Row(children: [
                                SizedBox(width: 5,),
                                Text('Numéro de télèphone:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold )),
                                SizedBox(width: 20,),
                                Text(snapshot.data[index].phone, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                              ],),
                              SizedBox(height: 10,),
                              Row(children: [
                                SizedBox(width: 5,),
                                Text('Enfant:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold )),
                                SizedBox(width: 20,),
                                Text(snapshot.data[index].name, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                              ],),
                              SizedBox(height: 10,),
                              Row(children: [
                                SizedBox(width: 5,),
                                Text('Session:', style: TextStyle(color: Colors.black, fontSize:15, fontWeight: FontWeight.bold )),
                                SizedBox(width: 20,),
                                Text(snapshot.data[index].session, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
                              ],),


                              SizedBox(height: 10,),


                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){},
                                    child: Icon(Icons.edit, color: Colors.red,),
                                  ),
                                  SizedBox(width: 20,),
                                  GestureDetector(
                                    onTap: (){},
                                    child: Icon(Icons.delete, color: Colors.red,),
                                  ),

                                ],),

                              SizedBox(height: 20,),



                            ],)


                        ),
                      );


                    }
                );}
            }
        ),
      ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){return addBooking();}));
          },
          child:
          Container(child: Icon(Icons.add),
          ),
          backgroundColor: Colors.blue,)

       );

  }








}
