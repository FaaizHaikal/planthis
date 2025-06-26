import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planthis/app/theme/app_colors.dart';
import 'package:planthis/features/lahan_saya/providers/lahan_saya_provider.dart';

class RekomendasiPohonScreen extends ConsumerWidget {
  const RekomendasiPohonScreen({super.key});


    @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(lahanSayaControllerProvider);
    final controller = ref.read(lahanSayaControllerProvider.notifier);

    if (state.treeDetails == null && state.scanResponse?.matchingSpecies != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.getTreeDetails();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekomendasi Pohon'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: state.treeDetails!.isEmpty
          ? const Center(
              child: Text('Tidak ada rekomendasi pohon yang cocok.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: state.treeDetails!.length,
              itemBuilder: (context, index) {
                // Mengambil objek pohon dari daftar
                final tree = state.treeDetails![index];
                return Card(
                  elevation: 2,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    leading: Icon(
                      Icons.park,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    // DIUBAH: Menggunakan Column untuk menampilkan dua baris teks
                    title: Column(
                      // Mengatur agar teks rata kiri
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nama Lokal (Indonesia)
                        Text(
                          tree.indonesianName ?? 'Nama lokal tidak tersedia',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2), // Spasi kecil antar teks
                        // Nama Latin (Ilmiah)
                        Text(
                          tree.scientificName ?? 'Nama latin tidak tersedia',
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
