import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:planthis/app/theme/app_colors.dart';
import 'package:planthis/features/lahan_saya/presentations/widgets/scan_info.dart';
import 'package:planthis/features/lahan_saya/providers/lahan_saya_provider.dart';

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
      body:
          state.selectedCoordinate == null
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                children: [
                  FlutterMap(
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
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName: 'com.example.planthis',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: state.selectedCoordinate!,
                            width: 120,
                            height: 80,
                            child: GestureDetector(
                              onTap: () {
                                if (state.scanResponse?.matchingSpecies !=
                                        null &&
                                    state
                                        .scanResponse!
                                        .matchingSpecies!
                                        .isNotEmpty) {
                                  Navigator.pushNamed(
                                    context,
                                    '/rekomendasi-pohon',
                                  );
                                }
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const Positioned(
                                    bottom: 0,
                                    child: Icon(
                                      Icons.location_pin,
                                      color: Colors.red,
                                      size: 50,
                                    ),
                                  ),
                                  if (state.scanResponse?.matchingSpecies !=
                                          null &&
                                      state
                                          .scanResponse!
                                          .matchingSpecies!
                                          .isNotEmpty)
                                    Positioned(
                                      bottom: 55,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                        ),
                                        child: Text(
                                          "${state.scanResponse!.matchingSpecies!.length} Rekomendasi 🌳",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (state.scanResponse != null)
                    Positioned(
                      left: 16,
                      bottom: 90,
                      child: ScanInfo(scan: state.scanResponse!),
                    ),
                ],
              ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await controller.scanLocation();
        },
        label: const Text("Scan"),
        icon: const Icon(Icons.radar),
      ),
    );
  }
}
