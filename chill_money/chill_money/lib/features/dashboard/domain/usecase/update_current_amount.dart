import 'package:chill_money/features/dashboard/domain/entity/savings.dart';
import 'package:chill_money/features/dashboard/domain/repository/dashboard_repository.dart';

class UpdateCurrentAmountUsecase {
  final DashboardRepository dashboardRepository;

  UpdateCurrentAmountUsecase({required this.dashboardRepository});

  Future<void> call(Savings savings) async {
    await dashboardRepository.updateCurrentAmount(savings);
  }
}
