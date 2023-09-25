
import 'package:flutter/material.dart';

import 'authentication.dart';
import 'pagetwo.dart';

class FingerAuthScreen extends StatefulWidget {
  const FingerAuthScreen({super.key});

  @override
  State<FingerAuthScreen> createState() => _FingerAuthScreenState();
}

class _FingerAuthScreenState extends State<FingerAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff192359),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "LogIn",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                "Use your fingerpront to loge into the app!!!",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const Divider(
                color: Colors.white60,
              ),
              const SizedBox(height: 28),
              ElevatedButton.icon(
                onPressed: () async {
                  bool auth = await Authentication.autheentication();
                  print('Can Authenticate : $auth');

                  if (auth) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondPage()));
                  }
                },
                icon: const Icon(Icons.fingerprint),
                label: const Text("Authentication"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
