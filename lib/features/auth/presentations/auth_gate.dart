// features/auth/presentation/auth_gate.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import '../../dashboard/presentation/dashboard_screen.dart';
import 'login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          // TODO: Change this to dashboard screen
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('You\'ve logged in as ${snapshot.data!.email}'),
                duration: const Duration(seconds: 3),
              ),
            );
          });

          return LoginScreen();
          // return const DashboardScreen(); // Protected page
        } else {
          return LoginScreen(); // Public login screen
        }
      },
    );
  }
}
