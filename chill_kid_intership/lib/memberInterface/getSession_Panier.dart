import 'package:chill_kid_intership/memberInterface/Session/shop_screen.dart';
import 'package:chill_kid_intership/memberInterface/home.dart';
import 'package:chill_kid_intership/model/Panier.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';




class PanierList extends StatefulWidget {
  @override
  _PanierListState createState() => _PanierListState();
}

class _PanierListState extends State<PanierList> {
  List<Panier> paniers= [];
  Panier panier ;
  var url = Uri.parse('http://192.168.43.61:4000/chillKid/getPanier');
  Future getAll() async{
    var data = await http.get(url);
    var jsonData = json.decode(data.body);

    for (var e in jsonData) {

      paniers.add(Panier(e['name'], e['price'], e['img']));}

    return paniers;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:Text('Panier', style: TextStyle(color: Colors.white, fontSize: 16),),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color:
            Colors.white,
          ),
          onPressed: () {
            Navigator.push((context), MaterialPageRoute(
                builder: (context ) {
                  return HomePage();
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
                          onTap: (){},
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child:
                                  Row( children: [
                                    SizedBox(height: 15,),
                                    Image(image: AssetImage(snapshot.data[index].img), height: 100, width: 100,),
                                    SizedBox(width: 15,),
                                    Column(
                                      children: [
                                        Text(snapshot.data[index].name, style: TextStyle(color: Colors.black87, fontSize: 15), ),

                                        SizedBox(height: 10,),


                                        Text(snapshot.data[index].price, style: TextStyle(color: Colors.black87, fontSize: 15),),
                                        SizedBox(height: 10,),
                                        OutlineButton(
                                          padding: EdgeInsets.symmetric(horizontal: 50),
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20)),
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
                                          child: Row(
                                            children: [
                                              Icon(Icons.shopping_basket, color: Colors.blue,),
                                              SizedBox(width: 15,),
                                              Text("Réserver", style: TextStyle(color: Colors.blue),),
                                            ],
                                          ),
                                        ),


                                      ],
                                    )









                                  ],)


                              ),
                              SizedBox(height: 8,),
                            ],
                          )

                      );


                    }
                );}
            }
        ),
      ),

    );

  }








}