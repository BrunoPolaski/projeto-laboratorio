import 'package:app_facul/app/presentation/widgets/common/custom_rectangle_button_widget.dart';
import 'package:app_facul/app/presentation/layout/custom_layout.dart';
import 'package:app_facul/app/presentation/providers/home_page_provider.dart';
import 'package:app_facul/app/presentation/themes/colors.dart';
import 'package:app_facul/app/presentation/themes/typography.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageProvider>(context);

    return CustomLayout(
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black12,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: (){},
            icon: const Icon(Icons.menu, color: AppColors.purple,),
          ),
          actions: [
            IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: (){},
              icon: const Icon(Icons.notifications_none_outlined, color: AppColors.purple,),
            ),
            IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: (){},
              icon: const Icon(Icons.search, color: AppColors.purple,),
            ),
          ],
        ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
           CustomRectangleButtonWidget(
            height: 110,
            width: MediaQuery.of(context).size.width / 2.5,
             onPressed: (){},
             text: 'Pagamentos recebidos',
             color: AppColors.white,
             textStyle: AppTypography.textBodyPurple,
           ),
           CustomRectangleButtonWidget(
              height: 110,
            width: MediaQuery.of(context).size.width / 2.5,
             onPressed: (){},
             text: 'Pagamentos a receber',
             color: AppColors.purple,
             textStyle: AppTypography.textBodyWhite,
            ),
          ],
        ),
      Expanded(
        child: CarouselSlider(
          items: provider.receivedPayments.map((element) => Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 100,
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
          )).toList(),
          options: CarouselOptions(
            height: 100,
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
      ),
        ],
      ),
      )
      
    );
  }
}