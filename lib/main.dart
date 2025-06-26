import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planthis/app/theme/app_theme.dart';
import 'package:planthis/features/auth/presentations/auth_gate.dart';
import 'package:planthis/features/auth/presentations/login_screen.dart';
import 'package:planthis/features/auth/presentations/register_screen.dart';
import 'package:planthis/features/lahan_saya/presentations/lahan_saya_screen.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:planthis/features/rekomendasi_pohon/presentations/rekomendasi_pohon_screen.dart';
import 'package:planthis/features/ilmu_padi/presentations/ilmu_padi_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FMTCObjectBoxBackend().initialise();
  await FMTCStore('mapStore').manage.create();

  runApp(
    const ProviderScope(
      // <-- Wrap with ProviderScope
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planthis',
      theme: AppTheme.appTheme,
      home: const AuthGate(),
      routes: {
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
        '/lahan-saya': (context) => const LahanSayaScreen(),
        '/ilmu-padi': (context) => const IlmuPadiScreen()
      },
    );
  }
}
