import 'package:chill_kid_intership/memberInterface/Event/event.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:chill_kid_intership/memberInterface/Coach/listCoach.dart';
import 'Planning/planning.dart';
import 'Session/shop_screen.dart';
import 'children/list_children.dart';


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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<NavBarModel>_titleList = [
    NavBarModel("Home", Icons.home, 	"#1E90FF" ),
    NavBarModel("Entraineurs", Icons.person, 	"#C604CA" ),
    NavBarModel("Plannification", Icons.date_range_rounded, "#6D7600"),
    NavBarModel("Mes enfants", Icons.child_care, "#A50606"),
    NavBarModel("Evènements", Icons.event, "#450FE0"),
  ];

  List <Widget>_widgetList =[
    new ShopScreen(),
    new CoachScreen(),
    new Planning(),
    new listChild(),
    new EventList(),

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