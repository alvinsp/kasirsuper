part of '../page.dart';

class _StockSection extends StatefulWidget {
  const _StockSection({this.product});

  final ProductModel? product;

  @override
  State<_StockSection> createState() => _StockSectionState();
}

class _StockSectionState extends State<_StockSection> {
  final TextEditingController stockController = TextEditingController();
  final TextEditingController skuController = TextEditingController();

  @override
  void initState() {
    stockController.addListener(() {
      context.read<FormProductBloc>().add(
            ChangeFormProductEvent(
              stock: int.tryParse(stockController.text),
            ),
          );
    });
    skuController.addListener(() {
      context.read<FormProductBloc>().add(
            ChangeFormProductEvent(sku: skuController.text),
          );
    });

    skuController.text = widget.product?.sku ?? '';
    stockController.text = "${widget.product?.stock ?? ''}";

    super.initState();
  }

  @override
  void dispose() {
    skuController.dispose();
    stockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegularTextInput(
            controller: skuController,
            label: 'SKU (Stock Keeping Unit)',
            hintText: 'SKU (Stock Keeping Unit)',
          ),
          Dimens.dp24.height,
          RegularTextInput(
            controller: stockController,
            label: 'Total Stock',
            hintText: '0',
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          Dimens.dp24.height,
        ],
      ),
    );
  }
}
