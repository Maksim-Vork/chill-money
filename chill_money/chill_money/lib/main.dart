import 'package:chill_money/features/auth/data/datasource/auth_datasource.dart';
import 'package:chill_money/features/auth/data/repository/auth_reposiry_impl.dart';
import 'package:chill_money/features/auth/domain/repository/auth_repository.dart';
import 'package:chill_money/features/auth/domain/usecase/check_auth_user_usecase.dart';
import 'package:chill_money/features/auth/domain/usecase/login_with_email_usecase.dart';
import 'package:chill_money/features/auth/domain/usecase/login_with_google_usecase.dart';
import 'package:chill_money/features/auth/domain/usecase/register_usecase.dart';
import 'package:chill_money/features/auth/domain/usecase/sign_out_usecase.dart';
import 'package:chill_money/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chill_money/features/auth/presentation/bloc/auth_event.dart';
import 'package:chill_money/features/auth/presentation/screen/ondoarding/ondoarding_screen.dart';
import 'package:chill_money/features/budgets/data/repository/budget_repository_impl.dart';
import 'package:chill_money/features/budgets/data/source/budget_data_source.dart';
import 'package:chill_money/features/budgets/domain/repository/budget_repository.dart';
import 'package:chill_money/features/budgets/domain/usecase/add_budget.dart';
import 'package:chill_money/features/budgets/domain/usecase/delete_budget.dart';
import 'package:chill_money/features/budgets/domain/usecase/get_all_budgets.dart';
import 'package:chill_money/features/budgets/domain/usecase/update_budget.dart';
import 'package:chill_money/features/budgets/presentation/bloc/budget_bloc.dart';
import 'package:chill_money/features/budgets/presentation/bloc/budget_event.dart';
import 'package:chill_money/features/dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:chill_money/features/dashboard/data/source/remote_dashboard_source.dart';
import 'package:chill_money/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:chill_money/features/dashboard/domain/usecase/get_current_amount.dart';
import 'package:chill_money/features/dashboard/domain/usecase/update_current_amount.dart';
import 'package:chill_money/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:chill_money/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:chill_money/features/transactions/data/repository/transaction_repository_impl.dart';
import 'package:chill_money/features/transactions/data/source/remote_transaction_datasource.dart';
import 'package:chill_money/features/transactions/domain/repository/transaction_repository.dart';
import 'package:chill_money/features/transactions/domain/usecase/add_transactions.dart';
import 'package:chill_money/features/transactions/domain/usecase/get_stats_usecase.dart';
import 'package:chill_money/features/transactions/domain/usecase/get_transactions.dart';
import 'package:chill_money/features/transactions/presentation/bloc/transact_bloc.dart';
import 'package:chill_money/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final AuthDatasource authDatasource = AuthDatasource();
  final AuthRepository authRepository = AuthReposiryImpl(
    authDatasource: authDatasource,
  );
  final CheckAuthUserUsecase checkAuthUserUsecase = CheckAuthUserUsecase(
    authRepository: authRepository,
  );
  final LoginWithEmailUsecase loginWithEmailUsecase = LoginWithEmailUsecase(
    authRepository: authRepository,
  );
  final RegisterUsecase registerUsecase = RegisterUsecase(
    authRepository: authRepository,
  );
  final SignOutUsecase signOutUsecase = SignOutUsecase(
    authRepository: authRepository,
  );

  final RemoteBudgetDataSource budgetDataSource = RemoteBudgetDataSource();
  final BudgetRepository budgetRepository = BudgetRepositoryImpl(
    budgetDataSource: budgetDataSource,
  );
  final AddBudgetUsecase addBudgetUsecase = AddBudgetUsecase(
    budgetRepository: budgetRepository,
  );
  final DeleteBudgetUsecase deleteBudgetUsecase = DeleteBudgetUsecase(
    budgetRepository: budgetRepository,
  );
  final GetAllBudgetsUsecase getAllBudgetsUsecase = GetAllBudgetsUsecase(
    budgetRepository: budgetRepository,
  );
  final UpdateBudgetUsecase updateBudgetUsecase = UpdateBudgetUsecase(
    budgetRepository: budgetRepository,
  );
  final LoginWithGoogleUsecase loginWithGoogleUsecase = LoginWithGoogleUsecase(
    authRepository: authRepository,
  );
  final RemoteDashboardSource remoteDashboardSource = RemoteDashboardSource();

  final DashboardRepository dashboardRepository = DashboardRepositoryImpl(
    remoteDashboardSource: remoteDashboardSource,
  );
  final GetCurrentAmountUsecase getCurrentAmountUsecase =
      GetCurrentAmountUsecase(dashboardRepository: dashboardRepository);
  final UpdateCurrentAmountUsecase updateCurrentAmountUsecase =
      UpdateCurrentAmountUsecase(dashboardRepository: dashboardRepository);
  final RemoteTransactionDatasource remoteTransactionDatasource =
      RemoteTransactionDatasource();
  final TransactionRepository transactionRepository = TransactionRepositoryImpl(
    remoteTransactionDataSource: remoteTransactionDatasource,
  );
  final AddTransactions addTransactions = AddTransactions(
    budgetRepository,
    dashboardRepository,
    transactionRepository: transactionRepository,
  );
  final GetTransactions getTransactions = GetTransactions(
    transactionRepository: transactionRepository,
  );

  final GetStatsUsecase getStatsUsecase = GetStatsUsecase(
    transactionRepository: transactionRepository,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BudgetBloc(
            addBudgetUsecase,
            deleteBudgetUsecase,
            getAllBudgetsUsecase,
            updateBudgetUsecase,
          ),
        ),
        BlocProvider(
          create: (context) => DashboardBloc(
            getCurrentAmountUsecase,
            updateCurrentAmountUsecase,
          ),
        ),
        BlocProvider(
          create: (context) => TransactBloc(
            addTransactions,
            getTransactions,
            context.read<DashboardBloc>(),
            context.read<BudgetBloc>(),
            getStatsUsecase,
          ),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            checkAuthUserUsecase,
            loginWithEmailUsecase,
            registerUsecase,
            signOutUsecase,
            loginWithGoogleUsecase,
            context.read<BudgetBloc>(),
            context.read<DashboardBloc>(),
          )..add(ChechAuthEvent()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      home: WelcomeScreen(),
    );
  }
}
