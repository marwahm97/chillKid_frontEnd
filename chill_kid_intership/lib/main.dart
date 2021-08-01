import 'package:flutter/material.dart';
import 'package:chill_kid_intership/welcome_page_animation/app.dart';
import 'package:chill_kid_intership/welcome_page_animation/dependency/dependency_module.dart';

void main() {
  final dependencyModule = DependencyModule();
  final subModules = dependencyModule.getReadySubModules();
  runApp(App(subModules, appTitle: 'Template App'));
}