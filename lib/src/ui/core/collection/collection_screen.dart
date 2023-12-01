import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_test/generated/l10n.dart';
import 'package:pixelfield_test/src/ui/core/collection/bloc/collection_bloc.dart';
import 'package:pixelfield_test/src/ui/widget/bottle_card_widget.dart';
import 'package:pixelfield_test/src/ui/widget/general_bottom_sheet_widget.dart';
import 'package:pixelfield_test/utils/colors.dart';
import 'package:pixelfield_test/utils/text_styles.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final L = S.of(context);
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (context) => CollectionBloc()..add(LoadBottlesEvent()),
          child: BlocConsumer<CollectionBloc, CollectionState>(
            listener: (context, state) {
              if (state is CollectionFailedState) {
                ///show some error screen instead. Adaptive AlertDialog is just for demo
                AlertDialog.adaptive(
                  title: const Text('Something went wrong'),
                  content: const SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('Reload screen again'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Reload'),
                      onPressed: () {
                        BlocProvider.of<CollectionBloc>(context)
                            .add(LoadBottlesEvent());
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              }
            },
            builder: (context, state) {
              if (state is CollectionInitialState ||
                  state is CollectionLoadingState) {
                return const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.secondaryYellowColor));
              } else if (state is CollectionSuccessState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            L.myCollection,
                            style: AppTextStyles.headlineLStyle,
                          ),
                          const Spacer(),
                          //    Image.asset(name)
                        ],
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.builder(
                          itemCount: state.bottle.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () =>
                                GeneralBottomSheetWidget.showBottleCustomDialog(
                              context,
                              bottle: state.bottle[index],
                            ),
                            child:
                                BottleCardWidget(bottle: state.bottle[index]),
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing:
                                8, // Spacing between items vertically
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.65,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ));
  }
}
