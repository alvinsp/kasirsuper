import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:kasirsuper/features/settings/settings.dart';

part 'struck_event.dart';
part 'struck_state.dart';

class StruckBloc extends Bloc<StruckEvent, StruckState> {
  StruckBloc() : super(StruckState.initial()) {
    on<GetStruckEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));

        final service = await StruckService.get();

        emit(state.copyWith(status: Status.apply, struck: service));
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });
    on<SubmitStruckEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));

        final service = await StruckService.insert(
          StruckModel(desc: event.desc, message: event.message),
        );

        emit(state.copyWith(status: Status.success, struck: service));
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });
  }
}
