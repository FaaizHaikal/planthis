import 'package:planthis/core/models/tree.dart';
import 'package:planthis/features/lahan_saya/models/scan_response.dart';
import 'package:latlong2/latlong.dart';

class LahanSayaState {
  final LatLng? selectedCoordinate;
  final ScanResponse? scanResponse;
  final List<Tree>? treeDetails;
  final String? error;

  LahanSayaState({
    required this.selectedCoordinate,
    required this.scanResponse,
    required this.treeDetails,
    this.error,
  });

  factory LahanSayaState.initial() => LahanSayaState(
    selectedCoordinate: null,
    scanResponse: null,
    treeDetails: null,
    error: null,
  );

  LahanSayaState set({
    LatLng? selectedCoordinate,
    ScanResponse? scanResponse,
    List<Tree>? treeDetails,
    String? error,
  }) {
    return LahanSayaState(
      selectedCoordinate: selectedCoordinate ?? this.selectedCoordinate,
      scanResponse: scanResponse,
      treeDetails: treeDetails,
      error: error,
    );
  }
}