import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forja/core/helper/app_strings.dart';
import 'package:forja/core/theming/color_manger.dart';
import 'package:forja/core/theming/text_styel_manger.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  final phoneNumber = '';

  OtpScreen({
    super.key,
  });

  late String otpCode;

  Widget _buildIntroTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.verifyYourPhoneNumber,
            style: TextStyelManger.font24WhiteBold),
        SizedBox(
          height: 30.h,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2).w,
          child: RichText(
            text: TextSpan(
              text: AppStrings.enterYour6DigitCodeNumbersSentTo,
              style: TextStyelManger.font16White.copyWith(height: 1.5.h),
              children: <TextSpan>[
                TextSpan(
                  text: phoneNumber,
                  style: TextStyle(color: ColorsManger.yellow),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
      barrierColor: ColorsManger.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  Widget _buildPinCodeFields(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        appContext: context,
        cursorColor: ColorsManger.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50.h,
          fieldWidth: 40.w,
          borderWidth: 1.w,
          activeColor: ColorsManger.yellow,
          inactiveColor: ColorsManger.yellow,
          inactiveFillColor: ColorsManger.white,
          activeFillColor: ColorsManger.yellow,
          selectedColor: ColorsManger.yellow,
          selectedFillColor: ColorsManger.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: ColorsManger.black,
        enableActiveFill: true,
        onCompleted: (submitedCode) {
          otpCode = submitedCode;
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }

  Widget _buildVrifyButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(110, 50),
          backgroundColor: ColorsManger.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          AppStrings.verify,
          style: TextStyelManger.font20WhiteBold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManger.black,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 88),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildIntroTexts(),
                const SizedBox(
                  height: 88,
                ),
                _buildPinCodeFields(context),
                const SizedBox(
                  height: 60,
                ),
                _buildVrifyButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
