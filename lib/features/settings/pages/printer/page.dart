import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:kasirsuper/features/settings/settings.dart';

part 'sections/item_section.dart';

class PrinterPage extends StatefulWidget {
  const PrinterPage({super.key});

  static const String routeName = '/settings/printer';

  @override
  State<PrinterPage> createState() => _PrinterPageState();
}

class _PrinterPageState extends State<PrinterPage> {
  @override
  void initState() {
    context.read<PrinterBloc>().add(GetPrinterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Printer'),
      ),
      body: BlocBuilder<PrinterBloc, PrinterState>(
        builder: (context, state) {
          if (state.status == Status.success && state.printers.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    MainAssets.error,
                    width: Dimens.width(context) / 2,
                  ),
                  Dimens.dp32.height,
                  const SubtitleText(
                    'Gagal Memuat Data',
                    align: TextAlign.center,
                  ),
                  Dimens.dp16.height,
                  const RegularText(
                    'Pastikan bluetooth dan printer\nthermal Anda aktif.',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(Dimens.dp16),
            itemBuilder: (context, index) {
              final item = state.printers[index];
              return _ItemSection(
                onTap: () {
                  context.read<PrinterBloc>().add(
                        TestPrinterEvent(item.macAdress),
                      );
                },
                port: item.macAdress,
                title: item.name,
              );
            },
            separatorBuilder: (context, index) => Dimens.dp16.height,
            itemCount: state.printers.length,
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: ElevatedButton(
          onPressed: () {
            context.read<PrinterBloc>().add(OpenSettingPrinterEvent());
          },
          child: const Text('Tambah Printer'),
        ),
      ),
    );
  }
}
