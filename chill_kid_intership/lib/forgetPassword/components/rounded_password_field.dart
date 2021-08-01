import 'package:chill_kid_intership/forgetPassword/components/text_field_container.dart';
import 'package:flutter/material.dart';



class RoundedPasswordField extends StatelessWidget {

  final ValueChanged<String> onChanged;
 // bool isHiddenPassword = true ;

  const RoundedPasswordField({
    Key key,
  //  this.isHiddenPassword ,
    this.onChanged,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool isHiddenPassword= true;
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          hintText: "Votre mot de passe",
          icon:  Icon(
              Icons.lock,
              color: Colors.blue,

            ),

          suffixIcon: InkWell(
           // onTap: _togglePasswordView,
            child: Icon(
              Icons.visibility,
              color: Colors.blue,


            ),
          ),

          border: InputBorder.none,
        ),
      ),
    );
  }

  /*void _togglePasswordView (){
    isHiddenPassword = !isHiddenPassword;

  }*/

}