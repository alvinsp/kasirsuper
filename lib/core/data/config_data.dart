import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ConfigData {
  ConfigData._();

  static final remoteConfig = FirebaseRemoteConfig.instance;

  static Future<void> initialize() async {
    try {
      await remoteConfig.setDefaults(const {
        "appName": "Kasir Super",
        "maxVersion": 1,
        "minVersion": 1,
        "privacyPolicy": "https://codeworks-inc.com/privacy-policy/",
        "appStoreUrl":
            "https://play.google.com/store/apps/details?id=io.kodingworks.superkasir&hl=en_US",
        "xenditKey":
            "xnd_development_ELjdt6x6sTLZID6o1AQIPSwK9d8B14bU8hpqVXOG6IX6P5yA5PHpcjPLIfup",
      });

      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 30),
        minimumFetchInterval: const Duration(minutes: 1),
      ));

      await remoteConfig.fetchAndActivate();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static String getValue(String key) {
    return remoteConfig.getValue(key).asString();
  }

  static Future<AppVersionType> checkUpdate() async {
    try {
      final maxVersion = remoteConfig.getInt("maxVersion");
      final minVersion = remoteConfig.getInt("minVersion");

      final packageInfo = await PackageInfo.fromPlatform();

      final nowVersion = int.parse(packageInfo.buildNumber);

      if (nowVersion < minVersion) {
        return AppVersionType.expired;
      } else if (nowVersion < maxVersion) {
        return AppVersionType.haveUpdate;
      } else {
        return AppVersionType.upToDate;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
