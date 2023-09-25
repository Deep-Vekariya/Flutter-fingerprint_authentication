import 'package:local_auth/local_auth.dart';

class Authentication {
  // Logic of autheentication app
  static final LocalAuthentication _auth = LocalAuthentication();

  static Future<bool> canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> autheentication() async {
    try {
      if (!await canAuthenticate()) return false;
      return await _auth.authenticate(localizedReason: "Get into the app");
    } catch (e) {
      print('Error $e');
      return false;
    }
  }
}
