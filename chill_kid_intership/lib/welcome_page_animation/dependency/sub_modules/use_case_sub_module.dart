import 'package:chill_kid_intership/welcome_page_animation/core/use_cases/user_use_case.dart';
import 'package:chill_kid_intership/welcome_page_animation/dependency/sub_modules/repository_sub_module.dart';
import 'package:template_package/template_package.dart';

class UseCaseSubModule extends ISubModule {
 RepositorySubModule _repositorySubModule;

  @override
  init(List<ISubModule> subModules) {
    _repositorySubModule = subModules.singleWhere((element) => element is RepositorySubModule) as RepositorySubModule;
  }

  SomeUseCase userUseCase() => SomeUseCase(_repositorySubModule.userRepository());
}
