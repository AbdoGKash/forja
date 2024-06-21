import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forja/core/theming/color_manger.dart';

class TextStyelManger {
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManger.black,
  );
  static TextStyle font20WhiteBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManger.white,
  );
  static TextStyle font16White = TextStyle(
    fontSize: 16.sp,
    color: ColorsManger.white,
  );
  static TextStyle font14White = TextStyle(
    fontSize: 14.sp,
    color: ColorsManger.white,
  );
}
