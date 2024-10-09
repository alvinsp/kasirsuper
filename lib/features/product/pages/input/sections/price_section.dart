part of '../page.dart';

class _PriceSection extends StatefulWidget {
  const _PriceSection({this.product});

  final ProductModel? product;

  @override
  State<_PriceSection> createState() => _PriceSectionState();
}

class _PriceSectionState extends State<_PriceSection> {
  final TextEditingController priceRegularController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  @override
  void initState() {
    priceRegularController.addListener(() {
      context.read<FormProductBloc>().add(
            ChangeFormProductEvent(
              priceRegular: int.tryParse(priceRegularController.text),
            ),
          );
    });
    unitController.addListener(() {
      context.read<FormProductBloc>().add(
            ChangeFormProductEvent(unit: unitController.text),
          );
    });
    priceController.addListener(() {
      context.read<FormProductBloc>().add(
            ChangeFormProductEvent(
              priceItem: int.tryParse(priceController.text),
            ),
          );
    });

    priceController.text = "${widget.product?.price ?? ''}";
    unitController.text = widget.product?.unit ?? '';
    priceRegularController.text = "${widget.product?.regularPrice ?? ''}";

    super.initState();
  }

  @override
  void dispose() {
    priceController.dispose();
    priceRegularController.dispose();
    unitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegularText.semiBold('Harga'),
          Dimens.dp24.height,
          Row(
            children: [
              Expanded(
                child: RegularTextInput(
                  controller: priceRegularController,
                  label: 'Harga Regular',
                  required: true,
                  hintText: 'Rp 0',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              Dimens.dp16.width,
              Expanded(
                child: RegularTextInput(
                  controller: unitController,
                  label: 'Unit',
                  required: true,
                  hintText: 'Pcs, kg, etc.',
                ),
              ),
            ],
          ),
          Dimens.dp24.height,
          RegularTextInput(
            controller: priceController,
            label: 'Biaya Per Item',
            required: true,
            hintText: 'Rp 0',
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
          Dimens.dp24.height,
          BlocBuilder<FormProductBloc, FormProductState>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegularText.medium(
                          'Margin',
                          style: const TextStyle(fontSize: Dimens.dp12),
                        ),
                        Dimens.dp8.height,
                        RegularText(
                          '${state.margin}%',
                          style: const TextStyle(fontSize: Dimens.dp12),
                        ),
                      ],
                    ),
                  ),
                  Dimens.dp16.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegularText.medium(
                          'Profit',
                          style: const TextStyle(fontSize: Dimens.dp12),
                        ),
                        Dimens.dp8.height,
                        RegularText(
                          '${state.profit}',
                          style: const TextStyle(fontSize: Dimens.dp12),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
