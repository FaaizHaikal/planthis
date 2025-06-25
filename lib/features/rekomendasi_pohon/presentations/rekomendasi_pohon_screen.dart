import 'package:flutter/material.dart';

// Tidak perlu lagi Riverpod, jadi import-nya bisa dihapus
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:planthis/features/lahan_saya/providers/lahan_saya_provider.dart';

class RekomendasiPohonScreen extends StatelessWidget {
  // Tambahkan properti untuk menampung data
  final List<String> matchingSpecies;

  // Terima data melalui constructor
  const RekomendasiPohonScreen({
    super.key,
    required this.matchingSpecies,
  });

  @override
  Widget build(BuildContext context) {
    // Tidak perlu lagi 'ref.watch', langsung gunakan properti 'matchingSpecies'
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekomendasi Pohon'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: matchingSpecies.isEmpty
          ? const Center(
              child: Text('Tidak ada rekomendasi pohon yang cocok.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: matchingSpecies.length,
              itemBuilder: (context, index) {
                final species = matchingSpecies[index];
                return Card(
                  elevation: 2,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    leading: Icon(
                      Icons.park,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(species),
                    onTap: () {
                      // TODO: Implementasi navigasi ke halaman detail pohon
                    },
                  ),
                );
              },
            ),
    );
  }
}