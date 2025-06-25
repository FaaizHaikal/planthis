import 'dart:convert';

import 'package:planthis/core/constants.dart';
import 'package:planthis/features/lahan_saya/models/scan_response.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class LahanSayaService {
  static Future<ScanResponse?> scanLocation(LatLng location) async {
    try {
      // Menggunakan endpoint /species dengan metode GET dan query parameters
      final url = Uri.http(baseUrl, '/species', {
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      });

      print('Calling API with GET method: $url');

      // Menggunakan http.get sesuai dengan definisi di backend
      final response = await http.get(url);

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        // Pastikan model ScanResponse sesuai dengan JSON yang diterima dari /species
        return ScanResponse.fromJson(json);
      } else {
        throw Exception(
            'Failed to load data from API. Status: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      print('Error in LahanSayaService: $e');
      rethrow;
    }
  }
}