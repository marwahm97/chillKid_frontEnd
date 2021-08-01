import 'package:chill_kid_intership/welcome_page_animation/dependency/sub_modules/use_case_sub_module.dart';
import 'package:chill_kid_intership/welcome_page_animation/features/initial/initial_bloc.dart';
import 'package:chill_kid_intership/welcome_page_animation/features/welcome/welcome_bloc.dart';
import 'package:template_package/template_package.dart';

import 'core_sub_module.dart';

class BlocSubModule extends ISubModule {
   CoreSubModule _coreSubModule;
   UseCaseSubModule _useCaseSubModule;

  @override
  init(List<ISubModule> subModules) {
    _coreSubModule = subModules.singleWhere((element) => element is CoreSubModule) as CoreSubModule;
    _useCaseSubModule = subModules.singleWhere((element) => element is UseCaseSubModule) as UseCaseSubModule;
  }

  InitialBloc rootBloc(String appName) =>
      InitialBloc(_coreSubModule.analytics(), _useCaseSubModule.userUseCase(), appName);

  WelcomeBloc welcomeBloc() => WelcomeBloc(_coreSubModule.analytics());
}
