part of 'transaction_bloc.dart';

sealed class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object?> get props => [];
}

class CreateQrTransactionEvent extends TransactionEvent {
  final TransactionModel transaction;
  final String? referenceId;

  const CreateQrTransactionEvent(this.transaction, {this.referenceId});

  @override
  List<Object?> get props => [transaction, referenceId];
}

class CekQrTransactionEvent extends TransactionEvent {}

class GetDetailTransactionEvent extends TransactionEvent {
  final String referenceId;

  const GetDetailTransactionEvent(this.referenceId);

  @override
  List<Object?> get props => [referenceId];
}

class GetTransactionEvent extends TransactionEvent {
  final TypeEnum? type;

  const GetTransactionEvent(this.type);

  @override
  List<Object?> get props => [type];
}

class CreateTransactionEvent extends TransactionEvent {
  final TransactionModel transaction;
  final TypeEnum? type;
  final String? referenceId;

  const CreateTransactionEvent(this.transaction, {this.type, this.referenceId});

  @override
  List<Object?> get props => [transaction, type, referenceId];
}
