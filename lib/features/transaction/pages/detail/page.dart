import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:kasirsuper/features/pos/pos.dart';
import 'package:kasirsuper/features/settings/settings.dart';
import 'package:kasirsuper/features/transaction/transaction.dart';
import 'package:screenshot/screenshot.dart';

part 'sections/heading_section.dart';
part 'sections/action_section.dart';
part 'sections/detail_section.dart';

class TransactionDetailPage extends StatefulWidget {
  const TransactionDetailPage({super.key, required this.referenceId});

  final String referenceId;

  static const routeName = '/transaction/detail';

  @override
  State<TransactionDetailPage> createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<TransactionDetailPage> {
  @override
  void initState() {
    context
        .read<TransactionBloc>()
        .add(GetDetailTransactionEvent(widget.referenceId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Transaksi')),
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          if (state.item != null) {
            final item = state.item!;
            return ListView(
              padding: const EdgeInsets.all(Dimens.dp16),
              children: [
                _HeadingSection(item: item),
                Dimens.dp40.height,
                _ActionSection(item: item),
                Dimens.dp24.height,
                _DetailSection(transaction: item),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
