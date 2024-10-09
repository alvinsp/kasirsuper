part of '../page.dart';

class _ConfirmSection extends StatelessWidget {
  const _ConfirmSection({required this.nominal, this.referenceId});

  final num nominal;
  final String? referenceId;

  @override
  Widget build(BuildContext context) {
    return ContentSheet(
      child: BlocListener<TransactionBloc, TransactionState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              SuccessTransactionPage.routeName,
              (route) => false,
              arguments: state.item?.referenceId,
            );
          }
        },
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RegularText.semiBold('Selesaikan Pembayaran'),
                Dimens.dp16.height,
                RegularText(
                  'Anda akan menyelesaikan pembayaran dengan nilai '
                  'transaksi sebesar ${(state.getEstimate - state.discount).toIDR()}.',
                  style: const TextStyle(fontSize: Dimens.dp12),
                ),
                Dimens.dp24.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RegularText.semiBold('Uang diterima'),
                    RegularText.semiBold(nominal.toIDR()),
                  ],
                ),
                Dimens.dp8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RegularText.semiBold(
                      'Kembalian',
                      style: TextStyle(
                        color: context.theme.colorScheme.error,
                      ),
                    ),
                    RegularText.semiBold(
                      (nominal - state.getEstimate - state.discount).toIDR(),
                      style: TextStyle(
                        color: context.theme.colorScheme.error,
                      ),
                    ),
                  ],
                ),
                Dimens.dp24.height,
                ElevatedButton(
                  onPressed: () {
                    context.read<TransactionBloc>().add(
                          CreateTransactionEvent(
                            state.transaction(
                              TypeEnum.paid,
                              payAmount: nominal,
                            ),
                            type: TypeEnum.paid,
                            referenceId: referenceId,
                          ),
                        );
                  },
                  child: const Text('Konfirmasi'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
