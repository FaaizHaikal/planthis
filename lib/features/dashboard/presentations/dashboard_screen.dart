import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planthis/features/dashboard/presentations/widgets/primary_button.dart';

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
            PrimaryButton(
              mainIcon: FontAwesomeIcons.calendarDays,
              iconSizeRatio: 1.3,
              title: 'Tanggal Potensial',
              body: 'Tanggal yang cocok untuk bertanam',
              onClickRoute: '/tanggal-potensial',
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
