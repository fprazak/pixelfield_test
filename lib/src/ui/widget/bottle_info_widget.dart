import 'package:flutter/material.dart';
import 'package:pixelfield_test/utils/text_styles.dart';

class BottleInfoRowsWidget extends StatelessWidget {
  final List<String> labels;

  const BottleInfoRowsWidget({
    super.key,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: labels
          .map(
            (label) => BottleInfoRowWidget(
              label: label,
              value: 'Text',

              ///default text
            ),
          )
          .toList(),
    );
  }
}

class BottleInfoRowWidget extends StatelessWidget {
  final String label;
  final String value;

  const BottleInfoRowWidget({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyLStyle,
        ),
        Text(
          value,
          style: AppTextStyles.bodyLStyleGrey,
        ),
      ],
    );
  }
}
