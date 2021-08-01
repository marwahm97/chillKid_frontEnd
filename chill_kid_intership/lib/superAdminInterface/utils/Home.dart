
import 'package:chill_kid_intership/superAdminInterface/accueil_admin/dashboard/dashboard_screen.dart';
import 'package:chill_kid_intership/superAdminInterface/management/coach/listCoach.dart';
import 'package:chill_kid_intership/superAdminInterface/management/event/listEvent.dart';
import 'package:chill_kid_intership/superAdminInterface/management/member/listMember.dart';
import 'package:chill_kid_intership/superAdminInterface/management/planning/listPlanning.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class NavBarModel {
  String title;
  IconData icon;
  String color;


  NavBarModel(
      this.title,
      this.icon,
      this.color
      );

}



class HomePageSAdmin extends StatefulWidget {
  @override
  _HomePageSAdminState createState() => _HomePageSAdminState();
}

class _HomePageSAdminState extends State<HomePageSAdmin> {

  List<NavBarModel>_titleList = [
    NavBarModel("Dashboard", Icons.home, 	"#1E90FF" ),
    NavBarModel("Plannification", Icons.category, "#A50606"),
    NavBarModel("Evènements", Icons.event, "#6D7600"),
    NavBarModel("Entraineurs", Icons.sports_rounded, "#C604CA"),
    NavBarModel("Membres", Icons.group, "#450FE0"),


  ];

  List <Widget>_widgetList =[
    new DashboardScreen(),
    new planningList(),
    new eventList (),
    new listCoach(),
    new ListMember(),

  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (_index){
          setState(() {
            index = _index;
          });
        },
        items: _titleList.map((NavBarModel model ){
          return BottomNavigationBarItem(
              icon: Icon (
                model.icon,
                color: HexColor(
                    model.color
                ),
              ),
              label: model.title
          );
        }).toList(),
      ) ,
      body: _widgetList[index],
    );
  }
}
