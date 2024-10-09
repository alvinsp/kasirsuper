part of '../page.dart';

class _HeadingSection extends StatelessWidget {
  const _HeadingSection({
    required this.item,
  });

  final TransactionModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegularText.semiBold('#${item.referenceId}'),
        Dimens.dp8.height,
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.dp8,
            vertical: Dimens.dp4,
          ),
          decoration: BoxDecoration(
            color: AppColors.yellow,
            borderRadius: BorderRadius.circular(Dimens.dp100),
          ),
          child: RegularText(
            item.paymentType.name.toUpperCase(),
            style: const TextStyle(
              fontSize: Dimens.dp12,
              color: AppColors.black,
            ),
          ),
        ),
        Dimens.dp8.height,
        RegularText.semiBold(
          item.createdAt.transaction,
          style: const TextStyle(fontSize: Dimens.dp12),
        )
      ],
    );
  }
}
