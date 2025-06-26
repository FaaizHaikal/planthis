import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planthis/app/theme/app_colors.dart';
import 'package:planthis/features/dashboard/presentations/widgets/dashboard_button.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Text(
              "Planthis",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              "Temukan rekomendasi pohon di lahan sekitarmu",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
            const SizedBox(height: 32),
            const Spacer(),
            // Main Scan Button
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DashboardButton(
                    icon: FontAwesomeIcons.seedling,
                    label: "Scan Area",
                    onTap: () => Navigator.pushNamed(context, '/lahan-saya'),
                  ),
                  const SizedBox(height: 24),
                  DashboardButton(
                    icon: FontAwesomeIcons.tree,
                    label: "Ilmu Padi",
                    onTap: () => Navigator.pushNamed(context, '/ilmu-padi'),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Footer or credits
            Text(
              "🌍 Powered by World Agroforesty",
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}