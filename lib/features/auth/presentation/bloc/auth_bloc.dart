import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_master_app/features/auth/domain/usecases/sign_out.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/get_current_user.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final SignOutUseCase signOutUseCase;

  AuthBloc({
    required this.signInUseCase,
    required this.getCurrentUserUseCase,
    required this.signOutUseCase,
  }) : super(AuthInitial()) {
    on<SignInEvent>(_onSignIn);
    on<CheckAuthEvent>(_onCheckAuth);
    on<SignOutEvent>(_onSignOut);
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    
    final result = await signInUseCase(event.email, event.password);
    
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> _onCheckAuth(CheckAuthEvent event, Emitter<AuthState> emit) async {
    final result = await getCurrentUserUseCase();
    
    result.fold(
      (failure) => emit(Unauthenticated()),
      (user) => emit(Authenticated(user)),
    );
  }

   Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    await signOutUseCase();
    emit(Unauthenticated());
  }
}