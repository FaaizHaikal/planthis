import 'dart:convert';

import 'package:planthis/core/constants.dart';
import 'package:planthis/features/lahan_saya/models/scan_response.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class LahanSayaService {
  static Future<ScanResponse?> scanLocation(LatLng location) async {
    try {
      final url = Uri.http(baseUrl, '/dummy');
      print('Calling API: $url'); // Debug: Tampilkan URL yang dipanggil

      final response = await http.get(url);

      // Debug: Tampilkan status code dan body dari response
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return ScanResponse.fromJson(json);
      } else {
        // Jika status bukan 200, lempar error dengan informasi
        throw Exception('Failed to load data from API. Status: ${response.statusCode}');
      }
    } catch (e) {
      // Jika ada error lain (misal: koneksi gagal), print errornya
      print('Error in LahanSayaService: $e');
      rethrow; // Lempar kembali error agar ditangkap oleh controller
    }
  }
}