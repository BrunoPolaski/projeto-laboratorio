import 'package:app_facul/app/presentation/layout/custom_layout.dart';
import 'package:app_facul/app/presentation/layout/custom_size.dart';
import 'package:app_facul/app/presentation/providers/home_page_provider.dart';
import 'package:app_facul/app/presentation/themes/colors.dart';
import 'package:app_facul/app/presentation/themes/typography.dart';
import 'package:app_facul/app/presentation/views/home/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InsightsView extends StatelessWidget {
  const InsightsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageProvider>(context);

    return CustomLayout(
      horizontalPadding: 0,
      child: Scaffold(
          backgroundColor: AppColors.green.withOpacity(0.1),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.green.withOpacity(0.1),
            foregroundColor: AppColors.green,
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.green,
                  ),
                  child: Text('Menu', style: AppTypography.textBodyWhite),
                ),
                ListTile(
                  title: const Text(
                    'Home',
                    style: AppTypography.textBodyGreen,
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage()));
                  },
                ),
                ListTile(
                  title: const Text(
                    'Insights',
                    style: AppTypography.textBodyGreen,
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InsightsView()));
                  },
                ),
              ],
            ),
          ),
          body: Container(
              width: double.infinity,
              color: AppColors.green.withOpacity(0.1),
              padding: EdgeInsets.all(CustomHeight.custom(20)),
              child:
             Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: CustomHeight.custom(20)),
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                          text: 'Olá, ',
                          style: AppTypography.textTitleGreenSemiBold,
                          children: [
                            TextSpan(
                              text: 'João\n',
                              style: AppTypography.textTitleGreenSemiBold.copyWith(fontStyle: FontStyle.italic),
                            ),
                            const TextSpan(
                              text: 'Pronto para ver suas estatísticas?',
                              style: AppTypography.textBodyGreen,
                            ),
                          ]),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Container(
                          margin: EdgeInsets.all(CustomHeight.custom(10)),
                          padding: EdgeInsets.all(CustomHeight.custom(20)),
                          decoration: BoxDecoration(
                            color: AppColors.lightGreen.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Total de pagamentos na sua conta',
                                textAlign: TextAlign.center,
                                style: AppTypography.textBodyGreenSemiBold,
                              ),
                              Text(
                                '${provider.receivedPayments.length + provider.unreceivedPayments.length}',
                                style: AppTypography.textTitleGreenSemiBold,
                              ),
                            ],
                          ),
                        ),
                      
                          ],
                        ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.all(CustomHeight.custom(10)),
                        padding: EdgeInsets.all(CustomHeight.custom(20)),
                        decoration: BoxDecoration(
                          color: AppColors.lightGreen.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Total de pagamentos a receber',
                              textAlign: TextAlign.center,
                              style: AppTypography.textBodyGreenSemiBold,
                            ),
                            Text(
                              'R\$ ${provider.unreceivedPaymentsValues.toStringAsFixed(2).replaceAll('.', ',')}',
                              style: AppTypography.textTitleGreenSemiBold,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )),
                      Expanded(child: 
                      Container(
                        padding: EdgeInsets.all(CustomHeight.custom(20)),
                        decoration: BoxDecoration(
                          color: AppColors.lightGreen.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Total de pagamentos recebidos',
                              textAlign: TextAlign.center,
                              style: AppTypography.textBodyGreenSemiBold,
                            ),
                            Text(
                              'R\$ ${provider.receivedPaymentsValues.toStringAsFixed(2).replaceAll('.', ',')}',
                              style: AppTypography.textTitleGreenSemiBold,
                                                            textAlign: TextAlign.center,

                            ),
                          ],
                        ),
                  ))],
                        ),
          ]),
                  )
                  )
            );
  }
}
