import 'package:kasirsuper/core/core.dart';

class AppConfig {
  AppConfig._();

  static String appName = ConfigData.getValue('appName');

  static String xenditKey = ConfigData.getValue('xenditKey');
  static String privacyPolicy = ConfigData.getValue('privacyPolicy');
  static String appStoreUrl = ConfigData.getValue('appStoreUrl');
}
