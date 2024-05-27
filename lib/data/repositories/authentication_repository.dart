import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {
    // Local Storage
    if (kDebugMode) {
      print(
          '===================== GET STORAGE Auth Repo ======================');
      print(deviceStorage.read('IsFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

/* ------------------------------ Email and Password Sing-in ------------------------------ */

  /// [EmailAuthentication] - SingIn

  /// [EmailAuthentication] - REGISTER

  /// [ReAuthentication] - ReAuthenticate User

  /// [EmailVerification] - MAIL VERIFICATION

  /// [EmailAuthentication] - FORGET PASSWORD

/* ------------------------------ Federated identity & Social Sing-in ------------------------------ */

  /// [GoogleAuthentication] - GOOGLE

  /// [FacebookAuthentication] - FACEBOOK

/* ------------------------------ ./end Federated identity & Social Sing-in ------------------------------ */

  /// [LogoutUser] - Valid for any authentication.

  /// DELETE USER - Remove user Auth and Firebase Account
}
