class Climate {
  final double? rainfall;
  final double? temperature;

  const Climate({required this.rainfall, this.temperature});

  factory Climate.fromJson(Map<String, dynamic> json) {
    return Climate(
      rainfall: (json['rainfall'] as num).toDouble(),
      temperature: (json['temperature'] as num).toDouble(),
    );
  }
}
