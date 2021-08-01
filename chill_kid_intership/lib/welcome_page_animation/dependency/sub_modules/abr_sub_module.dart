import 'package:dependency_provider/base_sub_module.dart';
import 'package:chill_kid_intership/welcome_page_animation/core/abr/first_page_launcher_abr.dart';
import 'package:template_package/template_package.dart';

import 'bloc_sub_module.dart';

class ABRSubModule implements ISubModule {
 BlocSubModule _blocSubModule;

  @override
  init(List<ISubModule> subModules) {
    _blocSubModule = subModules.whereType<BlocSubModule>().first;
  }

  FirstPageLauncherABR firstPageLauncherABR() => FirstPageLauncherABR(_blocSubModule);
}
