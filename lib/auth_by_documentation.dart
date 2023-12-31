import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthService {
  static Future<bool> authenticateUser() async {
    //initialize Local Authentication plugin.
    final LocalAuthentication localAuthentication = LocalAuthentication();

    //status of authentication.
    bool isAuthenticated = false;

    //check if device supports biometrics authentication.
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();

    //check if user has enabled biometrics.
    //check
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    //if device supports biometrics and user has enabled biometrics, then authenticate.
    if (isBiometricSupported && canCheckBiometrics) {
      try {
        isAuthenticated = await localAuthentication.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
          // biometricOnly: true,
          // useErrorDialogs: true,
          // stickyAuth: true
        );
      } on PlatformException catch (e) {
        print(e);
      }
    }
    return isAuthenticated;
  }
}

// --**-- BUTTON CODE --**--
// TextButton(
//   onPressed: () async {
//       bool isAuthenticated = await AuthService.authenticateUser();
//       if (isAuthenticated) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const PrivateScreen()),
//             );
//       } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('Authentication failed.'),
//                 ),
//           );
//         }
//   //...
//   })
