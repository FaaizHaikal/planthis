import 'package:planthis/core/models/climate.dart';
import 'package:planthis/core/models/soil.dart';
import 'package:planthis/core/models/tree.dart';

class ScanResponse {
  final double? altitude;
  final Climate? climate;
  final Soil? soil;
  final List<Tree>? matchingSpecies; // DIUBAH: dari List<String> menjadi List<Tree>

  const ScanResponse({
    required this.altitude,
    this.climate,
    this.soil,
    this.matchingSpecies
  });

  factory ScanResponse.fromJson(Map<String, dynamic> json) {
    return ScanResponse(
      altitude: (json['altitude'] as num).toDouble(),
      climate:
          json['climate'] != null ? Climate.fromJson(json['climate']) : null,
      soil: json['soil'] != null ? Soil.fromJson(json['soil']) : null,
      // DIUBAH: Logika untuk mem-parsing daftar objek Pohon
      matchingSpecies: json['matching_species'] != null
          ? (json['matching_species'] as List)
              .map((item) => Tree.fromJson(item as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
}
