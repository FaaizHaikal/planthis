import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:planthis/features/lahan_saya/models/scan_response.dart';
import 'package:planthis/features/lahan_saya/services/lahan_saya_service.dart';
import 'package:planthis/features/lahan_saya/states/lahan_saya_state.dart';

class LahanSayaController extends StateNotifier<LahanSayaState> {
  // Tetapkan koordinat default ke Surabaya, Jawa Timur
  final LatLng defaultLocation = LatLng(-7.2574719, 112.7520883);

  LahanSayaController() : super(LahanSayaState.initial()) {
    // Atur state awal dengan koordinat default
    state = state.set(selectedCoordinate: defaultLocation);
    initializeLocation();
  }

  Future<void> scanLocation() async {
    try {
      final response = await LahanSayaService.scanLocation(
        state.selectedCoordinate!,
      );
      state = state.set(scanResponse: response, treeDetails: null, error: null);
    } catch (e) {
      state = state.set(
        scanResponse: null,
        treeDetails: null,
        error: e.toString(),
      );
    }
  }

  Future<void> clearError() async {
    state = state.set(error: null);
  }

  Future<void> clearError() async {
    state = state.set(error: null);
  }

  Future<void> initializeLocation() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Jika layanan lokasi mati, tidak perlu menampilkan error,
        // karena kita sudah punya lokasi default.
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        state.set(
          error: "Location Permission is required to use this feature.",
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      state.set(error: "Please enable Location Permission in your settings.");
    }

      final position = await Geolocator.getCurrentPosition();

    state = state.set(
      selectedCoordinate: LatLng(position.latitude, position.longitude),
      error: null,
    );
  }

  Future<void> setLocation(LatLng location) async {
    state = state.set(selectedCoordinate: location, scanResponse: null);
  }

  Future<void> getTreeDetails() async {
    final species = state.scanResponse?.matchingSpecies;
    if (species == null || species.isEmpty) return;

    try {
      final trees = await LahanSayaService.getDetailsFor(species);
      state = state.set(treeDetails: trees);
    } catch (e) {
      state = state.set(error: e.toString());
    }
  }
}
