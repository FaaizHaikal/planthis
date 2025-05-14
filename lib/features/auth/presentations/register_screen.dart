import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planthis/app/theme/app_colors.dart';
import 'package:planthis/app/utils.dart';
import 'package:planthis/features/auth/presentations/widgets/password_requirements.dart';
import 'package:planthis/features/auth/providers/auth_provider.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final authController = ref.read(authControllerProvider.notifier);

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
              isValid: (passwordController.text).hasMinLength(8),
            ),
            PasswordRequirement(
              requirement: 'Contains a number',
              isValid: (passwordController.text).hasNumber(),
            ),
            PasswordRequirement(
              requirement: 'Passwords match',
              isValid: AppUtils.passwordMatch(passwordController.text, confirmPasswordController.text)
            ),
            if (authState.hasError) ...[
              const SizedBox(height: 4),
              Text(authState.error.toString(), style: const TextStyle(color: Colors.red)),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                final confirmPassword = confirmPasswordController.text.trim();

                authController.register(email, password, confirmPassword);
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
