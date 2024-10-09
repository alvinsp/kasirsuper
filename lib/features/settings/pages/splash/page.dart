import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kasirsuper/app/config.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:kasirsuper/features/home/home.dart';
import 'package:kasirsuper/features/settings/settings.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    if (kIsWeb) {
      Future.delayed(const Duration(seconds: 3)).then((v) {
        mainNavigate();
      });
    } else {
      checkUpdate();
    }
    super.initState();
  }

  Future<void> checkUpdate() async {
    final version = await ConfigData.checkUpdate();

    if (version == AppVersionType.upToDate) {
      mainNavigate();
    } else {
      updateNavigate(version);
    }
  }

  void mainNavigate() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      MainPage.routeName,
      (route) => false,
    );
  }

  void updateNavigate(AppVersionType version) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      UpdatePage.routeName,
      (route) => false,
      arguments: version,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(MainAssets.logo, width: Dimens.dp100),
            Dimens.dp16.height,
            HeadingText(
              AppConfig.appName,
              style: TextStyle(color: context.theme.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
