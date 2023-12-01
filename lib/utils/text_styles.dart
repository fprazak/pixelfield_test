import 'package:flutter/material.dart';

import 'colors.dart';

class AppFonts {
  AppFonts._();

  //font family
  static const ebRegular = 'EB Garamond';
  static const lato = 'Lato';

  //font weight
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
}

class AppTextStyles {
  AppTextStyles._();

  static const double bodyS = 12.0;
  static const double bodyL = 16.0;
  static const double titleL = 22.0;
  static const double buttonL = 16.0;
  static const double headL = 32.0;

  static const buttonLStyle = TextStyle(
    fontSize: AppTextStyles.bodyL,
    fontWeight: AppFonts.semiBold,
    fontFamily: AppFonts.ebRegular,
    color: AppColors.buttonDefaultDarkGreyColor,
  );

  static const secondaryLStyle = TextStyle(
    fontSize: AppTextStyles.bodyL,
    fontWeight: AppFonts.semiBold,
    fontFamily: AppFonts.ebRegular,
    color: AppColors.secondaryYellowColor,
  );

  static const headlineLStyle = TextStyle(
    fontSize: AppTextStyles.headL,
    fontWeight: AppFonts.medium,
    fontFamily: AppFonts.ebRegular,
    color: AppColors.fontDefaultWhiteColor,
  );

  static const bodyLStyle = TextStyle(
    fontSize: AppTextStyles.bodyL,
    fontWeight: AppFonts.regular,
    fontFamily: AppFonts.lato,
    color: AppColors.fontDefaultWhiteColor,
  );

  static const bodyLStyleGrey = TextStyle(
    fontSize: AppTextStyles.bodyL,
    fontWeight: AppFonts.regular,
    fontFamily: AppFonts.lato,
    color: AppColors.fontDefaultWhiteColor,
  );
  static const textButtonLStyleGrey = TextStyle(
    fontSize: AppTextStyles.titleL,
    fontWeight: AppFonts.regular,
    fontFamily: AppFonts.lato,
    color: AppColors.textButtonBodyGreyColor,
  );

  static const titleLStyle = TextStyle(
    fontSize: AppTextStyles.bodyL,
    fontWeight: AppFonts.medium,
    fontFamily: AppFonts.ebRegular,
    color: AppColors.fontDefaultWhiteColor,
  );

  static const bodySStyle = TextStyle(
    fontSize: AppTextStyles.bodyS,
    fontWeight: AppFonts.regular,
    fontFamily: AppFonts.lato,
    color: AppColors.fontDefaultWhiteColor,
  );
}
