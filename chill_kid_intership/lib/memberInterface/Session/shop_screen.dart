import 'package:chill_kid_intership/authentication_authorization/Signin.dart';
import 'package:chill_kid_intership/memberInterface/Feedbacks/Feedbacks.dart';
import 'package:chill_kid_intership/memberInterface/Session/session_screen.dart';
import 'package:chill_kid_intership/memberInterface/children/list_children.dart';
import 'package:chill_kid_intership/memberInterface/getSession_Panier.dart';
import 'package:chill_kid_intership/memberInterface/profile/edit.profile.dart';
import 'package:chill_kid_intership/memberInterface/profile/settings.dart';
import 'package:chill_kid_intership/model/Panier.dart';
import 'package:chill_kid_intership/model/session_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import'package:http/http.dart' as http;


class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
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

  var url = Uri.parse('http://192.168.43.61:4000/chillKid/addPanier');
  Future save() async {
    var res = await http.post(url,
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'name': panier.name,
          'price': panier.price,
          'img': panier.img



        });
    print(res.body);



    if (res.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Cette session est bien ajoutée au panier",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb:  4,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0

      );

    } else {
      print('Request failed with status: ${res.statusCode}.');
      Fluttertoast.showToast(
          msg: "Veuillez réessayer plus tard",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0

      );
    }

  }
  Panier panier = new Panier("", "", "");
  _sessionSelector(int index) {
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SessionScreen(session: sessions[index]),
            ),
          );
        },
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
                      tag: sessions[index].imageUrl,
                      child: Image(
                        height: 280.0,
                        width: 280.0,
                        image: AssetImage(
                          'assets/images/pic$index.png',
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
                          'PRIX',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          '\$${sessions[index].price}',
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
                        Text(
                          sessions[index].category.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          sessions[index].name,
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
            Positioned(
              bottom: 4.0,
              child: RawMaterialButton(
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.black,
                child: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: (){
                  panier.name =sessions[index].name;
                  panier.price = '\$${sessions[index].price}';
                  panier.img ='assets/images/pic$index.png';
                  save();
                },
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
          Padding(padding: EdgeInsets.only(right: 10)),
          GestureDetector(child:Container(
            margin: EdgeInsets.only(top: 14, bottom: 35),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                    color: Colors.red,
                    width: 3

                )
            ),

          ) ,),
          GestureDetector(
            child:
                Icon(Icons.shopping_cart, color: Colors.black ,),
            onTap: (){
              Navigator.push((context), MaterialPageRoute(
                  builder: (context ) {
                    return PanierList();
                  }));
            },
          ),
          Padding(padding: EdgeInsets.only(right: 30)),
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
                    backgroundImage: AssetImage('assets/avatar.png'),

                  ),
                  Padding(padding: EdgeInsets.all(15.0),
                      child: Text('Member Member', style: TextStyle(
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
              title: Text('Mes enfants')
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
                Navigator.push(context,MaterialPageRoute(builder: (context) {return SettingsPage();},),);
              },
              leading: Icon(Icons.settings,
                color: Colors.black,),
              title: Text('Paramètres ')
          ),
          ListTile(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) {return Signin();},),);
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
          padding: EdgeInsets.symmetric(vertical: 20.0),
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
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
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
                    'Sessions',
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
                itemCount: sessions.length,
                itemBuilder: (BuildContext context, int index) {
                  return _sessionSelector(index);
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
                    sessions[_selectedPage].description,
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

Widget _notification (){
  return Positioned(

      child: Container(
        height: 5,
        width: 5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(14)),
          border: Border.all(
            color: Colors.white,
            width: 2.7
          )
        ),
        child: Text("n", style: TextStyle(color: Colors.white, fontSize: 12), ),
      ));
}
