import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planthis/core/models/user.dart';
import 'package:planthis/features/auth/applications/auth_controller.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<AppUser?>>(
      (ref) => AuthController(ref),
    );
