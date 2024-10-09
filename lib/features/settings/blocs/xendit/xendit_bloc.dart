import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:kasirsuper/features/settings/settings.dart';

part 'xendit_event.dart';
part 'xendit_state.dart';

class XenditBloc extends Bloc<XenditEvent, XenditState> {
  XenditBloc() : super(XenditState.initial()) {
    on<GetXenditEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));

        final service = await XenditService.get();

        emit(state.copyWith(status: Status.apply, key: service));
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });
    on<SubmitXenditEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));

        final service = await XenditService.insert(event.key);

        emit(state.copyWith(status: Status.success, key: service));
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });
  }
}
