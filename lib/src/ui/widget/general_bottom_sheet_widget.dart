import 'package:flutter/material.dart';
import 'package:pixelfield_test/generated/l10n.dart';
import 'package:pixelfield_test/src/lib/model/bottle.dart';
import 'package:pixelfield_test/src/ui/widget/bottle_info_widget.dart';
import 'package:pixelfield_test/utils/colors.dart';
import 'package:pixelfield_test/utils/text_styles.dart';

import 'button_widgets.dart';

class GeneralBottomSheetWidget {
  static final GeneralBottomSheetWidget _instance =
      GeneralBottomSheetWidget.internal();

  GeneralBottomSheetWidget.internal();

  factory GeneralBottomSheetWidget() => _instance;

  static Future<void> showBottleCustomDialog(
    BuildContext context, {
    required Bottle bottle,
  }) async {
    await showModalBottomSheet<dynamic>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;
        final List<bool> selectedToggle = <bool>[true, false, false];
        final L = S.of(context);
        final List<String> labels = [L.details, L.tastingNotes, L.history];
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: AppColors.backgroundColor,
              ),
              height: size.height * 0.9,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: size.width,
                          height: size.height * 1.3,
                          child: Image.asset(
                            "assets/images/common/background.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 80),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Center(
                                    child: Image.asset(
                                      "assets/images/common/default_bottle.png",
                                      height: 400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Container(
                                    width: size.width,
                                    color: AppColors.containerBlueColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${L.bottle} ${bottle.filled}",
                                            style: AppTextStyles.bodySStyle
                                                .copyWith(
                                                    color: AppColors
                                                        .textButtonBodyGreyColor),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                bottle.name,
                                                style: AppTextStyles
                                                    .headlineLStyle,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                "${L.born} ${bottle.ageStatement}",
                                                style: AppTextStyles
                                                    .headlineLStyle
                                                    .copyWith(
                                                        color: AppColors
                                                            .primaryYellowColor),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            bottle.caskNumber,
                                            style: AppTextStyles.headlineLStyle,
                                          ),
                                          const SizedBox(height: 16),
                                          Center(
                                            child: ToggleButtons(
                                                direction: Axis.horizontal,
                                                onPressed: (int index) {
                                                  setModalState(() {
                                                    for (int i = 0;
                                                        i <
                                                            selectedToggle
                                                                .length;
                                                        i++) {
                                                      selectedToggle[i] = false;
                                                    }
                                                    selectedToggle[index] =
                                                        true;
                                                  });
                                                },
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(8)),
                                                borderColor: Colors.transparent,
                                                selectedBorderColor: AppColors
                                                    .primaryYellowColor,
                                                selectedColor: AppColors
                                                    .buttonDefaultDarkGreyColor,
                                                fillColor: AppColors
                                                    .primaryYellowColor,
                                                constraints:
                                                    const BoxConstraints(
                                                  minHeight: 32,
                                                  minWidth: 100,
                                                ),
                                                isSelected: selectedToggle,
                                                children: List.generate(
                                                  labels.length,
                                                  (index) => Text(
                                                    labels[index],
                                                    style: AppTextStyles
                                                        .bodySStyle
                                                        .copyWith(
                                                      color: selectedToggle[
                                                              index]
                                                          ? AppColors
                                                              .buttonDefaultDarkGreyColor
                                                          : AppColors
                                                              .unselectedGreyColor,
                                                    ),
                                                  ),
                                                )),
                                          ),
                                          const SizedBox(height: 16),
                                          BottleInfoRowsWidget(
                                            labels: [
                                              L.distillery,
                                              L.region,
                                              L.country,
                                              L.type,
                                              L.ageStatement,
                                              L.filled,
                                              L.bottled,
                                              L.caskNumber,
                                              L.abv,
                                              L.size,
                                              L.finish,
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 40),
                                            child: Center(
                                              child: PrimaryButton(
                                                buttonTitle:
                                                    L.addToMyCollection,
                                                height: 40,
                                                width: 200,
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: SizedBox(
                                width: 40,
                                child: Image.asset(
                                  "assets/images/common/close_button_icon.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
