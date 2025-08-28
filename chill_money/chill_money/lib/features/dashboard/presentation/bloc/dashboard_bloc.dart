import 'package:chill_money/features/dashboard/domain/entity/savings.dart';
import 'package:chill_money/features/dashboard/domain/usecase/get_current_amount.dart';
import 'package:chill_money/features/dashboard/domain/usecase/update_current_amount.dart';
import 'package:chill_money/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:chill_money/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetCurrentAmountUsecase getCurrentAmountUsecase;
  final UpdateCurrentAmountUsecase updateCurrentAmountUsecase;
  DashboardBloc(this.getCurrentAmountUsecase, this.updateCurrentAmountUsecase)
    : super(InitialDashboardState()) {
    on<GetSavingsEvent>(_getSavings);
    on<UpdateSavingsEvent>(_updateSavings);
    on<ResetSavingsEvent>(_onResetSavings);
  }

  void _getSavings(GetSavingsEvent event, Emitter<DashboardState> emit) async {
    emit(LoadingDashboardState());
    try {
      final Savings savings = await getCurrentAmountUsecase();
      emit(LoadedDashboardState(savings: savings));
    } catch (e) {
      emit(ErrorDashboardState(error: e.toString()));
    }
  }

  void _updateSavings(
    UpdateSavingsEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(LoadingDashboardState());
    try {
      await updateCurrentAmountUsecase(event.savings);
      final Savings savings = await getCurrentAmountUsecase();
      emit(LoadedDashboardState(savings: savings));
    } catch (e) {
      emit(ErrorDashboardState(error: e.toString()));
    }
  }

  void _onResetSavings(ResetSavingsEvent event, Emitter<DashboardState> emit) {
    emit(InitialDashboardState());
  }
}
