part of '../page.dart';

class _HeadingSection extends StatelessWidget {
  const _HeadingSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        children: [
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return SubtitleText(
                state.user?.name ?? 'KasirSUPER',
                align: TextAlign.center,
              );
            },
          ),
          Dimens.dp14.height,
          BlocBuilder<StruckBloc, StruckState>(
            builder: (context, state) {
              return RegularText(
                state.struck?.desc ?? 'Instagram : @superpos.id',
                textAlign: TextAlign.center,
              );
            },
          ),
        ],
      ),
    );
  }
}
