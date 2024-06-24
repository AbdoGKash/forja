import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forja/core/helper/app_strings.dart';
import 'package:forja/core/routing/routers_name.dart';
import 'package:forja/core/theming/color_manger.dart';
import 'package:forja/core/theming/text_styel_manger.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../phone_auth/logic/cubit/auth_phone_cubit.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  final phoneNumber;

  OtpScreen({super.key, required this.phoneNumber});

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
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorsManger.white),
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

  void _login(BuildContext context) {
    BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otpCode);
  }

  Widget _buildVrifyButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          showProgressIndicator(context);
          _login(context);
          Navigator.pushNamed(context, RoutersName.homeSreen);
        },
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

  Widget _buildPhoneVerificationBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is Loading) {
          showProgressIndicator(context);
        }

        if (state is PhoneOTPVerified) {
          Navigator.pop(context);
          Navigator.pushNamed(context, RoutersName.homeSreen);
        }

        if (state is ErrorOccurred) {
          String errorMsg = (state).errorMsg;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMsg),
              backgroundColor: ColorsManger.black,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: Container(),
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
                _buildPhoneVerificationBloc(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
