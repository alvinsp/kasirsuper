import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:kasirsuper/features/home/home.dart';
import 'package:kasirsuper/features/settings/settings.dart';
import 'package:kasirsuper/features/transaction/transaction.dart';
import 'package:screenshot/screenshot.dart';

part 'sections/action_section.dart';
part 'sections/heading_section.dart';
part 'sections/type_section.dart';
part 'sections/order_section.dart';
part 'sections/detail_section.dart';

class SuccessTransactionPage extends StatelessWidget {
  const SuccessTransactionPage({super.key, required this.referenceId});

  final String referenceId;

  static const routeName = '/transaction/success';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: Navigator.canPop(context),
      onPopInvoked: (didPop) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainPage.routeName,
          (route) => false,
        );
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Transaksi Berhasil')),
        body: ListView(
          children: const [
            _HeadingSection(),
            Divider(thickness: 8),
            _TypeSection(),
            Divider(thickness: 8),
            _OrderSection(),
            Divider(thickness: 8),
            _DetailSection(),
          ],
        ),
        bottomNavigationBar: const _ActionSection(),
      ),
    );
  }
}
