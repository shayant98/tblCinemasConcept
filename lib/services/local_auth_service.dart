import 'dart:io';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuthService {
  LocalAuthentication localAuth = LocalAuthentication();

  Future<bool> canAuthenticate() async {
    return await localAuth.canCheckBiometrics;
  }

  Future<BiometricType> checkAvailableBioAuthMethods() async {
    List<BiometricType> availableBiometrics =
        await localAuth.getAvailableBiometrics();

    if (Platform.isIOS) {
      if (availableBiometrics.contains(BiometricType.face)) {
        return BiometricType.face;
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        return BiometricType.fingerprint;
      }
    } else {
      return BiometricType.fingerprint;
    }
  }

  Future authenticate() async {
    try {
      bool didAuthenticate = await localAuth.authenticateWithBiometrics(
          localizedReason: 'Please authenticate to show buy  tickets');

      return didAuthenticate;
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        return false;
      }
      if (e.code == auth_error.passcodeNotSet) {
        return false;
      }
    }
  }
}
