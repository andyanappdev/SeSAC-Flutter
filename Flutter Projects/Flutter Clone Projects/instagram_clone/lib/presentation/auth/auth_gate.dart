import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:instagram_clone/presentation/main_tap/main_tap_screen.dart';

class AuthGagte extends StatelessWidget {
  const AuthGagte({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          return const SignInScreen(
            providerConfigs: [
              EmailProviderConfiguration(),
            ],
          );
        }

        // Render your application if authenticated
        return const MainTapScreen();
      },
    );
  }
}