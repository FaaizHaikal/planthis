class Tree {
  final String? scientificName;
  final String? commonName;
  final String? indonesianName;

  const Tree({required this.scientificName, this.commonName, this.indonesianName});

  factory Tree.fromJson(Map<String, dynamic> json) {
    return Tree(
      scientificName: json['scientific_name'],
      commonName: json['common_name'],
      indonesianName: json['indonesian_name']
    );
  }
}
