part of '../page.dart';

class _ItemSection extends StatelessWidget {
  const _ItemSection(this.transaction);

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          TransactionDetailPage.routeName,
          arguments: transaction.referenceId,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.dp12,
                    vertical: Dimens.dp4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.dp4),
                    border: Border.all(color: context.theme.primaryColor),
                  ),
                  child: RegularText.semiBold(
                    transaction.type.valueName,
                    style: TextStyle(
                      fontSize: Dimens.dp10,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
                Expanded(
                  child: RegularText.semiBold(
                    transaction.createdAt.transaction,
                    style: const TextStyle(fontSize: Dimens.dp10),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            Dimens.dp16.height,
            RegularText.semiBold(
              '${transaction.paymentType.valueName} • ${transaction.referenceId}',
            ),
            Dimens.dp8.height,
            RegularText.semiBold(
              (transaction.amount - transaction.discount).toIDR(),
              style: TextStyle(color: context.theme.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
