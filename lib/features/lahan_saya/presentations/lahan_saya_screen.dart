import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:planthis/features/lahan_saya/models/scan_response.dart';
import 'package:planthis/features/lahan_saya/providers/lahan_saya_provider.dart';
import 'package:planthis/features/rekomendasi_pohon/presentations/rekomendasi_pohon_screen.dart';

class LahanSayaScreen extends ConsumerWidget {
  const LahanSayaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(lahanSayaControllerProvider);
    final controller = ref.read(lahanSayaControllerProvider.notifier);

    final tileProvider = FMTCTileProvider(
      stores: const {'mapStore': BrowseStoreStrategy.readUpdateCreate},
    );

    return Scaffold(
      body: state.selectedCoordinate == null
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              options: MapOptions(
                initialCenter: state.selectedCoordinate!,
                minZoom: 6,
                initialZoom: 13,
                maxZoom: 16,
                onTap: (tapPos, latLng) {
                  controller.setLocation(latLng);
                },
              ),
              children: [
                TileLayer(
                  tileProvider: tileProvider,
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: 'com.example.planthis',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: state.selectedCoordinate!,
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
                    )
                  ],
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // 1. Panggil controller untuk melakukan scan (memanggil API)
          if (state.selectedCoordinate == null) return;
          final scanResult = await controller.scanLocation(state.selectedCoordinate!);
          print('Hasil Scan: ${scanResult?.matchingSpecies}');

          // 2. Setelah selesai, pindah ke halaman rekomendasi
          if (context.mounted) {
            final species = scanResult?.matchingSpecies ?? [];
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RekomendasiPohonScreen(matchingSpecies: species),
              )
            );
          }
        },
        label: const Text("Scan this point"),
        icon: const Icon(Icons.radar),
      ),
    );
  }
}