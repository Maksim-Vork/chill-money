import 'package:chill_money/features/dashboard/domain/entity/savings.dart';

abstract class DashboardEvent {}

class GetSavingsEvent extends DashboardEvent {}

class UpdateSavingsEvent extends DashboardEvent {
  final Savings savings;

  UpdateSavingsEvent({required this.savings});
}

class ResetSavingsEvent extends DashboardEvent {}
