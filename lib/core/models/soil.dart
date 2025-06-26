class Soil {
  final double? clay;
  final double? sand;
  final double? silt;
  final double? ph;
  final double? soc;
  final List<String>? types;

  const Soil({
    required this.clay,
    this.sand,
    this.silt,
    this.ph,
    this.soc,
    this.types,
  });

  factory Soil.fromJson(Map<String, dynamic> json) {
    return Soil(
      clay: (json['clay'] as num).toDouble(),
      sand: (json['sand'] as num).toDouble(),
      silt: (json['silt'] as num).toDouble(),
      ph: (json['ph'] as num).toDouble(),
      soc: (json['soc'] as num).toDouble(),
      types: List<String>.from(json['types']),
    );
  }
}
