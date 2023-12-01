import 'package:flutter/material.dart';
import 'package:pixelfield_test/utils/colors.dart';
import 'package:pixelfield_test/utils/text_styles.dart';

enum Position { edge, center }

class AppButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String? buttonTitle;
  final Color buttonColor;
  final Color? borderColor;
  final Color textColor;
  final Widget? leading;
  final Position leadingWidgetPosition;
  final Widget? trailing;
  final FontWeight? fontWeight;
  final double fontSize;

  const AppButtonWidget({
    required this.onPressed,
    required this.buttonTitle,
    this.leading,
    this.trailing,
    required this.buttonColor,
    required this.textColor,
    this.leadingWidgetPosition = Position.center,
    this.borderColor,
    this.fontWeight,
    required this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final leading = this.leading;
    final trailing = this.trailing;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shadowColor: buttonColor,
        padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: leading != null || trailing != null ? 24 : 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (leading != null && leadingWidgetPosition == Position.edge)
            Align(alignment: Alignment.centerLeft, child: leading),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leading != null &&
                  leadingWidgetPosition == Position.center) ...[
                leading,
                const SizedBox(width: 10),
              ],
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: leading != null ? 24 : 0,
                    right: trailing != null ? 24 : 0,
                  ),
                  child: Text(
                    buttonTitle ?? '',
                    style: TextStyle(
                        color: textColor,
                        fontWeight: fontWeight,
                        fontSize: fontSize),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          if (trailing != null)
            Align(alignment: Alignment.centerRight, child: trailing),
        ],
      ),
    );
  }
}

//regular CTA buttons
class PrimaryButtonAbstract extends StatelessWidget {
  final void Function() onPressed;
  final String buttonTitle;

  final double fontSize;
  final Widget? trailing;

  const PrimaryButtonAbstract({
    required this.buttonTitle,
    required this.onPressed,
    this.fontSize = AppTextStyles.bodyL,
    this.trailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButtonWidget(
      key: key,
      onPressed: onPressed,
      buttonTitle: buttonTitle,
      buttonColor: AppColors.primaryYellowColor,
      borderColor: Colors.transparent,
      textColor: AppColors.buttonDefaultDarkGreyColor,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      trailing: trailing,
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonTitle;
  final double width;
  final double height;
  final bool enabled;
  final Widget? trailing;

  const PrimaryButton({
    required this.buttonTitle,
    required this.onPressed,
    required this.width,
    this.height = 56,
    this.enabled = true,
    this.trailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: PrimaryButtonAbstract(
        key: key,
        onPressed: onPressed,
        buttonTitle: buttonTitle,
        trailing: trailing,
      ),
    );
  }
}
