import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:kasirsuper/features/transaction/transaction.dart';

part 'sections/filter_section.dart';
part 'sections/item_section.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaksi')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(Dimens.dp16),
            child: _FilterSection(),
          ),
          Expanded(
            child: BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, state) {
                if (state.transactions.isEmpty) {
                  return const EmptyTemplate();
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final item = state.transactions[index];
                    return _ItemSection(item);
                  },
                  itemCount: state.transactions.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
