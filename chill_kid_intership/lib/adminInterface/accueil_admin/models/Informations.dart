
import 'package:flutter/material.dart';

class Information {
  final String  title;
  final int number ;
  final Color color;

  Information({

    this.title,
    this.number,
    this.color,
  });
}

List demoUser = [
  Information(
    title: "Membres",
    number: 1,
    color: Colors.white,

  ),
  Information(
    title: "Entraineur",
    number: 3,
    color: Color(0xFFFFA113),

  ),
  Information(
    title: "Enfants",
    number: 2,
    color: Color(0xFFA4CDFF),

  ),
  Information(
    title: "Réservations",
    number: 0,
    color: Color(0xFF007EE5),

  ),
];
