
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:planthis/core/models/user.dart';
import 'package:planthis/features/auth/data/auth_service.dart';

final AuthControllerProvider = StateNotifierProvider<AuthController, AsyncValue<AppUser?>>(
  (ref) => AuthController(ref),
);

class AuthController extends StateNotifier<AsyncValue<AppUser?>> {
  final Ref ref;
  final AuthService _authService = AuthService();

  AuthController(this.ref) : super(const AsyncValue.loading()) {
    _authService.authStateChanges.listen((firebaseUser) {
      if (firebaseUser != null) {
        state = AsyncValue.data(AppUser.fromFirebaseUser(firebaseUser));
      } else {
        state = const AsyncValue.data(null);
      }
    });
  }

  Future<void> login(String email, String password) async {
    state = AsyncValue.loading();
    try {
      final user = await _authService.signInWithEmail(email, password);
      state = AsyncValue.data(AppUser.fromFirebaseUser(user!));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> register(String email, String password) async {
    state = AsyncValue.loading();
    try {
      final user = await _authService.registerWithEmail(email, password);
      await _authService.sendEmailVerification();
      state = AsyncValue.data(AppUser.fromFirebaseUser(user!));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    try {
      final user = await _authService.signInWithGoogle();
      state = AsyncValue.data(AppUser.fromFirebaseUser(user!));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> logout() async {
    await _authService.signOut();
    state = const AsyncValue.data(null);
  }
}