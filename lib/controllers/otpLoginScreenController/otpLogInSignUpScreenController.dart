import 'package:fitrees_customer/controllers/authentication/userAuthentication.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:get/get.dart';
import 'dart:async';

class otpLogInSignUpScreenController extends GetxController {
  String verificationOtp = "";
  PinFieldAutoFill otpController = PinFieldAutoFill();
  late Timer _countdownTimer;
  RxInt timeLeft = 59.obs;

  @override
  void onInit() {
    super.onInit();
    startCountdownTimer();
  }

  void startCountdownTimer() async {
    await SmsAutoFill().listenForCode();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        timeLeft.value--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    SmsAutoFill().unregisterListener();
    _countdownTimer.cancel(); // Cancel the timer when the controller is closed
    super.onClose();
  }

  Future<void> attemptLoginPhone() async {
    print(verificationOtp);
    userLoginPhoneOTP(verificationOtp);
  }
}
