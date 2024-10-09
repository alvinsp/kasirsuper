import 'package:flutter/material.dart';
import 'package:kasirsuper/app/config.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:kasirsuper/features/home/pages/pages.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key, required this.version});

  final AppVersionType version;

  static const routeName = '/update';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.dp16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(MainAssets.logo, width: Dimens.dp200),
              Dimens.dp38.height,
              const SubtitleText(
                'New Update is Available',
                align: TextAlign.center,
              ),
              Dimens.dp8.height,
              const RegularText(
                'Update now for use new version',
                textAlign: TextAlign.center,
              ),
              Dimens.dp32.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      LaunchHelper.launch(AppConfig.appStoreUrl);
                    },
                    child: const Text('Update Now'),
                  ),
                  if (version == AppVersionType.haveUpdate) ...[
                    Dimens.dp8.height,
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          MainPage.routeName,
                          (route) => false,
                        );
                      },
                      child: const Text('Update Later'),
                    ),
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
