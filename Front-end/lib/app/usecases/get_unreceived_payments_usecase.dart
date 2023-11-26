import 'package:app_facul/app/entities/models/unreceived_payment_model.dart';
import 'package:app_facul/app/infra/repositories/home_page_repository.dart';

class GetUnreceivedPaymentsUseCase {
  final HomePageRepository homePageRepository;

  GetUnreceivedPaymentsUseCase(this.homePageRepository);

  Future<List<UnreceivedPaymentsModel>> execute() async {
    final response = homePageRepository.getUnreceivedPayments();
    return response;
  }
}