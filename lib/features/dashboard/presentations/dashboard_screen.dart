import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planthis/app/theme/app_colors.dart';

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
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
            ),
            const Spacer(),
            // Main Scan Button
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/lahan-saya');
                      },
                      borderRadius: BorderRadius.circular(100),
                      child: const SizedBox(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.seedling,
                            size: 100,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Scan Area",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
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
