import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planthis/features/ilmu_padi/models/pohon_ilmu.dart';
import 'package:planthis/features/ilmu_padi/services/ilmu_padi_service.dart';

class IlmuPadiScreen extends StatelessWidget {
  const IlmuPadiScreen({super.key});

  // DITAMBAHKAN: Fungsi helper untuk memilih ikon berdasarkan jenis tips
  IconData _getIconForTip(String jenis) {
    switch (jenis) {
      case 'Pupuk Organik':
        return FontAwesomeIcons.leaf;
      case 'Pupuk Anorganik (Kimia)':
        return FontAwesomeIcons.flask;
      case 'Teknik Perawatan Dasar':
        return Icons.water_drop_outlined;
      case 'Teknik Perawatan Lanjutan':
        return Icons.content_cut;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<TipsPerawatan> tipsList = IlmuPadiService.getTipsList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tips Perawatan Pohon'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: tipsList.length,
        itemBuilder: (context, index) {
          final tip = tipsList[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: ExpansionTile(
              // DIUBAH: Ikon sekarang dinamis berdasarkan jenis tips
              leading: FaIcon(
                _getIconForTip(tip.jenis),
                color: Theme.of(context).colorScheme.primary,
                size: 20, // Sesuaikan ukuran ikon jika perlu
              ),
              title: Text(
                tip.nama,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              subtitle: Text(
                tip.jenis,
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              children: <Widget>[
                Container(
                   width: double.infinity,
                   padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                   color: Colors.white,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                        const Divider(),
                        const SizedBox(height: 8),
                        Text(tip.deskripsi),
                        const SizedBox(height: 12),
                        const Text(
                          'Manfaat Utama:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        ...tip.manfaat.map((manfaat) => _buildBenefitRow(context, manfaat)).toList(),
                     ],
                   ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBenefitRow(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check, size: 18, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}