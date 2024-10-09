import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:kasirsuper/firebase_options.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/app.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };

    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://e61bafce0962e929fe39900cc3721b27@o4508074322690048.ingest.us.sentry.io/4508074376036352';

        options.tracesSampleRate = 1.0;
        options.profilesSampleRate = 1.0;
      },
    );

    PlatformDispatcher.instance.onError = (error, stack) {
      CrashlythicsHelper.capture(error, stack);
      return true;
    };

    Bloc.observer = AppBlocObserver();

    ConfigData.initialize();
    runApp(const MyApp());
  }, (exception, stackTrace) async {
    CrashlythicsHelper.capture(exception, stackTrace);
  });
}
