import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get widthDevice => MediaQuery.of(this).size.width;

  double get heightDevice => MediaQuery.of(this).size.height;

  //bool
  bool get canPop => Navigator.maybeOf(this)?.canPop() ?? false;

  // text

  TextStyle get headerStyle => Theme.of(this).textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get timeStyle => Theme.of(this).textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
      );

  TextStyle get textStyle => Theme.of(this).textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
        color: Theme.of(this).primaryColor,
        fontFamily: 'Roboto',
      );

  TextStyle get bodyLargeStyle => Theme.of(this).textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.w400,
        color: Theme.of(this).primaryColor,
        fontFamily: 'Roboto',
      );

  TextStyle get subTextStyle => textStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get primaryMediumText =>
      Theme.of(this).textTheme.titleMedium!.copyWith(
            color: Theme.of(this).primaryColor,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
          );

  TextStyle get headlineMedium =>
      Theme.of(this).textTheme.headlineMedium!.copyWith(
            fontFamily: 'Roboto',
          );

  TextStyle get headlineLarge =>
      Theme.of(this).textTheme.headlineLarge!.copyWith(
            fontFamily: 'Roboto',
          );

  TextStyle get headlineSmall =>
      Theme.of(this).textTheme.headlineSmall!.copyWith(
            fontFamily: 'Roboto',
          );

  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!.copyWith(
        fontFamily: 'Roboto',
        fontSize: 14.0,
      );

  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!.copyWith(
        fontFamily: 'Roboto',
        fontSize: 16.0,
      );

  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!.copyWith(
        fontFamily: 'Roboto',
        fontSize: 18.0,
      );

  TextStyle get titleLargeS18 => Theme.of(this).textTheme.titleLarge!.copyWith(
        fontFamily: 'Roboto',
        fontSize: 18.0,
      );

  TextStyle get titleLargeS20 => Theme.of(this).textTheme.titleLarge!.copyWith(
        fontFamily: 'Roboto',
        fontSize: 20.0,
      );

  TextStyle get titleLargeS22 => Theme.of(this).textTheme.titleLarge!.copyWith(
        fontFamily: 'Roboto',
        fontSize: 22.0,
      );

  TextStyle get headerAppBarTextStyle =>
      Theme.of(this).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(this).scaffoldBackgroundColor,
            fontFamily: 'Roboto',
          );

  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontFamily: 'Roboto',
      );
}
