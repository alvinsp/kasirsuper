import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:kasirsuper/features/settings/settings.dart';

part 'sections/heading_section.dart';
part 'sections/type_section.dart';
part 'sections/order_section.dart';
part 'sections/detail_section.dart';

class ShowStruckPage extends StatelessWidget {
  const ShowStruckPage({super.key});

  static const routeName = '/settings/struck/show';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tampilan Struk')),
      body: ListView(
        children: [
          const _HeadingSection(),
          const Divider(thickness: 8),
          const _TypeSection(),
          const Divider(thickness: 8),
          const _OrderSection(),
          const Divider(thickness: 8),
          const _DetailSection(),
          Dimens.dp24.height,
          BlocBuilder<StruckBloc, StruckState>(
            builder: (context, state) {
              return RegularText(
                state.struck?.message ?? 'Terimakasih sudah berkunjung.',
                style: const TextStyle(fontSize: Dimens.dp12),
                textAlign: TextAlign.center,
              );
            },
          ),
          Dimens.dp8.height,
          const RegularText(
            'Powered by KasirSUPER',
            style: TextStyle(fontSize: Dimens.dp12),
            textAlign: TextAlign.center,
          ),
          Dimens.dp32.height,
        ],
      ),
    );
  }
}
