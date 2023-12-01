import 'package:flutter/material.dart';
import 'package:pixelfield_test/generated/l10n.dart';
import 'package:pixelfield_test/utils/colors.dart';
import 'package:pixelfield_test/utils/text_styles.dart';

class ToggleCollectionLabelsWidget extends StatelessWidget {
  final List<bool> selectedToggle;

  const ToggleCollectionLabelsWidget(this.selectedToggle, {super.key});

  @override
  Widget build(BuildContext context) {
    final L = S.of(context);
    final List<String> labels = [L.details, L.tastingNotes, L.history];

    return Column(
      children: List.generate(
        labels.length,
        (index) => Text(
          labels[index],
          style: AppTextStyles.bodySStyle.copyWith(
            color: selectedToggle[index]
                ? AppColors.buttonDefaultDarkGreyColor
                : AppColors.unselectedGreyColor,
          ),
        ),
      ),
    );
  }
}
