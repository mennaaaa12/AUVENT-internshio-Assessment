import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/Features/auth/data/models/auth.dart';
import 'package:store/Features/auth/data/repository/auth_repo.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthInitial());

  void login(String username, String password) async {
    try {
      emit(AuthLoading());
      final response = await authRepository.login(username, password);
      if (response != null) {
        emit(AuthLoaded(response));
      } else {
        emit(AuthError('Login failed'));
      }
    } catch (e) {
      emit(AuthError('An error occurred: $e'));
    }
  }
}
