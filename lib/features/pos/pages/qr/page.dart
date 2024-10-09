import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:kasirsuper/features/home/home.dart';
import 'package:kasirsuper/features/transaction/transaction.dart';
import 'package:qr_flutter/qr_flutter.dart';

part 'sections/qr_section.dart';

class POSQrPage extends StatelessWidget {
  const POSQrPage({super.key});

  static const routeName = '/pos/qr';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: Navigator.canPop(context),
      onPopInvoked: (didPop) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainPage.routeName,
          (route) => false,
        );
      },
      child: BlocListener<TransactionBloc, TransactionState>(
        listener: (context, state) {
          if (state.status == Status.success &&
              state.item?.type == TypeEnum.paid) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              SuccessTransactionPage.routeName,
              (route) => false,
              arguments: state.item?.referenceId,
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Kode Pembayaran')),
          body: ListView(
            padding: const EdgeInsets.all(Dimens.dp16),
            children: const [
              _QRSection(),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: ElevatedButton(
              onPressed: () {
                context.read<TransactionBloc>().add(CekQrTransactionEvent());
              },
              child: const Text('Cek Status Pembayaran'),
            ),
          ),
        ),
      ),
    );
  }
}
