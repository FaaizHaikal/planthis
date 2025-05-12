import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planthis/app/theme/app_colors.dart';
import 'package:planthis/features/auth/presentation/widgets/password_requirements.dart';
import '../logic/auth_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? errorMessage;

  bool hasMinLength(String password) => password.length >= 8;
  bool hasNumber(String password) => password.contains(RegExp(r'[0-9]'));
  bool passwordsMatch(String password, String confirmPassword) =>
      password == confirmPassword && password.isNotEmpty;

  bool isValidEmail(String email) =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);

  bool isPasswordValid(String password, String confirmPassword) {
    return hasMinLength(password) &&
        hasNumber(password) &&
        passwordsMatch(password, confirmPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
              onChanged: (_) => setState(() {}),
            ),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 4),
            PasswordRequirement(
              requirement: 'At least 8 characters',
              isValid: hasMinLength(passwordController.text),
            ),
            PasswordRequirement(
              requirement: 'Contains a number',
              isValid: hasNumber(passwordController.text),
            ),
            PasswordRequirement(
              requirement: 'Passwords match',
              isValid: passwordsMatch(
                passwordController.text,
                confirmPasswordController.text,
              ),
            ),
            if (errorMessage != null) ...[
              const SizedBox(height: 4),
              Text(errorMessage!, style: const TextStyle(color: Colors.red)),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                final confirmPassword = confirmPasswordController.text.trim();

                if (email.isEmpty ||
                    password.isEmpty ||
                    confirmPassword.isEmpty) {
                  setState(() => errorMessage = 'All fields are required.');
                  return;
                }
                if (!isValidEmail(email)) {
                  setState(() => errorMessage = 'Enter a valid email address.');
                  return;
                }
                if (!isPasswordValid(password, confirmPassword)) {
                  setState(() => errorMessage = 'Password rules not met.');
                  return;
                }

                setState(() => errorMessage = null);
                ref
                    .read(authControllerProvider.notifier)
                    .register(email, password);
              },
              child: const Text('Register'),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                SizedBox(width: 4),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
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
                    'Login',
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
