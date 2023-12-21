import 'package:app_facul/app/entities/models/popup_model.dart';
import 'package:app_facul/app/presentation/layout/custom_size.dart';
import 'package:app_facul/app/presentation/views/home/create_debt_view.dart';
import 'package:app_facul/app/presentation/views/insights/insights_view.dart';
import 'package:app_facul/app/presentation/widgets/common/custom_payment_card.dart';
import 'package:app_facul/app/presentation/widgets/common/custom_rectangle_button_widget.dart';
import 'package:app_facul/app/presentation/layout/custom_layout.dart';
import 'package:app_facul/app/presentation/providers/home_page_provider.dart';
import 'package:app_facul/app/presentation/themes/colors.dart';
import 'package:app_facul/app/presentation/themes/typography.dart';
import 'package:app_facul/app/utils/device_dimensions_utils.dart';
import 'package:app_facul/app/utils/warnings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceDimensions.init(context);
    final provider = Provider.of<HomePageProvider>(context);

    return CustomLayout(
      horizontalPadding: 0,
      appBar: AppBar(
        foregroundColor: AppColors.green,
        backgroundColor: Colors.white,
        elevation: 0,
        title: provider.icon == Icons.close
            ? TextField(
                style: AppTypography.textBodyGreen,
                decoration: const InputDecoration(
                  hintText: 'Pesquisar',
                  hintStyle: AppTypography.textBodyGreen,
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  provider.filterReceivedPayments(value);
                  provider.filterUnreceivedPayments(value);
                },
              )
            : Container(),
        actions: [
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              if (provider.icon == Icons.search) {
                provider.setReceivedButtonIcon(Icons.close);
              } else {
                provider.setReceivedButtonIcon(Icons.search);
                provider.resetFilterLists();
              }
            },
            icon: Icon(
              provider.icon,
              color: AppColors.green,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.isDebtTypeSelected = true;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateDebtView()));
        },
        backgroundColor: AppColors.green,
        child: const Icon(Icons.add),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRectangleButtonWidget(
                  height: CustomHeight.custom(110),
                  width: MediaQuery.of(context).size.width / 2.5,
                  onPressed: () {
                    provider.getReceivedPayments();
                    provider.setReceivedButtonOn(true);
                  },
                  text: 'Pagamentos recebidos',
                  color: provider.receivedButtonOn
                      ? AppColors.green
                      : AppColors.white,
                  textStyle: provider.receivedButtonOn
                      ? AppTypography.textBodyWhite
                      : AppTypography.textBodyGreen),
              CustomRectangleButtonWidget(
                  height: CustomHeight.custom(110),
                  width: MediaQuery.of(context).size.width / 2.5,
                  onPressed: () {
                    provider.getUnreceivedPayments();
                    provider.setReceivedButtonOn(false);
                  },
                  text: 'Pagamentos a receber',
                  color: provider.receivedButtonOn
                      ? AppColors.white
                      : AppColors.green,
                  textStyle: provider.receivedButtonOn
                      ? AppTypography.textBodyGreen
                      : AppTypography.textBodyWhite),
            ],
          ),
          if (provider.receivedButtonOn) ...[
            Container(
                margin: EdgeInsets.symmetric(vertical: CustomHeight.custom(20)),
                child: Text(
                  'Total de pagamentos recebidos: ${provider.receivedPaymentsFiltered.length}/${provider.receivedPaymentsFiltered.length + provider.unreceivedPaymentsFiltered.length}',
                  style: AppTypography.textBodyGreen,
                )),
            Expanded(
              child: CarouselSlider(
                items: provider.receivedPaymentsFiltered
                    .map((element) => CustomPaymentCard(
                        isPaid: true,
                        typeOfPayment: element.paymentMode,
                        dateText: element.totalPaidAt,
                        valueText: element.totalValue,
                        debtor: element.debtor))
                    .toList(),
                options: CarouselOptions(
                  padEnds: false,
                  viewportFraction: 0.2,
                  initialPage: 2,
                  scrollDirection: Axis.vertical,
                  enableInfiniteScroll: false,
                  scrollPhysics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                ),
              ),
            )
          ] else ...[
            Container(
                margin: EdgeInsets.symmetric(vertical: CustomHeight.custom(20)),
                child: Text(
                  'Total de pagamentos a receber: ${provider.unreceivedPaymentsFiltered.length}',
                  style: AppTypography.textBodyGreen,
                )),
            Expanded(
              child: CarouselSlider(
                items: provider.unreceivedPaymentsFiltered
                    .map((element) => 
                    GestureDetector(
                      onTap: () =>  showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Deseja marcar como pago?'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('Valor: R\$ ${element.debtValue.toString().replaceAll(".", ",")}'),
                                  Text('Devedor: ${element.debtor}'),
                                  Text('Data de vencimento: ${element.nextDueDate.substring(5, 10).replaceAll("-", "/")}'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Sim'),
                                onPressed: () {
                                  provider.updateDebt(element);
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Não'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      child: 
                    
                    CustomPaymentCard(
                          isPaid: false,
                          typeOfPayment: element.paymentMode,
                          dateText: element.nextDueDate,
                          valueText: element.debtValue,
                          debtor: element.debtor,
                    )))
                    .toList(),

                options: CarouselOptions(
                  padEnds: false,
                  viewportFraction: 0.2,
                  enlargeCenterPage: false,
                  autoPlay: false,
                  aspectRatio: 2.0,
                  initialPage: 2,
                  scrollDirection: Axis.vertical,
                  enableInfiniteScroll: false,
                  scrollPhysics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}
