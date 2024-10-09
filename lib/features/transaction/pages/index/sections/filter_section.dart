part of '../page.dart';

class _FilterSection extends StatefulWidget {
  const _FilterSection();

  @override
  State<_FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<_FilterSection> {
  TypeEnum? selected;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    context.read<TransactionBloc>().add(GetTransactionEvent(selected));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [buildContainer(context)] +
          TypeEnum.values
              .map((e) => buildContainer(context, label: e))
              .toList(),
    );
  }

  Widget buildContainer(
    BuildContext context, {
    TypeEnum? label,
  }) {
    final isActive = selected == label;
    return Padding(
      padding: const EdgeInsets.only(right: Dimens.dp16),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selected = label;
          });
          getData();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.dp16,
            vertical: Dimens.dp8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.dp8),
            color: isActive ? context.theme.primaryColor : null,
            border: Border.all(
              color:
                  isActive ? context.theme.primaryColor : AppColors.black[200]!,
            ),
          ),
          child: RegularText.semiBold(
            label?.valueName ?? 'All',
            style: TextStyle(
              fontSize: Dimens.dp12,
              color: isActive
                  ? context.theme.scaffoldBackgroundColor
                  : AppColors.black[200],
            ),
          ),
        ),
      ),
    );
  }
}
