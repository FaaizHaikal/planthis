import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planthis/features/dashboard/presentations/widgets/primary_button.dart';
import 'package:planthis/features/dashboard/presentations/widgets/secondary_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16.0,
          children: [
            PrimaryButton(
              mainIcon: FontAwesomeIcons.locationDot,
              iconSizeRatio: 1.5,
              title: 'Lahan Saya',
              body: 'Rekomendasi pohon di sekitar Anda',
              onClickRoute: '/lahan-saya',
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
              body: 'Pelajari cara menanam pohonmu',
              onClickRoute: '/ilmu-padi',
            ),
          ],
        ),
      ),
    );
  }
}
