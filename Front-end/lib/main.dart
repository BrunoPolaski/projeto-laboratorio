import 'package:app_facul/app/infra/repositories/home_page_repository.dart';
import 'package:app_facul/app/presentation/providers/home_page_provider.dart';
import 'package:app_facul/app/usecases/get_received_payments_usecase.dart';
import 'package:app_facul/app/utils/device_dimensions_utils.dart';
import 'package:app_facul/app/presentation/views/home/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomePageProvider(HomePageRepository(), GetReceivedPaymentsUseCase(HomePageRepository())),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceDimensions.init(context);

    return 
    MaterialApp(
      title: 'App Facul',
      home: MyHomePage(title: 'App'),
    );
  }
}