import 'package:app_facul/app/presentation/layout/custom_size.dart';
import 'package:app_facul/app/presentation/views/insights/insights_view.dart';
import 'package:app_facul/app/presentation/widgets/common/custom_rectangle_button_widget.dart';
import 'package:app_facul/app/presentation/layout/custom_layout.dart';
import 'package:app_facul/app/presentation/providers/home_page_provider.dart';
import 'package:app_facul/app/presentation/themes/colors.dart';
import 'package:app_facul/app/presentation/themes/typography.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageProvider>(context);

    return CustomLayout(
      horizontalPadding: 0,
      appBar: AppBar(
          foregroundColor: AppColors.purple,
          backgroundColor: Colors.white,
          elevation: 0,
          title: provider.icon == Icons.close ? TextField(
            style: AppTypography.textBodyPurple,
            decoration: const InputDecoration(
              hintText: 'Pesquisar',
              hintStyle: AppTypography.textBodyPurple,
              border: InputBorder.none,
            ),
            onChanged: (value) {
            },
          )
          : Container(),
          actions: [
            IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: (){
                if(provider.icon == Icons.search){
                  provider.setReceivedButtonIcon(Icons.close);
                } else {
                  provider.setReceivedButtonIcon(Icons.search);
                  provider.resetFilterLists();
                }
              },
              icon: Icon(provider.icon, color: AppColors.purple,),
            ),
          ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor: AppColors.purple,
          child: const Icon(Icons.add),
        ),
      drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.purple,
                ),
                child: Text('Menu', style: AppTypography.textBodyWhite),
              ),
              ListTile(
                title: const Text('Home', style: AppTypography.textBodyPurple,),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
                },
              ),
              ListTile(
                title: const Text('Insights', style: AppTypography.textBodyPurple,),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InsightsView()));
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
             onPressed: (){
                provider.setReceivedButtonOn(true);
             },
             text: 'Pagamentos recebidos',
             color: AppColors.white,
             textStyle: AppTypography.textBodyPurple,
           ),
           CustomRectangleButtonWidget(
              height: CustomHeight.custom(110),
            width: MediaQuery.of(context).size.width / 2.5,
             onPressed: (){
                provider.setReceivedButtonOn(false);
             },
             text: 'Pagamentos a receber',
             color: AppColors.purple,
             textStyle: AppTypography.textBodyWhite,
            ),
          ],
        ),
      if(provider.receivedButtonOn) ...[
      Container(
        margin: EdgeInsets.symmetric(vertical: CustomHeight.custom(20)),
        child: Text('Total de pagamentos recebidos: ${provider.receivedPaymentsFiltered.length}/${provider.receivedPaymentsFiltered.length + provider.unreceivedPaymentsFiltered.length}', style: AppTypography.textBodyPurple,)),
      Expanded(
        child: CarouselSlider(
          items: provider.receivedPaymentsFiltered.map((element) => Padding(
            padding: EdgeInsets.symmetric(horizontal: CustomWidth.custom(20)),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: CustomHeight.custom(100),
                    decoration: BoxDecoration(
                      color: AppColors.lightPurple.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.wallet, color: AppColors.purple, size: 60),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(element.amount, style: AppTypography.textTitlePurpleSemiBold,),
                        Text(element.nameOfSender.toString(), style: AppTypography.textBodyPurple,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )).toList(),
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
        child: Text('Total de pagamentos a receber: ${provider.unreceivedPaymentsFiltered.length}', style: AppTypography.textBodyPurple,)),
        Expanded(
        child: CarouselSlider(
          items: provider.unreceivedPaymentsFiltered.map((element) => Padding(
            padding: EdgeInsets.symmetric(horizontal: CustomWidth.custom(20)),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: CustomHeight.custom(100),
                    decoration: BoxDecoration(
                      color: AppColors.lightPurple.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.wallet, color: AppColors.purple, size: 60),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(element.amount, style: AppTypography.textTitlePurpleSemiBold,),
                            Text(element.nameOfSender.toString(), style: AppTypography.textBodyPurple,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )).toList(),
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