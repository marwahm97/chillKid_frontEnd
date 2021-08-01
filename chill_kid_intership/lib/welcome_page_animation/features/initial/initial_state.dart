import 'package:template_package/template_package.dart';

class InitialDataState extends BaseBlocDataState {
  final String text;
  final String appName;
  final String someData;
  final bool isHorizontalStyle;

  InitialDataState({ this.text,  this.appName, this.someData = '', this.isHorizontalStyle = false});
}
