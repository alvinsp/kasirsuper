part of '../page.dart';

class _ItemSection extends StatelessWidget {
  const _ItemSection({
    required this.product,
    required this.onDelete,
    required this.onEdit,
  });

  final ProductModel product;
  final Function() onEdit;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.dp8),
              child: product.image.isEmpty
                  ? Image.network(
                      'https://indonesiakaya.com/wp-content/uploads/2020/10/langsat1200.jpg',
                      width: 74,
                      height: 74,
                      fit: BoxFit.cover,
                    )
                  : Image.memory(
                      ImageHelper.convertToUint8List(product.image),
                      width: 74,
                      height: 74,
                      fit: BoxFit.cover,
                    ),
            ),
            Dimens.dp12.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegularText.semiBold(product.title),
                  Dimens.dp4.height,
                  RichText(
                    text: TextSpan(
                      text: product.regularPrice.toIDR(),
                      style: context.theme.textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: ' / ${product.unit}',
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Dimens.dp16.height,
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: onEdit,
                child: const Text('Edit'),
              ),
            ),
            Dimens.dp16.width,
            Expanded(
              child: OutlinedButton(
                onPressed: onDelete,
                child: const Text('Delete'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
