import 'package:planthis/core/models/climate.dart';
import 'package:planthis/core/models/soil.dart';
import 'package:planthis/core/models/tree.dart';

class ScanResponse {
  final double? altitude;
  final Climate? climate;
  final Soil? soil;
  final List<String>? matchingSpecies;

  const ScanResponse({
    required this.altitude,
    this.climate,
    this.soil,
    this.matchingSpecies,
  });

  factory ScanResponse.fromJson(Map<String, dynamic> json) {
    return ScanResponse(
      altitude: (json['altitude'] as num).toDouble(),
      climate:
          json['climate'] != null ? Climate.fromJson(json['climate']) : null,
      soil: json['soil'] != null ? Soil.fromJson(json['soil']) : null,
      matchingSpecies:
          json['matching_species'] != null
              ? List<String>.from(json['matching_species'])
              : null,
    );
  }
}
