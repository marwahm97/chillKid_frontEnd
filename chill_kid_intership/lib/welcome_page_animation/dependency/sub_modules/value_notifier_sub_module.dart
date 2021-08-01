import 'package:dependency_provider/base_sub_module.dart';
import 'package:chill_kid_intership/welcome_page_animation/core/notifiers/theme_notifier/theme_notifier.dart';
import 'package:chill_kid_intership/welcome_page_animation/theme/theme_primary/app_theme_dark.dart';
import 'package:chill_kid_intership/welcome_page_animation/theme/theme_primary/app_theme_light_one.dart';

class ValueNotifierSubModule implements ISubModule {
  ThemeNotifier themeNotifier;

  @override
  init(List<ISubModule> subModules) {
    themeNotifier = ThemeNotifier(appThemeLight);
  }
}
