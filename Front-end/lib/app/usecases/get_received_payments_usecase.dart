import 'package:app_facul/app/infra/repositories/home_page_repository.dart';
import 'package:app_facul/app/entities/models/received_payment_model.dart';

class GetReceivedPaymentsUseCase {
  HomePageRepository homePageRepository = HomePageRepository();

  GetReceivedPaymentsUseCase(HomePageRepository homePageRepository);

  Future<List<ReceivedPaymentsModel>> execute() async {
    final receivedPayments = await homePageRepository.getReceivedPayments();
    return receivedPayments;

  }
}