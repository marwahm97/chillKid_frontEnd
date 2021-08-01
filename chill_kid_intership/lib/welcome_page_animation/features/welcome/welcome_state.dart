import 'package:flutter/material.dart';
import 'package:template_package/template_package.dart';

class ActionAnimationDataState extends BaseBlocDataState {
  final double edgePaddingRight;
  final double edgePaddingLeft;

  ActionAnimationDataState(this.edgePaddingLeft, this.edgePaddingRight);
}

abstract class PageIntrosDataState extends BaseBlocDataState {
  final String title;
  final String subTitle;
  final Color color;
  double textAnimationValue = 0;
  double backgroundAnimationValue = 0;
  final bool isFirst;
  bool isLast;
  Curve curve;

  PageIntrosDataState(this.color, this.title, this.subTitle,
      {this.isFirst = false, this.isLast = false, this.curve = Curves.easeOutCubic});
}

class FirstShadeDataState extends PageIntrosDataState {
  FirstShadeDataState({ String title,  String subTitle})
      : super(Colors.black54, title, subTitle, isFirst: true, curve: Curves.easeInOutQuad);
}

class SecondShadeDataState extends PageIntrosDataState {
  SecondShadeDataState({ String title,  String subTitle})
      : super(Colors.pinkAccent, title, subTitle, curve: Curves.easeInToLinear);
}

class ThirdShadeDataState extends PageIntrosDataState {
  ThirdShadeDataState({ String title,  String subTitle})
      : super(Color(0xFF29B6F6), title, subTitle, curve: Curves.easeInOutQuad);
}
