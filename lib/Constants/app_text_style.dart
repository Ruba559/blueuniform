import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTextStyle {


  static const title = TextStyle(
    color: AppColors.black,
    fontFamily: 'Cairo',
    height: 1.3,
    fontSize: 24.0,
    fontWeight: FontWeight.bold
  );

  static const medium = TextStyle(
    color:  AppColors.black,
    fontFamily: 'Cairo',
    height: 1.5,
    fontSize: 20.0,
  );

  static const body = TextStyle(
    color: AppColors.black,
    fontFamily: 'Cairo',
    height: 1.5,
    fontSize: 16.0,
  );

  static const small = TextStyle(
    color: AppColors.black,
    fontFamily: 'Cairo',
    height: 1,
    fontSize: 14.0,
  );

  static const xsmall = TextStyle(
    color: AppColors.black,
    fontFamily: 'Cairo',
    height: 1,
    fontSize: 10.0,
  );
}