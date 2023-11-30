import 'package:app_facul/app/entities/models/unreceived_payment_model.dart';
import 'package:app_facul/app/infra/repositories/home_page_repository.dart';

class UpdateDebtUseCase {
  final HomePageRepository homePageRepository;

  UpdateDebtUseCase(this.homePageRepository);

  Future<void> execute(UnreceivedPaymentsModel unreceivedPayment) async {
    return await homePageRepository.updateReceivedPayment(unreceivedPayment);
  }
}