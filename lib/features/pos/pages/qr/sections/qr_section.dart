part of '../page.dart';

class _QRSection extends StatelessWidget {
  const _QRSection();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state.item != null) {
              final item = state.item!;
              return Column(
                children: [
                  QrImageView(
                    data: item.qrString,
                    version: QrVersions.auto,
                    size: Dimens.dp200,
                  ),
                  Dimens.dp24.height,
                  buildTile('Jumlah pesanan', '${item.items.length}'),
                  Dimens.dp8.height,
                  buildTile('Subtotal', item.amount.toIDR()),
                  Dimens.dp8.height,
                  buildTile('Pajak', 'Rp 0'),
                  Dimens.dp8.height,
                  buildTile(
                    'Diskon',
                    '- ${item.discount.toIDR()}',
                    color: context.theme.primaryColor,
                  ),
                  const Divider(),
                  buildTile(
                    'Total Tagihan',
                    (item.amount - item.discount).toIDR(),
                    isBold: true,
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget buildTile(
    String title,
    String value, {
    bool isBold = false,
    Color? color,
  }) {
    return Row(
      children: [
        if (isBold)
          RegularText.semiBold(
            title,
            style: const TextStyle(fontSize: Dimens.dp12),
          )
        else
          RegularText(
            title,
            style: const TextStyle(fontSize: Dimens.dp12),
          ),
        Expanded(
          child: RegularText.semiBold(
            value,
            style: TextStyle(fontSize: Dimens.dp12, color: color),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
