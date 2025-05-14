import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planthis/app/utils.dart';
import 'package:planthis/core/models/user.dart';
import 'package:planthis/features/auth/services/auth_service.dart';

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
    if (email.isEmpty || password.isEmpty) {
      state = AsyncValue.error("Email and password can not be empty", StackTrace.current);
      return;
    }

    if (!email.validateEmail()) {
      state = AsyncValue.error("Email is not valid", StackTrace.current);
      return;
    }

    state = AsyncValue.loading();
    try {
      final user = await _authService.signInWithEmail(email, password);
      state = AsyncValue.data(AppUser.fromFirebaseUser(user!));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> register(String email, String password, String confirmPassword) async {
    if (email.isEmpty || password.isEmpty) {
      state = AsyncValue.error("Email and password can not be empty", StackTrace.current);
      return;
    }

    if (!email.validateEmail()) {
      state = AsyncValue.error("Email is not valid", StackTrace.current);
      return;
    }

    if (!password.hasMinLength(8) && !password.hasNumber() && !AppUtils.passwordMatch(password, confirmPassword)) {
      state = AsyncValue.error("Password rules are not met", StackTrace.current);
      return;
    }
  
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
