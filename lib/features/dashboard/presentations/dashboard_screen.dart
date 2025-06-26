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
            Row(
              spacing: 16.0,
              children: [
                Expanded(
                  child: SecondaryButton(
                    mainIcon: FontAwesomeIcons.trowel,
                    iconSizeRatio: 1.5,
                    title: 'Peralatan Tanam',
                    onClickRoute: '/peralatan-tanam',
                  ),
                ),
                Expanded(
                  child: SecondaryButton(
                    mainIcon: FontAwesomeIcons.cloudRain,
                    iconSizeRatio: 1.5,
                    title: 'Ramalan Cuaca',
                    onClickRoute: '/ramalan-cuaca',
                  ),
                ),
              ],
            ),
            PrimaryButton(
              mainIcon: FontAwesomeIcons.calendarCheck,
              iconSizeRatio: 1.3,
              title: 'Tanggal Tanam',
              body: 'Tanggal yang cocok untuk bertanam',
              onClickRoute: '/tanggal-tanam',
            ),
            PrimaryButton(
              mainIcon: FontAwesomeIcons.seedling,
              iconSizeRatio: 1.2,
              title: 'Ilmu Padi',
              body: 'Pelajari cara merawat pohonmu',
              onClickRoute: '/ilmu-padi',
            ),
          ],
        ),
      ),
    );
  }
}
