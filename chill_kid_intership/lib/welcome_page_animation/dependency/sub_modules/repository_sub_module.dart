import 'package:chill_kid_intership/welcome_page_animation/core/repositories/initial_repository.dart';
import 'package:template_package/template_package.dart';

import 'core_sub_module.dart';

class RepositorySubModule extends ISubModule {
  CoreSubModule _coreSubModule;

  @override
  init(List<ISubModule> subModules) {
    _coreSubModule = subModules.singleWhere((element) => element is CoreSubModule) as CoreSubModule;
  }

  InitialRepository userRepository() =>
      InitialRepository(_coreSubModule.remoteConfig(), _coreSubModule.exceptionCaptor(), _coreSubModule.dao());
}
