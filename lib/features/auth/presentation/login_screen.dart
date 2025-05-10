import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planthis/app/theme/app_colors.dart';
import '../logic/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorMessage;

  bool isValidEmail(String email) =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (errorMessage != null || authState.hasError)
              Text(
                errorMessage ?? authState.error.toString(),
                style: const TextStyle(color: Colors.red),
              ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();

                if (email.isEmpty || password.isEmpty) {
                  setState(
                    () => errorMessage = 'Email and password are required.',
                  );
                  return;
                }
                if (!isValidEmail(email)) {
                  setState(() => errorMessage = 'Enter a valid email address.');
                  return;
                }

                setState(() => errorMessage = null);
                ref
                    .read(authControllerProvider.notifier)
                    .login(email, password);
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ref.read(authControllerProvider.notifier).signInWithGoogle();
              },
              child: const Text('Sign in with Google'),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                SizedBox(width: 4),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.resolveWith(
                      (_) => Colors.transparent,
                    ),
                    splashFactory: NoSplash.splashFactory,
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: WidgetStateProperty.all(Size.zero),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.primary, // Or your custom color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
