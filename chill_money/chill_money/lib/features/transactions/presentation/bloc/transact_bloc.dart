import 'package:chill_money/features/budgets/presentation/bloc/budget_bloc.dart';
import 'package:chill_money/features/budgets/presentation/bloc/budget_event.dart';
import 'package:chill_money/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:chill_money/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:chill_money/features/transactions/domain/entity/stats.dart';
import 'package:chill_money/features/transactions/domain/entity/transaction.dart';
import 'package:chill_money/features/transactions/domain/usecase/add_transactions.dart';
import 'package:chill_money/features/transactions/domain/usecase/get_stats_usecase.dart';
import 'package:chill_money/features/transactions/domain/usecase/get_transactions.dart';
import 'package:chill_money/features/transactions/presentation/bloc/transact_event.dart';
import 'package:chill_money/features/transactions/presentation/bloc/transact_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactBloc extends Bloc<TransactEvent, TransactState> {
  final DashboardBloc dashboardBloc;
  final BudgetBloc budgetBloc;
  final AddTransactions addTransactions;
  final GetTransactions getTransactions;
  final GetStatsUsecase getStatsUsecase;
  TransactBloc(
    this.addTransactions,
    this.getTransactions,
    this.dashboardBloc,
    this.budgetBloc,
    this.getStatsUsecase,
  ) : super(InitialTransactState()) {
    on<GetTransactionsEvent>(_onGetTransacts);
    on<AddTransactionEvent>(_onAddTransact);
  }

  void _onGetTransacts(
    GetTransactionsEvent event,
    Emitter<TransactState> emit,
  ) async {
    emit(LoadingTransactState());
    try {
      final List<Transact> transactions = await getTransactions();
      final Stats stats = await getStatsUsecase();

      emit(LoadedTransactState(transactions: transactions, stats: stats));
    } catch (e) {
      emit(ErrorTransactState(error: e.toString()));
    }
  }

  void _onAddTransact(
    AddTransactionEvent event,
    Emitter<TransactState> emit,
  ) async {
    try {
      await addTransactions(event.transact);
      dashboardBloc.add(GetSavingsEvent());
      budgetBloc.add(GetAllBudgetEvent());
      final List<Transact> transactions = await getTransactions();
      final Stats stats = await getStatsUsecase();
      emit(LoadedTransactState(transactions: transactions, stats: stats));
    } catch (e) {
      emit(ErrorTransactState(error: e.toString()));
    }
  }
}
