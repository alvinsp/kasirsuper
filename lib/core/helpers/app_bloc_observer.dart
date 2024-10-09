import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasirsuper/core/core.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('$change', name: 'BLOC');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    CrashlythicsHelper.capture(error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
