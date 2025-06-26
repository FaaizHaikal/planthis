import 'dart:convert';

import 'package:planthis/core/constants.dart';
import 'package:planthis/core/models/tree.dart';
import 'package:planthis/features/lahan_saya/models/scan_response.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class LahanSayaService {
  static Future<ScanResponse?> scanLocation(LatLng location) async {
    final params = {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
    };

    final url = Uri.https(baseUrl, '/species', params);

    final response = await http.get(url);
    final json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ScanResponse.fromJson(json);
    }

    final error = json['error'] ?? 'Failed to scan location';
    throw Exception(error);
  }

  static Future<List<Tree>> getDetailsFor(List<String> speciesNames) async {
    final uri = Uri.http(baseUrl, '/tree-info', {'species': speciesNames});

    final response = await http.get(uri);
    final json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return (json as List).map((e) => Tree.fromJson(e)).toList();
    }

    final error = json['error'] ?? 'Failed to get tree details';
    throw Exception(error);
  }
}
