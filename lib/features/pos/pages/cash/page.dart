import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:kasirsuper/features/pos/pos.dart';
import 'package:kasirsuper/features/transaction/transaction.dart';

part 'sections/price_section.dart';
part 'sections/confirm_section.dart';

class CashPage extends StatefulWidget {
  const CashPage({super.key, this.referenceId});

  final String? referenceId;

  static const routeName = '/pos/cash';

  @override
  State<CashPage> createState() => _CashPageState();
}

class _CashPageState extends State<CashPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(title: const Text('Pembayaran Tunai')),
        body: ListView(
          children: [
            const _PriceSection(),
            const Divider(thickness: Dimens.dp8),
            Padding(
              padding: const EdgeInsets.all(Dimens.dp16),
              child: RegularTextInput(
                controller: controller,
                hintText: 'Rp. 0',
                label: 'Masukkan Nominal',
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(Dimens.dp16),
              child: ElevatedButton(
                onPressed:
                    state.isValidCash(controller.text) ? showConfirm : null,
                child: const Text('Tagih'),
              ),
            );
          },
        ),
      ),
    );
  }

  void showConfirm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _ConfirmSection(
        nominal: num.tryParse(controller.text) ?? 0,
        referenceId: widget.referenceId,
      ),
    );
  }
}
