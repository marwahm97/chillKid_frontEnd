import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:chill_kid_intership/authentication_authorization/Signin.dart';
import 'package:url_launcher/url_launcher.dart';
import 'authentication_authorization/Signup.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: double.infinity,
                height: 350.0,
                color: Colors.blue,

              ),
            ),
            SafeArea(
                child: Padding (
                  padding: EdgeInsets.only(left: 10, top: 0, right: 1, ),
                  child: Column(
                      children: [
                        SizedBox(height:120),
                        Image.asset('assets/logo-chill-kid-circle.PNG',
                          width: 800,
                          height: 400,
                        ),


                      ]
                  ),
                )
            ),
            SizedBox(height: 30,),
            SafeArea(child: Padding (
            padding: EdgeInsets.only(left: 40, top: 80, right: 40, ),
             child: Column(
              children: [
                SizedBox(height:250),
                SizedBox(height: 150,),
                Container(
                  padding: EdgeInsets.only(left: 1, top: 0, right: 1, ),
                  child:  MaterialButton(
                   minWidth: double.infinity,
                   height: 60,
                   onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));

                      },
            // defining the shape
                   shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.blue,
                   ),
                   borderRadius: BorderRadius.circular(50)
               ),
                   child: Text(
                      "SE CONNECTER",
                       style: TextStyle(
                           color: Colors.blue,
                       fontWeight: FontWeight.w600,
                       fontSize: 18
              ),
            ),
          ),
                 ),
                 SizedBox(height: 20,),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));

                  },
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "S'INSCRIRE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                VisitWebSite(),
              ]
             ),
            )
            ),


          ],
        ),
      ),
    );
  }

}
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class VisitWebSite extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
           "Visitez notre site web ? "  ,
          style: TextStyle(color: Colors.blue,),
        ),
        GestureDetector(
          onTap: (){
            _launchUrl("https://chillkid.herokuapp.com/");
          },
          child: Text(
             "Oui",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
  Future<void> _launchUrl(String url)async{
    if(await canLaunch(url)){
      await launch(
          url
      );

    }
    else {
      print("Veuillez réessayer");
    }
  }
}