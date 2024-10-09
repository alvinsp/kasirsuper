part of 'printer_bloc.dart';

sealed class PrinterEvent extends Equatable {
  const PrinterEvent();

  @override
  List<Object> get props => [];
}

class GetPrinterEvent extends PrinterEvent {}

class TestPrinterEvent extends PrinterEvent {
  final String macAdress;

  const TestPrinterEvent(this.macAdress);

  @override
  List<Object> get props => [macAdress];
}

class TransactionPrinterEvent extends PrinterEvent {
  final TransactionModel transaction;

  const TransactionPrinterEvent(this.transaction);

  @override
  List<Object> get props => [transaction];
}

class OpenSettingPrinterEvent extends PrinterEvent {}
