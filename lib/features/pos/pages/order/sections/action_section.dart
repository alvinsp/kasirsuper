part of '../page.dart';

class _ActionSection extends StatelessWidget {
  const _ActionSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return OutlinedButton(
                      onPressed: () {
                        context.read<TransactionBloc>().add(
                              CreateTransactionEvent(
                                state.transaction(TypeEnum.draft),
                              ),
                            );
                      },
                      child: const Text('Simpan Pesanan'),
                    );
                  },
                ),
              ),
              Dimens.dp16.width,
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    context.read<CartBloc>().add(const InitialCartEvent());
                  },
                  child: const Text('Hapus'),
                ),
              ),
            ],
          ),
          Dimens.dp16.height,
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, PaymentPage.routeName);
            },
            child: const Text('Pilih Pembayaran'),
          ),
        ],
      ),
    );
  }
}
