import 'package:planthis/features/ilmu_padi/models/pohon_ilmu.dart';

class IlmuPadiService {
  static final List<TipsPerawatan> _tipsList = [
    // --- KATEGORI PUPUK ---
    const TipsPerawatan(
      nama: 'Pupuk NPK',
      jenis: 'Pupuk Anorganik (Kimia)',
      deskripsi:
          'Pupuk majemuk paling umum yang mengandung tiga unsur hara makro utama: Nitrogen (N), Fosfor (P), dan Kalium (K).',
      manfaat: [
        'Mempercepat pertumbuhan daun dan batang (unsur N).',
        'Merangsang pertumbuhan akar, pembungaan, dan pembuahan (unsur P).',
        'Meningkatkan daya tahan pohon terhadap penyakit dan kekeringan (unsur K).',
      ],
    ),
    const TipsPerawatan(
      nama: 'Pupuk Kandang',
      jenis: 'Pupuk Organik',
      deskripsi:
          'Berasal dari kotoran hewan (sapi, kambing, ayam) yang telah difermentasi. Sangat baik untuk memperbaiki struktur tanah.',
      manfaat: [
        'Menyediakan unsur hara makro dan mikro secara lengkap.',
        'Membuat tanah menjadi lebih gembur dan meningkatkan kemampuan menyimpan air.',
        'Meningkatkan aktivitas mikroorganisme baik di dalam tanah.',
      ],
    ),
    const TipsPerawatan(
      nama: 'Pupuk Kompos',
      jenis: 'Pupuk Organik',
      deskripsi:
          'Hasil dari penguraian bahan-bahan organik seperti sisa tanaman, daun kering, atau sampah dapur.',
      manfaat: [
        'Memperbaiki struktur tanah dan sistem drainase.',
        'Menetralkan pH tanah yang terlalu asam.',
        'Meningkatkan ketersediaan nutrisi bagi tanaman secara perlahan dan stabil.',
      ],
    ),

    // --- KATEGORI TEKNIK PERAWATAN (DATA BARU) ---
    const TipsPerawatan(
      nama: 'Penyiraman yang Tepat',
      jenis: 'Teknik Perawatan Dasar',
      deskripsi:
          'Air adalah komponen vital bagi pertumbuhan pohon. Frekuensi dan volume penyiraman harus disesuaikan dengan jenis pohon, cuaca, dan kondisi tanah.',
      manfaat: [
        'Pohon muda (baru tanam) membutuhkan air lebih sering, siram setiap 1-2 hari sekali.',
        'Siram pada pagi atau sore hari untuk mengurangi penguapan.',
        'Pastikan air meresap dalam ke tanah hingga mencapai zona akar, bukan hanya membasahi permukaan.',
        'Kurangi frekuensi penyiraman saat musim hujan.',
      ],
    ),
    const TipsPerawatan(
      nama: 'Pemangkasan (Pruning)',
      jenis: 'Teknik Perawatan Lanjutan',
      deskripsi:
          'Pemotongan cabang atau ranting yang tidak perlu untuk merangsang pertumbuhan, membentuk tajuk, dan menjaga kesehatan pohon.',
      manfaat: [
        'Membuang cabang yang sakit, mati, atau terserang hama untuk mencegah penyebaran.',
        'Meningkatkan penetrasi sinar matahari ke seluruh bagian pohon.',
        'Merangsang munculnya tunas baru, bunga, dan buah.',
        'Membentuk struktur pohon agar lebih kokoh dan estetis.',
      ],
    ),
    const TipsPerawatan(
      nama: 'Pengendalian Gulma',
      jenis: 'Teknik Perawatan Dasar',
      deskripsi:
          'Gulma adalah tumbuhan liar yang tumbuh di sekitar pohon dan bersaing untuk mendapatkan nutrisi, air, dan cahaya matahari.',
      manfaat: [
        'Memastikan nutrisi dari tanah dan pupuk terserap maksimal oleh pohon.',
        'Mengurangi tempat persembunyian hama dan penyakit.',
        'Menjaga kelembapan tanah di sekitar area perakaran pohon.',
        'Area tanam terlihat lebih bersih dan terawat.',
      ],
    ),
  ];

  // Fungsi untuk mengambil semua data tips
  static List<TipsPerawatan> getTipsList() {
    return _tipsList;
  }
}
