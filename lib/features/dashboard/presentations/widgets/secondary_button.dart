import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planthis/app/theme/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  final IconData mainIcon;
  final double iconSizeRatio;
  final String title;
  final String onClickRoute;

  const SecondaryButton({
    super.key,
    required this.mainIcon,
    required this.iconSizeRatio,
    required this.title,
    required this.onClickRoute,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final iconSize = screenWidth * 0.1;
    final titleSize = screenWidth * 0.04;

    return SizedBox(
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, onClickRoute),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.hovered)) {
              return AppColors.secondary.withValues(alpha: 0.8);
            }

            if (states.contains(WidgetState.pressed)) {
              return AppColors.secondary.withValues(alpha: 0.6);
            }

            return AppColors.secondary;
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          ),
          elevation: WidgetStateProperty.resolveWith<double>(
            (states) => states.contains(WidgetState.pressed) ? 1 : 4,
          ),
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
          child: Column(
            spacing: 8.0,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FaIcon(mainIcon, size: iconSize * iconSizeRatio),
            ],
          ),
        ),
      ),
    );
  }
}
