import 'dart:async';

import 'package:chill_money/features/budgets/domain/entity/budget.dart';
import 'package:chill_money/features/budgets/domain/usecase/add_budget.dart';
import 'package:chill_money/features/budgets/domain/usecase/delete_budget.dart';
import 'package:chill_money/features/budgets/domain/usecase/get_all_budgets.dart';
import 'package:chill_money/features/budgets/domain/usecase/update_budget.dart';
import 'package:chill_money/features/budgets/presentation/bloc/budget_event.dart';
import 'package:chill_money/features/budgets/presentation/bloc/budget_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final AddBudgetUsecase addBudgetUsecase;
  final DeleteBudgetUsecase deleteBudgetUsecase;
  final GetAllBudgetsUsecase getAllBudgetsUsecase;
  final UpdateBudgetUsecase updateBudgetUsecase;

  BudgetBloc(
    this.addBudgetUsecase,
    this.deleteBudgetUsecase,
    this.getAllBudgetsUsecase,
    this.updateBudgetUsecase,
  ) : super(InitialBudget()) {
    on<CreateBudgetEvent>(_onCreateBudget);
    on<DeleteBudgetEvent>(_onDeleteBudget);
    on<UpdateBudgetEvent>(_onUpdateBudget);
    on<GetAllBudgetEvent>(_onGetAllBudget);
    on<ResetBudgetEvent>(_onResetBudget);
  }

  void _onCreateBudget(
    CreateBudgetEvent event,
    Emitter<BudgetState> emit,
  ) async {
    emit(LoadingBudget());
    try {
      await addBudgetUsecase(event.budget);
      final List<Budget> budgets = await getAllBudgetsUsecase();
      emit(LoadedBudget(budgets: budgets));
    } catch (e) {
      emit(ErorBudget(error: e.toString()));
    }
  }

  void _onDeleteBudget(
    DeleteBudgetEvent event,
    Emitter<BudgetState> emit,
  ) async {
    try {
      await deleteBudgetUsecase(event.id);
      final List<Budget> budgets = await getAllBudgetsUsecase();
      emit(LoadedBudget(budgets: budgets));
    } catch (e) {
      emit(ErorBudget(error: e.toString()));
    }
  }

  void _onUpdateBudget(
    UpdateBudgetEvent event,
    Emitter<BudgetState> emit,
  ) async {
    try {
      await updateBudgetUsecase(event.budget);
      final List<Budget> budgets = await getAllBudgetsUsecase();
      emit(LoadedBudget(budgets: budgets));
    } catch (e) {
      emit(ErorBudget(error: e.toString()));
    }
  }

  void _onGetAllBudget(
    GetAllBudgetEvent event,
    Emitter<BudgetState> emit,
  ) async {
    emit(LoadingBudget());
    try {
      final List<Budget> budgets = await getAllBudgetsUsecase();
      emit(LoadedBudget(budgets: budgets));
    } catch (e) {
      emit(ErorBudget(error: e.toString()));
      debugPrint(e.toString());
    }
  }

  void _onResetBudget(ResetBudgetEvent event, Emitter<BudgetState> emit) {
    emit(InitialBudget());
  }
}
