part of '../page.dart';

class _ActionSection extends StatefulWidget {
  const _ActionSection({required this.item});

  final TransactionModel item;

  @override
  State<_ActionSection> createState() => __ActionSectionState();
}

class __ActionSectionState extends State<_ActionSection> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.item.type != TypeEnum.paid) ...[
              OutlinedButton(
                onPressed: () {
                  context
                      .read<CartBloc>()
                      .add(InitialCartEvent(transaction: widget.item));
                  Navigator.pushNamed(
                    context,
                    PaymentPage.routeName,
                    arguments: widget.item.referenceId,
                  );
                },
                child: const Text('Bayar'),
              ),
              Dimens.dp16.height,
            ],
            OutlinedButton(
              onPressed: () {
                share(widget.item);
              },
              child: const Text('Kirim Struk'),
            ),
            Dimens.dp16.height,
            ElevatedButton(
              onPressed: () {
                context
                    .read<PrinterBloc>()
                    .add(TransactionPrinterEvent(widget.item));
              },
              child: const Text('Cetak Struk'),
            ),
          ],
        ),
      ),
    );
  }

  void share(TransactionModel transaction) {
    ScreenshotController()
        .captureFromWidget(
      ShareBill(data: transaction),
      context: context,
      targetSize: Size(
        370,
        800 + (transaction.items.length * 50),
      ),
    )
        .then(
      (capturedImage) async{
        await ShareHelper.shareImage(context, capturedImage, 'contoh');
      },
    );
  }
}
