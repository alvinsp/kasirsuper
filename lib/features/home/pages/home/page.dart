import 'package:flutter/material.dart';
import 'package:kasirsuper/core/core.dart';

part 'sections/card_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beranda')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: Column(
          children: [
            const _CardSection(
              label: 'Total Penjualan',
              value: 'Rp 5.000.000.000',
            ),
            Dimens.dp16.height,
            const _CardSection(
              label: 'Total Transaksi',
              value: '300.000',
            ),
            Dimens.dp16.height,
            const _CardSection(
              label: 'Total Produk',
              value: '654',
            ),
          ],
        ),
      ),
    );
  }
}
