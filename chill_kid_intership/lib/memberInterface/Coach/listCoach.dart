import 'package:chill_kid_intership/adminInterface/utils/edit.profile.dart';
import 'package:chill_kid_intership/memberInterface/Feedbacks/Feedbacks.dart';
import 'package:chill_kid_intership/memberInterface/children/list_children.dart';
import 'package:chill_kid_intership/model/coach_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CoachScreen extends StatefulWidget {
  @override
  _CoachScreenState createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 1, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  _coachSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 500.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: coachs[index].imageUrl,
                      child: Image(
                        height: 280.0,
                        width: 280.0,
                        image: AssetImage(
                          'assets/coach/coach$index.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.0,
                    right: 30.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          coachs[index].age.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 30.0,
                    bottom: 40.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 5.0),
                        Text(
                          coachs[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Container(
          child: Image.asset('assets/chill-kid-logo.png'),
          height: 120,
        ),
        backgroundColor: Colors.blue,
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
          Padding(padding: EdgeInsets.only(right: 30)),
        ],

      ),
      drawer: Drawer(child: ListView(
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
                    backgroundImage: AssetImage('assets/avatar.webp'),

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
                )
                );
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
                      return listChild();
                    },
                  ),
                );
              },
              leading: Container(
                height: 30,
                child: Image.asset('assets/child.png', color: Colors.black, ), ),
              title: Text('Gestion des enfants')
          ),

          ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddFeedback();
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
                // Navigator.push(context,MaterialPageRoute(builder: (context) {return SettingsPage();},),);
              },
              leading: Icon(Icons.settings,
                color: Colors.black,),
              title: Text('Paramètres ')
          ),
          ListTile(
              onTap: () {
                //Navigator.push(context,MaterialPageRoute(builder: (context) {return Signin();},),);
              },
              leading: Icon(Icons.lock,
                color: Colors.black,),
              title: Text('Déconnexion ')
          ),
        ],
      )),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                ],
              ),
            ),
            SizedBox(height: 10.0),

            SizedBox(height: 20.0),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.6),
              labelPadding: EdgeInsets.symmetric(horizontal: 35.0),
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Nos entraineurs',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),


              ],
            ),
            SizedBox(height: 20.0),
            Container(
              height: 500.0,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _selectedPage = index;
                  });
                },
                itemCount: coachs.length,
                itemBuilder: (BuildContext context, int index) {
                  return _coachSelector(index);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    coachs[_selectedPage].description,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
