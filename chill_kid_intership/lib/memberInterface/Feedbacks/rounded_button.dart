import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key Key,
    @required this.icon,
    @required this.bgColor,
    @required this.iconColor,
    @required this.tap
  }): super (key: Key);

  final Icon icon;
  final Color iconColor, bgColor;
  final GestureTapCallback tap;


  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          color: Colors.white
      ),
      child: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {},
        color: Colors.blue,
      ),
    );
  }
}


