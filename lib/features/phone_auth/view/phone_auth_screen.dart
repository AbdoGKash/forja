// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forja/core/helper/app_strings.dart';
import 'package:forja/core/routing/routers_name.dart';
import 'package:forja/core/theming/color_manger.dart';
import 'package:forja/core/theming/text_styel_manger.dart';

class PhoneAuthScreen extends StatelessWidget {
  PhoneAuthScreen({super.key});
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();
  late String phoneNumber;

  Widget _buildIntroTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.whatIsYourPhoneNumber,
          style: TextStyelManger.font20WhiteBold,
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2).w,
          child: Text(
            AppStrings.enterNumberVerifyYourAccount,
            style: TextStyelManger.font16White,
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneFormField(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16).w,
            decoration: BoxDecoration(
              border: Border.all(color: ColorsManger.yellow),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
            child: Center(
              child: Text(
                '${generateCountryFlag()}   +20',
                style: TextStyelManger.font14White,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2).w,
            decoration: BoxDecoration(
              border: Border.all(color: ColorsManger.yellow),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
            child: TextFormField(
              style: TextStyelManger.font16White,
              decoration: const InputDecoration(border: InputBorder.none),
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.pleaseEnterNumber;
                } // phone number in egypt is 11 number
                else if (value.length < 11) {
                  return AppStrings.tooShortForPhoneNumber;
                }
                return null;
              },
              onSaved: (value) {
                phoneNumber = value!;
              },
            ),
          ),
        ),
      ],
    );
  }

// Egypt Flag
  String generateCountryFlag() {
    String countryCode = 'eg';

    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }

  Widget _buildNextButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          // showProgressIndicator(context);
          Navigator.pushNamed(context, RoutersName.otpSreen);
          // _register(context);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(110, 50),
          backgroundColor: ColorsManger.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          AppStrings.next,
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
        body: Form(
          key: _phoneFormKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 88).w,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIntroTexts(),
                  SizedBox(
                    height: 50.h,
                  ),
                  _buildPhoneFormField(context),
                  SizedBox(
                    height: 40.h,
                  ),
                  _buildNextButton(context),
                  // _buildPhoneNumberSubmitedBloc(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
