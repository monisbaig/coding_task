import 'package:coding_task/data/auth_service.dart';
import 'package:coding_task/cubits/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService _authService;

  LoginCubit(this._authService) : super(LoginInitial());

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    emit(LoginLoading());
    try {
      final user =
          await _authService.signInWithEmailAndPassword(email, password);
      emit(LoginSuccess(user));
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'user-not-found') {
        try {
          final user = await _authService.createUserWithEmailAndPassword(
              email, password);
          emit(LoginSuccess(user));
        } catch (error) {
          emit(LoginError('Failed to create user: $error'));
        }
      } else {
        emit(LoginError(e.toString()));
      }
    }
  }

  Future<void> logout() async {
    await _authService.signOut();
    emit(LoginInitial());
  }
}
