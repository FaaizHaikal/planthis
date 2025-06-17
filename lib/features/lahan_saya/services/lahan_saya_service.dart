
import 'dart:convert';

import 'package:planthis/core/constants.dart';
import 'package:planthis/features/lahan_saya/models/scan_response.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class LahanSayaService {
  static Future<ScanResponse?> scanLocation(LatLng location) async {
    final params = {
      'lat': location.latitude,
      'lon': location.longitude
    };

    final url = Uri.http(baseUrl, '/dummy_species', params);

    final response = await http.get(url);
    final json = jsonDecode(response.body);
    
    if (response.statusCode == 200) {
      return ScanResponse.fromJson(json);
    }

    final error = json['error'] ?? 'Failed to scan location';
    throw Exception(error);
  }
}