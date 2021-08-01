
import 'package:chill_kid_intership/adminInterface/management/Feedbacks/listFeedbacks.dart';
import 'package:chill_kid_intership/adminInterface/management/child/list_child.dart';
import 'package:chill_kid_intership/adminInterface/management/session/listSession.dart';
import 'package:chill_kid_intership/adminInterface/utils/edit.profile.dart';
import 'package:chill_kid_intership/adminInterface/utils/settings.dart';
import 'package:chill_kid_intership/authentication_authorization/Signin.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../responsive.dart';
import 'components/getRecentMembe.dart';
import 'components/users.dart';
import 'components/recent_user.dart';
import 'components/storage_details.dart';


class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor:Colors.blue,

        title:Container(
          child: Image.asset('assets/chill-kid-logo.png'),
          height: 120,

        ),


        centerTitle: true,

        actions: <Widget>[
          Padding(padding: EdgeInsets.only(right: 20)),
          GestureDetector(
            child: Image(
              height: 20,
              width: 20,
              image: AssetImage('assets/chat.png'),
              color: Colors.black,
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 15)),
          Padding(padding: EdgeInsets.only(right: 15)),

        ],


      ),
      drawer:
      Drawer(

          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.blue[500],
                    Colors.blue[200]
                  ]

                  ),

                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage('assets/avatar.png'),

                      ),
                      Padding(padding: EdgeInsets.all(15.0),
                          child: Text('Chill Kid', style: TextStyle(
                              color: Colors.white, fontSize: 15.0),)),


                    ],

                  ),
                ),


              ),

              ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return EditProfilePage(); }
                    ));
                  },
                  leading: Icon(Icons.account_circle,
                    color: Colors.black,),
                  title: Text('Profil')
              ),


              ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return sessionList();
                        },
                      ),
                    );
                  },
                  leading: Icon(Icons.category,
                    color: Colors.black,),
                  title: Text('Sessions')
              ),
              ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return listChild();
                        },
                      ),
                    );
                  },
                  leading: Icon(Icons.category,
                    color: Colors.black,),
                  title: Text('Enfants')
              ),
              ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Feedbacks();
                        },
                      ),
                    );
                  },
                  leading: Icon(Icons.feedback,
                    color: Colors.black,),
                  title: Text('feedbacks')
              ),
              Divider(
                height: 64,
                thickness: 0.5,
                color: Colors.blue,
                indent: 32,
                endIndent: 32,
              ),
              ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SettingsPage();
                        },
                      ),
                    );
                  },
                  leading: Icon(Icons.settings,
                    color: Colors.black,),
                  title: Text('Paramètres ')
              ),
              ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Signin();
                        },
                      ),
                    );
                  },
                  leading: Icon(Icons.lock,
                    color: Colors.black,),
                  title: Text('Déconnexion ')
              ),
            ],
          )
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [

              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        //User(),
                        User(),
                        SizedBox(height: defaultPadding),
                        recentUser(),
                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context)) StarageDetails(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we dont want to show it
                  if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 2,
                      child: StarageDetails(),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );

  }
}
