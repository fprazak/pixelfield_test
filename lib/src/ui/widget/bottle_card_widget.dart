import 'package:flutter/material.dart';
import 'package:pixelfield_test/src/lib/model/bottle.dart';
import 'package:pixelfield_test/utils/colors.dart';
import 'package:pixelfield_test/utils/text_styles.dart';

class BottleCardWidget extends StatelessWidget {
  final Bottle bottle;

  const BottleCardWidget({super.key, required this.bottle});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.containerBlueColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Center(
              ///default image
              child: Image.asset(
                "assets/images/common/default_bottle.png",
                height: 170,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              bottle.name,
              style: AppTextStyles.titleLStyle,
              overflow: TextOverflow.fade,
            ),
            const SizedBox(height: 8),
            Text(
              "${bottle.ageStatement} ${bottle.caskNumber}",
              style: AppTextStyles.titleLStyle,
              overflow: TextOverflow.fade,
            ),
            const SizedBox(height: 8),
            Text(
              "(${bottle.filled})",
              style: AppTextStyles.bodySStyle,
            ),
          ],
        ),
      ),
    );
  }
}
