import 'package:flutter/material.dart';


class ForgetPassword extends StatelessWidget {
  final Function press;
  const ForgetPassword({
    Key key,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        GestureDetector(
          onTap: press,
          child: Text(
             "Mot de passe oublié ?" ,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
