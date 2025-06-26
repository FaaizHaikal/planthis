import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:planthis/app/theme/app_colors.dart';
import 'package:planthis/features/lahan_saya/models/scan_response.dart';

class ScanInfo extends StatelessWidget {
  final ScanResponse scan;
  const ScanInfo({required this.scan});

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(color: Colors.white, fontSize: 14);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoRow(
            icon: Icons.terrain,
            label: 'Altitude',
            value: '${scan.altitude?.toStringAsFixed(0)} m',
          ),
          if (scan.climate?.temperature != null)
            _InfoRow(
              icon: Icons.thermostat,
              label: 'Temp',
              value: '${scan.climate!.temperature?.toStringAsFixed(2)} °C',
            ),
          if (scan.climate?.rainfall != null)
            _InfoRow(
              icon: Icons.water_drop,
              label: 'Rainfall',
              value: '${scan.climate!.rainfall?.toStringAsFixed(2)} mm/tahun',
            ),
          if (scan.soil?.types != null && scan.soil!.types!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.grass, size: 24, color: AppColors.primary),
                  const SizedBox(width: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2.0,
                    children:
                        scan.soil!.types!.map((type) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade900,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              type,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(width: 6),
          Text('$label: ', style: const TextStyle(color: Colors.white70)),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
