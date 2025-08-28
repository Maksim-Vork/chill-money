import 'package:chill_money/features/auth/domain/usecase/check_auth_user_usecase.dart';
import 'package:chill_money/features/auth/domain/usecase/login_with_email_usecase.dart';
import 'package:chill_money/features/auth/domain/usecase/login_with_google_usecase.dart';
import 'package:chill_money/features/auth/domain/usecase/register_usecase.dart';
import 'package:chill_money/features/auth/domain/usecase/sign_out_usecase.dart';
import 'package:chill_money/features/auth/presentation/bloc/auth_event.dart';
import 'package:chill_money/features/auth/presentation/bloc/auth_state.dart';
import 'package:chill_money/features/budgets/presentation/bloc/budget_bloc.dart';
import 'package:chill_money/features/budgets/presentation/bloc/budget_event.dart';
import 'package:chill_money/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:chill_money/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckAuthUserUsecase checkAuthUserUsecase;
  final LoginWithEmailUsecase loginWithEmailUsecase;
  final RegisterUsecase registerUsecase;
  final SignOutUsecase signOutUsecase;
  final LoginWithGoogleUsecase loginWithGoogleUsecase;
  final BudgetBloc budgetBloc;
  final DashboardBloc dashboardBloc;
  AuthBloc(
    this.checkAuthUserUsecase,
    this.loginWithEmailUsecase,
    this.registerUsecase,
    this.signOutUsecase,
    this.loginWithGoogleUsecase,
    this.budgetBloc,
    this.dashboardBloc,
  ) : super(InititalAuth()) {
    on<ChechAuthEvent>(_onChech);
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<SignOutEvent>(_onSignOut);
    on<LoginWithGoogleEvent>(_onLoginWithGoogle);
  }

  void _onChech(ChechAuthEvent event, Emitter<AuthState> emit) async {
    emit(LoadedAuth());
    try {
      final bool userAuth = await checkAuthUserUsecase();
      if (userAuth) {
        emit(LoadedAuth());
        budgetBloc.add(GetAllBudgetEvent());
        dashboardBloc.add(GetSavingsEvent());
      } else {
        emit(InititalAuth());
      }
    } catch (e) {
      emit(ErrorAuth(error: e.toString()));
    }
  }

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadedAuth());
    try {
      await loginWithEmailUsecase(event.email, event.password);
      budgetBloc.add(GetAllBudgetEvent());
      dashboardBloc.add(GetSavingsEvent());
      emit(LoadedAuth());
    } catch (e) {
      emit(ErrorAuth(error: e.toString()));
      debugPrint('ОШИБКА $e');
    }
  }

  void _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(LoadedAuth());
    try {
      await registerUsecase(event.email, event.password);
      budgetBloc.add(GetAllBudgetEvent());
      dashboardBloc.add(GetSavingsEvent());
      emit(LoadedAuth());
    } catch (e) {
      emit(ErrorAuth(error: e.toString()));
    }
  }

  void _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(LoadedAuth());
    try {
      await signOutUsecase();
      budgetBloc.add(ResetBudgetEvent());
      dashboardBloc.add(ResetSavingsEvent());
      emit(InititalAuth());
    } catch (e) {
      emit(ErrorAuth(error: e.toString()));
    }
  }

  void _onLoginWithGoogle(
    LoginWithGoogleEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingAuth());
    try {
      await loginWithGoogleUsecase();

      emit(LoadedAuth());
    } catch (e) {
      emit(ErrorAuth(error: e.toString()));
    }
  }
}
