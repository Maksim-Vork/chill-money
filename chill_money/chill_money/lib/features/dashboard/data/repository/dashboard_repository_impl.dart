import 'package:chill_money/features/dashboard/data/models/Savings.dart';
import 'package:chill_money/features/dashboard/data/source/remote_dashboard_source.dart';
import 'package:chill_money/features/dashboard/domain/entity/savings.dart';
import 'package:chill_money/features/dashboard/domain/repository/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final RemoteDashboardSource remoteDashboardSource;

  DashboardRepositoryImpl({required this.remoteDashboardSource});
  @override
  Future<Savings> getCurrentAmount() async {
    final SavingsModel savingsModel = await remoteDashboardSource.getAmount();
    final Savings savings = Savings(amount: savingsModel.amount);
    return savings;
  }

  @override
  Future<void> updateCurrentAmount(Savings savings) async {
    final SavingsModel savingsModel = SavingsModel(amount: savings.amount);
    await remoteDashboardSource.updateAmount(savingsModel);
  }
}
