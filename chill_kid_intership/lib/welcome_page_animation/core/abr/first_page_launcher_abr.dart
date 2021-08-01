import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:chill_kid_intership/welcome_page_animation/dependency/sub_modules/bloc_sub_module.dart';
import 'package:chill_kid_intership/welcome_page_animation/features/initial/initial_page.dart';
import 'package:chill_kid_intership/welcome_page_animation/features/welcome/welcome_page.dart';
import 'package:template_package/template_package.dart';

class FirstPageLauncherABR implements ABR {
  final BlocSubModule _blocSubModule;

  FirstPageLauncherABR(this._blocSubModule);

  Future<Widget> decideFirstScreen({dynamic userProfile,  String appName}) async {
    if (!(await _isCurrentVersionAllowed())) {
      return getMaintenancePage();
    }
    return getWelcomePage();
  }

  Widget getRequiredOptionPage(userProfile) => Scaffold(body: Center(child: Text("optionRequired")));

  Widget getRootPage(String appName) => InitialPage(() => _blocSubModule.rootBloc(appName));

  Widget getMaintenancePage() => Scaffold(body: Center(child: Text("maintenance")));

  Future<bool> _isCurrentVersionAllowed() async => true;

  Widget getLogInPage() => Scaffold(body: Center(child: Text("login")));

  Widget getWelcomePage() => WelcomePage(() => _blocSubModule.welcomeBloc());

  Widget getConnectionErrorPage() => Scaffold(body: Center(child: Text("app start error")));
}
