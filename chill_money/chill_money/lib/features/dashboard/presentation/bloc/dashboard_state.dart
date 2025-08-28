import 'package:chill_money/features/dashboard/domain/entity/savings.dart';

abstract class DashboardState {}

class InitialDashboardState extends DashboardState {}

class LoadingDashboardState extends DashboardState {}

class LoadedDashboardState extends DashboardState {
  final Savings savings;

  LoadedDashboardState({required this.savings});
}

class ErrorDashboardState extends DashboardState {
  final String error;

  ErrorDashboardState({required this.error});
}
