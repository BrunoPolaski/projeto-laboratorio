import 'package:app_facul/app/infra/repositories/home_page_repository.dart';
import 'package:app_facul/app/domain/entities/models/received_payment_models.dart';

class GetReceivedPaymentsUseCase {
  HomePageRepository homePageRepository = HomePageRepository();

  GetReceivedPaymentsUseCase(HomePageRepository homePageRepository);

  Future<List<ReceivedPaymentsModel>> execute() async {
    final receivedPayments = await homePageRepository.getReceivedPayments();
    return receivedPayments;

  }
}