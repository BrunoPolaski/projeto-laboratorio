import 'dart:async';

import 'package:app_facul/app/infra/repositories/home_page_repository.dart';
import 'package:app_facul/app/presentation/providers/home_page_provider.dart';
import 'package:app_facul/app/usecases/create_debt_usecase.dart';
import 'package:app_facul/app/usecases/get_received_payments_usecase.dart';
import 'package:app_facul/app/usecases/get_unreceived_payments_usecase.dart';
import 'package:app_facul/app/usecases/update_debt_usecase.dart';
import 'package:app_facul/app/presentation/views/home/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Paint.enableDithering = true;

  runZonedGuarded(() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MyApp(),
  );
  }, (error, stack) {
  },);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageRepository homePageRepository = HomePageRepository();
      
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomePageProvider(
            GetReceivedPaymentsUseCase(homePageRepository),
            GetUnreceivedPaymentsUseCase(homePageRepository),
            CreateDebtUsecase(homePageRepository),
            UpdateDebtUseCase(homePageRepository),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}