part of '../page.dart';

class _OrderSection extends StatelessWidget {
  const _OrderSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(Dimens.dp16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RegularText.semiBold('Pesanan'),
                  GestureDetector(
                    onTap: () {
                      _showDiscount(context, state.disc, state.type);
                    },
                    child: RegularText.semiBold(
                      '+ Diskon Semua',
                      style: TextStyle(color: context.theme.primaryColor),
                    ),
                  )
                ],
              ),
              const Divider(),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = state.carts[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegularText.semiBold(item.product.title),
                      Dimens.dp8.height,
                      RichText(
                        text: TextSpan(
                          text: item.product.regularPrice.toIDR(),
                          style: context.theme.textTheme.titleMedium,
                          children: [
                            TextSpan(
                              text: ' / ${item.product.unit}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      Dimens.dp12.height,
                      CartProductButton(
                        count: item.qty,
                        onNoted: () {},
                        product: item.product,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Dimens.dp12.height,
                itemCount: state.carts.length,
              ),
            ],
          ),
        );
      },
    );
  }

  _showDiscount(BuildContext context, num discount, DiscountType? type) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => _DiscountSection(disc: discount, type: type),
    );
  }
}
