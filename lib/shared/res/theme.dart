import 'package:flutter/material.dart';
import 'package:test_weather/shared/res/colors.dart';
import 'package:test_weather/shared/res/dimens.dart';

final appTheme = ThemeData(
  colorScheme: const ColorScheme.light(
      primary: AppColors.appMainBlue,
      secondary: AppColors.white,
      brightness: Brightness.light),
  splashColor: AppColors.mainBlue4,
  highlightColor: AppColors.mainBlue4,
  canvasColor: AppColors.white,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    color: AppColors.white,
    foregroundColor: AppColors.white,
    elevation: 0.0,
    toolbarHeight: AppSize.k56,
    titleSpacing: 0.0,
    centerTitle: false,
    titleTextStyle: const TextStyle(
      fontSize: AppSize.k22,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    iconTheme: _appBarIconTheme,
  ),
  radioTheme: ThemeData.light().radioTheme.copyWith(
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.appMainBlue;
      }

      return AppColors.black38;
    }),
  ),
  hintColor: AppColors.black72,
  inputDecorationTheme: _inputDecorationTheme,
  scaffoldBackgroundColor: AppColors.white,
);

final _appBarIconTheme = ThemeData.light().appBarTheme.iconTheme?.copyWith(
          color: AppColors.black72,
        ) ??
    const IconThemeData(
      color: AppColors.black72,
    );

final _inputDecorationTheme = ThemeData.light().inputDecorationTheme.copyWith(
      hintStyle: const TextStyle(
        color: AppColors.black72,
      ),
      iconColor: AppColors.black72,
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.k8),
        ),
        borderSide: BorderSide(
          color: AppColors.appMainBlue,
          width: AppSize.k2,
        ),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.k8),
        ),
        borderSide: BorderSide(
          color: AppColors.black24,
          width: AppSize.k1,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.k8),
        ),
        borderSide: BorderSide(
          color: AppColors.black24,
          width: AppSize.k1,
        ),
      ),
    );
