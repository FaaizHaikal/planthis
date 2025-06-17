import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planthis/features/lahan_saya/applications/lahan_saya_controller.dart';
import 'package:planthis/features/lahan_saya/states/lahan_saya_state.dart';

final lahanSayaControllerProvider =
    StateNotifierProvider<LahanSayaController, LahanSayaState>(
      (ref) => LahanSayaController(),
    );
