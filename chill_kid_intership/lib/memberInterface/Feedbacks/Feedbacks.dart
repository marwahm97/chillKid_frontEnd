
import 'package:chill_kid_intership/model/FeedB.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'app_header.dart';
import 'custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;






class AddFeedback extends StatefulWidget {
  @override
  _AddFeedbackState createState() => _AddFeedbackState();
}

class _AddFeedbackState extends State<AddFeedback> {
  final _formKey = GlobalKey<FormState>();
  var url = Uri.parse('http://192.168.43.61:4000/chillKid/addFeedbacks');
  Future save() async {
    var res = await http.post(url,
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, dynamic>{
           'username': feedB.username,
          'rate': feedB.rate,
          'comment': feedB.comment  ,

        });
    print(res.body);



    if (res.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Feedback ajouté avec succée",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb:  4,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0

        );
      Navigator.push(
           context, new MaterialPageRoute(builder: (context) => AddFeedback()));
    } else {
      print('Request failed with status: ${res.statusCode}.');

    }

  }

  FeedB feedB = FeedB( '', '', '');


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AppHeader(),

            Positioned(
                top: -380,
                left: -187,
                child: Opacity(
                  opacity: 0.9,

                )
            ),
            Form(
              key: _formKey,
              child:SafeArea(
                child: Padding (
                  padding: EdgeInsets.all(20),
                  child: Column(
                      children: [
                        CustomAppBar(),
                        SizedBox(height:40),


                        SizedBox(height:180),
                        Text(
                          'Member',
                          style: TextStyle(
                              color:Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Divider(
                          color: Colors.blue,
                        ),


                        SizedBox(height:40),


                        SizedBox(height: 20),
                       Text('Noter maintenant cette application' ,
                             style:TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(height:40),


                        SizedBox(height: 20),
                        SmoothStarRating(
                          allowHalfRating: false,
                          onRated: (double rating) {
                            feedB.rate = (rating.round()).toString();
                          },
                          starCount : 5,
                          size: 45,
                          isReadOnly: false,
                          spacing: 10,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.4),
                              boxShadow: [ BoxShadow(
                                  blurRadius:15,
                                  //offset: const offset(0.0, 15.0),
                                  color: Color(0xFF29B6F6)
                              ),
                              ]
                          ),
                          child: TextField(
                            controller: TextEditingController(text: feedB.comment),
                            onChanged: (value) {
                              feedB.comment = value;
                            },
                            textInputAction:  TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            maxLines: 2,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Comment',
                                hintStyle: TextStyle(
                                    color: Color(0xFF29B6F6)
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        RaisedButton(
                          color: Colors.blue,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              save();
                            } else {
                              print("Impossible d'envoyer votre note");
                            }
                          },
                          child: Text("Soumettre !!", style: TextStyle(color: Colors.white, fontSize:15, ),),
                        )



                      ]
                  ),
                )
            ), )

          ],
        ),
      ),
    );
  }

}


