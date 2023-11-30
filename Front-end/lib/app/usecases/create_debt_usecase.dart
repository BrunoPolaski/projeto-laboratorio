import 'package:app_facul/app/entities/models/create_debt_model.dart';
import 'package:app_facul/app/infra/repositories/home_page_repository.dart';

class CreateDebtUsecase {
  final HomePageRepository homePageRepository;

  CreateDebtUsecase(this.homePageRepository);

  Future<void> execute(CreateDebtModel debt) async {
    return await homePageRepository.createDebt(debt);
  }
}