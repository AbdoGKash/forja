part of 'auth_phone_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class AuthPhoneInitial extends PhoneAuthState {}

class Loading extends PhoneAuthState {}

class ErrorOccurred extends PhoneAuthState {
  final String errorMsg;

  ErrorOccurred({required this.errorMsg});
}

class PhoneNumberSubmited extends PhoneAuthState {}

class PhoneOTPVerified extends PhoneAuthState {}
