import 'package:planthis/features/lahan_saya/models/scan_response.dart';
import 'package:latlong2/latlong.dart';

class LahanSayaState {
  final LatLng? selectedCoordinate;
  final ScanResponse? scanResponse;
  final String? error;

  LahanSayaState({
    required this.selectedCoordinate,
    required this.scanResponse,
    this.error,
  });

  factory LahanSayaState.initial() =>
      LahanSayaState(selectedCoordinate: null, scanResponse: null, error: null);

  LahanSayaState set({
    LatLng? selectedCoordinate,
    ScanResponse? scanResponse,
    String? error,
  }) {
    return LahanSayaState(
      selectedCoordinate: selectedCoordinate ?? this.selectedCoordinate,
      scanResponse: scanResponse,
      error: error,
    );
  }
}
