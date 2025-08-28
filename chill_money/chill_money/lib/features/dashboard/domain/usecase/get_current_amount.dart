import 'package:chill_money/features/dashboard/domain/entity/savings.dart';
import 'package:chill_money/features/dashboard/domain/repository/dashboard_repository.dart';

class GetCurrentAmountUsecase {
  final DashboardRepository dashboardRepository;

  GetCurrentAmountUsecase({required this.dashboardRepository});

  Future<Savings> call() async {
    return await dashboardRepository.getCurrentAmount();
  }
}
