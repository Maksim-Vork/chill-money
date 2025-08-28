import 'package:chill_money/features/dashboard/domain/entity/savings.dart';

abstract class DashboardRepository {
  Future<Savings> getCurrentAmount();
  Future<void> updateCurrentAmount(Savings savings);
}
