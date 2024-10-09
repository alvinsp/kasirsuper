import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:kasirsuper/features/transaction/transaction.dart';
import 'package:open_settings/open_settings.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

part 'printer_event.dart';
part 'printer_state.dart';

class PrinterBloc extends Bloc<PrinterEvent, PrinterState> {
  PrinterBloc() : super(PrinterState.initial()) {
    on<GetPrinterEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));

        var status = await Permission.bluetoothConnect.status;
        if (status.isGranted) {
          var statusScan = await Permission.bluetoothScan.status;

          if (statusScan.isGranted) {
            // code untk ambil printer
            final listResult = await PrintBluetoothThermal.pairedBluetooths;

            emit(state.copyWith(status: Status.success, printers: listResult));
          } else {
            var requestScan = await Permission.bluetoothScan.request();

            if (requestScan.isGranted) {
              add(GetPrinterEvent());
            }
          }
        } else {
          final permission = await Permission.bluetoothConnect.request();
          if (permission.isGranted) {
            add(GetPrinterEvent());
          }
        }
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });

    on<OpenSettingPrinterEvent>((event, emit) {
      OpenSettings.openBluetoothSetting();
    });

    on<TestPrinterEvent>((event, emit) async {
      try {
        await PrintBluetoothThermal.connect(macPrinterAddress: event.macAdress);

        List<int> ticket = await TicketTemplate.ticket();

        await PrintBluetoothThermal.writeBytes(ticket);
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });

    on<TransactionPrinterEvent>((event, emit) async {
      try {
        await PrintBluetoothThermal.connect(
          macPrinterAddress: state.printers.first.macAdress,
        );

        List<int> ticket = await TicketTemplate.ticket(
          transaction: event.transaction,
        );

        await PrintBluetoothThermal.writeBytes(ticket);
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });
  }
}
