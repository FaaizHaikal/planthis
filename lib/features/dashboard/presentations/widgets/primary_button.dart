import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planthis/app/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final IconData mainIcon;
  final double iconSizeRatio;
  final String title;
  final String body;
  final String onClickRoute;

  const PrimaryButton({
    super.key,
    required this.mainIcon,
    required this.iconSizeRatio,
    required this.title,
    required this.body,
    required this.onClickRoute,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final iconSize = screenWidth * 0.12;
    final titleSize = screenWidth * 0.06;
    final bodySize = screenWidth * 0.03;

    return SizedBox(
      width: double.infinity,
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
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  FaIcon(mainIcon, size: iconSize * iconSizeRatio),
                  SizedBox(width: screenWidth * 0.04),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                          height: 1.05,
                        ),
                      ),
                      Text(
                        body,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: bodySize,
                          height: 1.05,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              FaIcon(FontAwesomeIcons.circleArrowRight, size: iconSize * 0.7),
            ],
          ),
        ),
      ),
    );
  }
}
